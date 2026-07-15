import { supabase } from '../lib/supabase.js';
import { Resend } from 'resend';

// POST /api/brochure — 교육 소개서 요청 → DB 저장 + 요청 이메일로 PDF 발송
export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { company, dept, name, email } = req.body || {};
  if (!company || !dept || !name || !email) {
    return res.status(400).json({ error: '회사명·부서·이름·이메일은 필수입니다.' });
  }

  const { data, error } = await supabase
    .from('brochure_requests')
    .insert({
      company,
      dept,
      name,
      email,
      user_agent: req.headers['user-agent'] || null,
    })
    .select('id')
    .single();

  if (error) {
    console.error('brochure insert failed:', error);
    return res.status(500).json({ error: '요청 저장에 실패했습니다.' });
  }

  // 메일 미설정 시에도 요청은 저장됨(담당자가 수동 발송 가능)
  if (!process.env.RESEND_API_KEY || !process.env.MAIL_FROM) {
    return res.status(200).json({ ok: true, id: data.id, mailed: false });
  }

  try {
    const resend = new Resend(process.env.RESEND_API_KEY);

    // 배포된 정적 파일에서 소개서 PDF를 가져와 첨부
    const proto = req.headers['x-forwarded-proto'] || 'https';
    const host = req.headers['x-forwarded-host'] || req.headers.host;
    const pdfUrl = process.env.BROCHURE_URL || `${proto}://${host}/assets/education-brochure.pdf`;

    const pdfRes = await fetch(pdfUrl);
    if (!pdfRes.ok) throw new Error(`PDF fetch failed: ${pdfRes.status}`);
    const pdfBuffer = Buffer.from(await pdfRes.arrayBuffer());

    await resend.emails.send({
      from: process.env.MAIL_FROM,
      to: email,
      subject: '[빅스데이터] 교육 소개서를 보내드립니다',
      text:
        `${name}님, 안녕하세요.\n\n` +
        `요청하신 빅스데이터 교육 소개서(PDF)를 첨부해 드립니다.\n` +
        `교육 관련 문의는 회신 또는 02-559-5317로 연락 주세요.\n\n` +
        `감사합니다.\n빅스데이터 교육센터`,
      attachments: [{ filename: '빅스데이터_교육소개서.pdf', content: pdfBuffer }],
    });

    // 발송 완료 표시
    await supabase.from('brochure_requests').update({ sent: true }).eq('id', data.id);
  } catch (e) {
    console.error('brochure mail failed:', e);
    // 저장은 됐으므로 200 (담당자가 후속 발송). 프런트는 성공 처리.
    return res.status(200).json({ ok: true, id: data.id, mailed: false });
  }

  return res.status(200).json({ ok: true, id: data.id, mailed: true });
}
