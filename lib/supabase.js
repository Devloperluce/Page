import { createClient } from '@supabase/supabase-js';

// 서버(서버리스 함수)에서만 사용. service_role 키는 절대 클라이언트로 노출하지 말 것.
export const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { auth: { persistSession: false } }
);
