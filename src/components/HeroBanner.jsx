/**
 * Hero Banner — Destaque principal com imagem de fundo, gradientes e CTAs.
 */
export default function HeroBanner({ video, onPlay, onInfo }) {
  if (!video) return null

  return (
    <section
      id="inicio"
      className="relative flex min-h-[85vh] items-end overflow-hidden md:min-h-screen"
    >
      {/* Background Image */}
      <div className="absolute inset-0">
        <img
          src={video.capa_url}
          alt={video.titulo}
          className="h-full w-full object-cover object-center"
          loading="eager"
        />
        {/* Gradient overlays */}
        <div className="gradient-fade-bottom absolute inset-0" />
        <div className="gradient-fade-left absolute inset-0" />
        {/* Extra vignette at top for header readability */}
        <div className="absolute inset-x-0 top-0 h-40 bg-gradient-to-b from-black/60 to-transparent" />
      </div>

      {/* Content */}
      <div className="relative z-10 mx-auto w-full max-w-[1440px] px-4 pb-16 md:px-8 md:pb-24">
        {/* Category Badge */}
        <span className="mb-4 inline-block rounded-full bg-brand-500/20 px-3 py-1 text-xs font-semibold uppercase tracking-widest text-brand-400 ring-1 ring-brand-500/30 backdrop-blur-sm">
          {video.categoria}
        </span>

        {/* Title */}
        <h1 className="text-shadow-hero mb-4 max-w-2xl text-4xl font-black leading-tight tracking-tight md:text-6xl lg:text-7xl">
          {video.titulo}
        </h1>

        {/* Description */}
        <p className="mb-8 max-w-xl text-sm leading-relaxed text-gray-300 md:text-base lg:text-lg">
          {video.descricao}
        </p>

        {/* CTA Buttons */}
        <div className="flex flex-wrap gap-3">
          <button
            onClick={() => onPlay(video)}
            className="group flex items-center gap-2 rounded-lg bg-brand-500 px-6 py-3 text-sm font-bold text-white shadow-lg shadow-brand-500/25 transition-all duration-300 hover:bg-brand-400 hover:shadow-xl hover:shadow-brand-500/40 hover:scale-105 active:scale-95 md:px-8 md:py-3.5 md:text-base"
          >
            <svg className="h-5 w-5 transition-transform group-hover:scale-110" viewBox="0 0 24 24" fill="currentColor">
              <path d="M8 5v14l11-7z" />
            </svg>
            Assistir
          </button>

          <button
            onClick={() => onInfo(video)}
            className="flex items-center gap-2 rounded-lg border border-white/20 bg-white/10 px-6 py-3 text-sm font-semibold text-white backdrop-blur-sm transition-all duration-300 hover:bg-white/20 hover:border-white/30 hover:scale-105 active:scale-95 md:px-8 md:py-3.5 md:text-base"
          >
            <svg className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            Mais Informações
          </button>
        </div>
      </div>
    </section>
  )
}
