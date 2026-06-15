import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

const isConfigured = Boolean(supabaseUrl && supabaseAnonKey)

if (!isConfigured) {
  console.warn(
    '[GustavoFlix] Variáveis de ambiente do Supabase não configuradas. ' +
    'Defina VITE_SUPABASE_URL e VITE_SUPABASE_ANON_KEY no arquivo .env.local'
  )
}

// Só cria o client se as variáveis existirem — createClient('','') lança erro
export const supabase = isConfigured
  ? createClient(supabaseUrl, supabaseAnonKey)
  : null

export { isConfigured as supabaseConfigured }
