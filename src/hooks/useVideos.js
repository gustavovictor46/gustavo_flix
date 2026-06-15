import { useState, useEffect } from 'react'
import { supabase, supabaseConfigured } from '../lib/supabase'

// Dados mock para desenvolvimento sem Supabase configurado
const MOCK_VIDEOS = [
  {
    id: 1,
    titulo: 'Horizonte Perdido',
    descricao: 'Em um futuro distante, a humanidade precisa encontrar um novo lar entre as estrelas. Uma tripulação corajosa embarca em uma missão sem precedentes rumo ao desconhecido.',
    capa_url: 'https://images.unsplash.com/photo-1534796636912-3b95b3ab5986?w=800&q=80',
    video_url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    categoria: 'Ficção Científica',
    em_destaque: true,
  },
  {
    id: 2,
    titulo: 'Sombras da Noite',
    descricao: 'Um detetive atormentado pelo passado investiga uma série de crimes misteriosos em uma cidade mergulhada na escuridão.',
    capa_url: 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=800&q=80',
    video_url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    categoria: 'Suspense',
    em_destaque: false,
  },
  {
    id: 3,
    titulo: 'Além das Montanhas',
    descricao: 'Uma jornada épica através de paisagens deslumbrantes e culturas ancestrais, seguindo dois viajantes em busca de respostas.',
    capa_url: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&q=80',
    video_url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    categoria: 'Aventura',
    em_destaque: false,
  },
  {
    id: 4,
    titulo: 'Código Vermelho',
    descricao: 'Quando um vírus digital ameaça colapsar toda a infraestrutura global, apenas um grupo de hackers pode salvar o mundo.',
    capa_url: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=800&q=80',
    video_url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    categoria: 'Ação',
    em_destaque: false,
  },
  {
    id: 5,
    titulo: 'O Último Refúgio',
    descricao: 'Após um evento catastrófico, sobreviventes se reúnem em uma fortaleza isolada. Mas os maiores perigos estão dentro dos muros.',
    capa_url: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=800&q=80',
    video_url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    categoria: 'Drama',
    em_destaque: false,
  },
  {
    id: 6,
    titulo: 'Galáxia Interior',
    descricao: 'Uma cientista brilhante descobre que a chave para viagens interestelares pode estar escondida dentro da mente humana.',
    capa_url: 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?w=800&q=80',
    video_url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
    categoria: 'Ficção Científica',
    em_destaque: false,
  },
  {
    id: 7,
    titulo: 'Ruas de Tóquio',
    descricao: 'Nas vibrantes ruas de Tóquio, um chef brasileiro luta para conquistar seu espaço na gastronomia japonesa.',
    capa_url: 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800&q=80',
    video_url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
    categoria: 'Drama',
    em_destaque: false,
  },
  {
    id: 8,
    titulo: 'Tempestade Polar',
    descricao: 'Uma equipe de resgate enfrenta condições extremas no Ártico para salvar os sobreviventes de um acidente aéreo.',
    capa_url: 'https://images.unsplash.com/photo-1477346611705-65d1883cee1e?w=800&q=80',
    video_url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
    categoria: 'Ação',
    em_destaque: false,
  },
  {
    id: 9,
    titulo: 'Sussurros do Passado',
    descricao: 'Uma historiadora descobre manuscritos antigos que revelam segredos capazes de mudar a história conhecida.',
    capa_url: 'https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=800&q=80',
    video_url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4',
    categoria: 'Suspense',
    em_destaque: false,
  },
  {
    id: 10,
    titulo: 'Aurora Digital',
    descricao: 'No ano de 2087, a linha entre humanos e inteligência artificial se torna cada vez mais tênue.',
    capa_url: 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=800&q=80',
    video_url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
    categoria: 'Ficção Científica',
    em_destaque: false,
  },
]

/**
 * Hook para buscar vídeos do Supabase.
 * Caso a conexão falhe ou o Supabase não esteja configurado, utiliza dados mock.
 */
export function useVideos() {
  const [videos, setVideos] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    let cancelled = false

    async function fetchVideos() {
      try {
        setLoading(true)
        setError(null)

        // Tenta buscar do Supabase
        if (!supabaseConfigured) {
          // Supabase não configurado — usa mock
          if (!cancelled) {
            setVideos(MOCK_VIDEOS)
            setLoading(false)
          }
          return
        }

        const { data, error: supaError } = await supabase
          .from('videos')
          .select('id, titulo, descricao, capa_url, video_url, categoria, em_destaque')
          .order('em_destaque', { ascending: false })
          .order('titulo', { ascending: true })

        if (supaError) throw supaError

        if (!cancelled) {
          setVideos(data?.length ? data : MOCK_VIDEOS)
        }
      } catch (err) {
        console.error('[GustavoFlix] Erro ao buscar vídeos:', err)
        if (!cancelled) {
          setError(err.message)
          setVideos(MOCK_VIDEOS) // Fallback para mock
        }
      } finally {
        if (!cancelled) setLoading(false)
      }
    }

    fetchVideos()
    return () => { cancelled = true }
  }, [])

  return { videos, loading, error }
}
