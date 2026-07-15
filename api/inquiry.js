import { supabase } from '../lib/supabase.js';
import { Resend } from 'resend';

// POST /api/inquiry  — 교육 문의 접수 → DB 저장 (+ 담당자 알림 메일)
export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { company, name, phone, email, course, message } = req.body || {};
  if (!company || !name || !phone) {
    return res.status(400).json({ error: '회사명·담당자명·연락처는 필수입니다.' });
  }

  const { data, error } = await supabase
    .from('inquiries')
    .insert({
      company,
      name,
      phone,
      email: email || null,
      course: course || null,
      message: message || null,
      user_agent: req.headers['user-agent'] || null,
    })
    .select('id')
    .single();

  if (error) {
    console.error('inquiry insert failed:', error);
    return res.status(500).json({ error: '문의 저장에 실패했습니다.' });
  }

  // 담당자 알림 메일(선택): 키가 설정된 경우에만 발송, 실패해도 접수는 성공 처리
  if (process.env.RESEND_API_KEY && process.env.NOTIFY_EMAIL && process.env.MAIL_FROM) {
    try {
      const resend = new Resend(process.env.RESEND_API_KEY);
      await resend.emails.send({
        from: process.env.MAIL_FROM,
        to: process.env.NOTIFY_EMAIL,
        subject: `[교육문의] ${company} · ${name}`,
        text:
          `새 교육 문의가 접수되었습니다.\n\n` +
          `회사명: ${company}\n담당자: ${name}\n연락처: ${phone}\n` +
          `이메일: ${email || '-'}\n관심 과정: ${course || '-'}\n\n` +
          `문의 내용:\n${message || '-'}`,
      });
    } catch (e) {
      console.error('notify mail failed:', e);
    }
  }

  return res.status(200).json({ ok: true, id: data.id });
}
