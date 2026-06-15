import { useParams, useNavigate, Link } from 'react-router-dom'
import { useState, useMemo } from 'react'
import { useVideos } from '../hooks/useVideos'
import VideoPlayerModal from '../components/VideoPlayerModal'

/**
 * Página individual de um filme com detalhes completos.
 */
export default function MoviePage() {
  const { id } = useParams()
  const navigate = useNavigate()
  const { videos, loading } = useVideos()
  const [playing, setPlaying] = useState(false)

  const video = useMemo(
    () => videos.find((v) => String(v.id) === id),
    [videos, id]
  )

  // Filmes relacionados (mesma categoria, excluindo o atual)
  const relatedVideos = useMemo(() => {
    if (!video) return []
    return videos
      .filter((v) => v.categoria === video.categoria && v.id !== video.id)
      .slice(0, 8)
  }, [videos, video])

  // Loading state
  if (loading) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-surface-900">
        <div className="h-10 w-10 animate-spin rounded-full border-2 border-brand-500 border-t-transparent" />
      </div>
    )
  }

  // 404 — Filme não encontrado
  if (!video) {
    return (
      <div className="flex min-h-screen flex-col items-center justify-center bg-surface-900 px-4">
        <svg className="mb-6 h-20 w-20 text-surface-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1}>
          <path strokeLinecap="round" strokeLinejoin="round" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z" />
        </svg>
        <h1 className="mb-2 text-2xl font-bold text-white">Filme não encontrado</h1>
        <p className="mb-8 text-gray-500">O título que você procura não existe no acervo.</p>
        <Link
          to="/"
          className="rounded-lg bg-brand-500 px-6 py-3 text-sm font-bold text-white transition-all hover:bg-brand-400 hover:scale-105"
        >
          Voltar ao Início
        </Link>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-surface-900">
      {/* ── HERO SECTION ──────────────────────────────────────────────── */}
      <section className="relative min-h-[70vh] overflow-hidden md:min-h-[80vh]">
        {/* Background Image */}
        <div className="absolute inset-0">
          <img
            src={video.capa_url}
            alt={video.titulo}
            className="h-full w-full object-cover object-center blur-sm scale-105"
            loading="eager"
          />
          <div className="absolute inset-0 bg-surface-900/70" />
          <div className="gradient-fade-bottom absolute inset-0" />
          <div className="absolute inset-x-0 top-0 h-32 bg-gradient-to-b from-surface-900 to-transparent" />
        </div>

        {/* Back Button */}
        <div className="relative z-20 mx-auto max-w-[1440px] px-4 pt-6 md:px-8">
          <button
            onClick={() => navigate(-1)}
            className="group flex items-center gap-2 rounded-full bg-white/10 px-4 py-2 text-sm font-medium text-gray-300 backdrop-blur-sm transition-all hover:bg-white/20 hover:text-white"
          >
            <svg className="h-4 w-4 transition-transform group-hover:-translate-x-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M15 19l-7-7 7-7" />
            </svg>
            Voltar
          </button>
        </div>

        {/* Content — Poster + Info */}
        <div className="relative z-10 mx-auto flex max-w-[1440px] flex-col items-center gap-8 px-4 pb-16 pt-8 md:flex-row md:items-end md:gap-12 md:px-8 md:pb-24 md:pt-12">
          {/* Poster */}
          <div className="w-56 flex-shrink-0 overflow-hidden rounded-2xl shadow-2xl shadow-black/50 ring-1 ring-white/10 transition-transform hover:scale-105 md:w-72">
            <img
              src={video.capa_url}
              alt={video.titulo}
              className="aspect-[2/3] w-full object-cover"
            />
          </div>

          {/* Film Info */}
          <div className="flex-1 text-center md:text-left">
            {/* Badges */}
            <div className="mb-4 flex flex-wrap items-center justify-center gap-2 md:justify-start">
              <span className="rounded-full bg-brand-500/20 px-3 py-1 text-xs font-semibold uppercase tracking-widest text-brand-400 ring-1 ring-brand-500/30">
                {video.categoria}
              </span>
              {video.ano && (
                <span className="rounded-full bg-white/10 px-3 py-1 text-xs font-semibold text-gray-300 ring-1 ring-white/10">
                  {video.ano}
                </span>
              )}
              {video.qualidade && (
                <span className="rounded-full bg-white/10 px-2.5 py-1 text-[10px] font-bold uppercase text-gray-400 ring-1 ring-white/10">
                  {video.qualidade}
                </span>
              )}
            </div>

            {/* Title */}
            <h1 className="text-shadow-hero mb-4 text-3xl font-black leading-tight tracking-tight md:text-5xl lg:text-6xl">
              {video.titulo}
            </h1>

            {/* Description */}
            <p className="mx-auto mb-8 max-w-2xl text-base leading-relaxed text-gray-300 md:mx-0 md:text-lg">
              {video.descricao}
            </p>

            {/* CTA Buttons */}
            <div className="flex flex-wrap items-center justify-center gap-3 md:justify-start">
              <button
                onClick={() => setPlaying(true)}
                className="group flex items-center gap-2.5 rounded-xl bg-brand-500 px-8 py-4 text-base font-bold text-white shadow-lg shadow-brand-500/25 transition-all duration-300 hover:bg-brand-400 hover:shadow-xl hover:shadow-brand-500/40 hover:scale-105 active:scale-95"
              >
                <svg className="h-6 w-6 transition-transform group-hover:scale-110" viewBox="0 0 24 24" fill="currentColor">
                  <path d="M8 5v14l11-7z" />
                </svg>
                Assistir Agora
              </button>

              <Link
                to="/"
                className="flex items-center gap-2 rounded-xl border border-white/20 bg-white/10 px-6 py-4 text-sm font-semibold text-white backdrop-blur-sm transition-all duration-300 hover:bg-white/20 hover:border-white/30 hover:scale-105 active:scale-95"
              >
                <svg className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M4 6h16M4 10h16M4 14h16M4 18h16" />
                </svg>
                Ver Catálogo
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* ── DETAILS SECTION ───────────────────────────────────────────── */}
      <section className="relative z-10 -mt-8 pb-12">
        <div className="mx-auto max-w-[1440px] px-4 md:px-8">
          {/* Info Grid */}
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <InfoCard
              icon={<path strokeLinecap="round" strokeLinejoin="round" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />}
              label="Ano"
              value={video.ano || '—'}
            />
            <InfoCard
              icon={<path strokeLinecap="round" strokeLinejoin="round" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z" />}
              label="Categoria"
              value={video.categoria}
            />
            <InfoCard
              icon={<path strokeLinecap="round" strokeLinejoin="round" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />}
              label="Qualidade"
              value={video.qualidade || '—'}
            />
            <InfoCard
              icon={<path strokeLinecap="round" strokeLinejoin="round" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z" />}
              label="Destaque"
              value={video.em_destaque ? 'Sim' : 'Não'}
            />
          </div>
        </div>
      </section>

      {/* ── RELATED FILMS ─────────────────────────────────────────────── */}
      {relatedVideos.length > 0 && (
        <section className="pb-12">
          <div className="mx-auto max-w-[1440px] px-4 md:px-8">
            <h2 className="mb-6 text-xl font-bold text-white md:text-2xl">
              Mais em {video.categoria}
            </h2>
          </div>

          <div className="relative">
            <div className="pointer-events-none absolute left-0 top-0 z-10 h-full w-8 bg-gradient-to-r from-surface-900 to-transparent md:w-16" />
            <div className="pointer-events-none absolute right-0 top-0 z-10 h-full w-8 bg-gradient-to-l from-surface-900 to-transparent md:w-16" />

            <div className="flex gap-3 overflow-x-auto px-4 pb-4 scroll-smooth md:gap-4 md:px-8">
              {relatedVideos.map((v) => (
                <Link
                  key={v.id}
                  to={`/filme/${v.id}`}
                  className="group relative flex-shrink-0 w-[160px] overflow-hidden rounded-xl border border-white/5 bg-surface-800 shadow-lg transition-all duration-300 hover:scale-110 hover:border-brand-500/30 hover:shadow-2xl hover:shadow-brand-500/10 hover:z-10 sm:w-[200px] md:w-[220px]"
                >
                  <div className="relative aspect-[2/3] w-full overflow-hidden">
                    <img
                      src={v.capa_url}
                      alt={v.titulo}
                      className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-110"
                      loading="lazy"
                    />
                    <div className="absolute inset-0 flex items-center justify-center bg-black/0 transition-all duration-300 group-hover:bg-black/40">
                      <div className="flex h-12 w-12 items-center justify-center rounded-full bg-brand-500/90 opacity-0 scale-75 transition-all duration-300 group-hover:opacity-100 group-hover:scale-100">
                        <svg className="ml-0.5 h-5 w-5 text-white" viewBox="0 0 24 24" fill="currentColor">
                          <path d="M8 5v14l11-7z" />
                        </svg>
                      </div>
                    </div>
                    <div className="absolute inset-x-0 bottom-0 h-20 bg-gradient-to-t from-surface-900 via-surface-900/80 to-transparent opacity-0 transition-opacity duration-300 group-hover:opacity-100" />
                  </div>
                  <div className="absolute inset-x-0 bottom-0 translate-y-2 p-3 opacity-0 transition-all duration-300 group-hover:translate-y-0 group-hover:opacity-100">
                    <h3 className="truncate text-sm font-bold text-white">{v.titulo}</h3>
                    <span className="text-[11px] text-brand-400">{v.ano}</span>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        </section>
      )}

      {/* Footer */}
      <footer className="border-t border-white/5 py-8">
        <div className="mx-auto max-w-[1440px] px-4 text-center md:px-8">
          <p className="text-xs text-gray-600">
            © {new Date().getFullYear()}{' '}
            <span className="font-semibold text-gray-500">GustavoFlix</span>. Todos
            os direitos reservados.
          </p>
        </div>
      </footer>

      {/* Video Player Modal */}
      {playing && (
        <VideoPlayerModal video={video} onClose={() => setPlaying(false)} />
      )}
    </div>
  )
}

/**
 * Card de informação com ícone.
 */
function InfoCard({ icon, label, value }) {
  return (
    <div className="flex items-center gap-4 rounded-xl border border-white/5 bg-surface-800/50 p-4 backdrop-blur-sm">
      <div className="flex h-10 w-10 flex-shrink-0 items-center justify-center rounded-lg bg-brand-500/10">
        <svg className="h-5 w-5 text-brand-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
          {icon}
        </svg>
      </div>
      <div>
        <p className="text-[11px] font-medium uppercase tracking-wider text-gray-500">{label}</p>
        <p className="text-sm font-semibold text-white">{value}</p>
      </div>
    </div>
  )
}
