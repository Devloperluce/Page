// GET /api/config — 클라이언트(admin)용 공개 설정 (anon 키는 공개 안전)
export default function handler(req, res) {
  res.status(200).json({
    url: process.env.SUPABASE_URL || '',
    anonKey: process.env.SUPABASE_ANON_KEY || '',
  });
}
