/**
 * Card individual de vídeo com efeito de hover premium.
 */
export default function VideoCard({ video, onPlay }) {
  return (
    <button
      onClick={() => onPlay(video)}
      className="group relative flex-shrink-0 w-[160px] cursor-pointer overflow-hidden rounded-xl border border-white/5 bg-surface-800 shadow-lg transition-all duration-300 hover:scale-110 hover:border-brand-500/30 hover:shadow-2xl hover:shadow-brand-500/10 hover:z-10 focus:outline-none focus:ring-2 focus:ring-brand-500/50 sm:w-[200px] md:w-[220px] lg:w-[240px]"
      aria-label={`Assistir ${video.titulo}`}
    >
      {/* Thumbnail */}
      <div className="relative aspect-[2/3] w-full overflow-hidden">
        <img
          src={video.capa_url}
          alt={video.titulo}
          className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-110"
          loading="lazy"
        />

        {/* Play overlay on hover */}
        <div className="absolute inset-0 flex items-center justify-center bg-black/0 transition-all duration-300 group-hover:bg-black/40">
          <div className="flex h-14 w-14 items-center justify-center rounded-full bg-brand-500/90 opacity-0 shadow-xl shadow-brand-500/30 transition-all duration-300 group-hover:opacity-100 group-hover:scale-100 scale-75">
            <svg className="ml-1 h-6 w-6 text-white" viewBox="0 0 24 24" fill="currentColor">
              <path d="M8 5v14l11-7z" />
            </svg>
          </div>
        </div>

        {/* Bottom gradient for text */}
        <div className="absolute inset-x-0 bottom-0 h-24 bg-gradient-to-t from-surface-900 via-surface-900/80 to-transparent opacity-0 transition-opacity duration-300 group-hover:opacity-100" />
      </div>

      {/* Info — visible on hover */}
      <div className="absolute inset-x-0 bottom-0 translate-y-2 p-3 opacity-0 transition-all duration-300 group-hover:translate-y-0 group-hover:opacity-100">
        <h3 className="truncate text-sm font-bold text-white">{video.titulo}</h3>
        <div className="mt-0.5 flex items-center gap-2">
          <span className="text-[11px] font-medium uppercase tracking-wider text-brand-400">
            {video.ano || ''}
          </span>
          {video.qualidade && (
            <span className="rounded bg-white/15 px-1 py-0.5 text-[9px] font-bold uppercase text-gray-300">
              {video.qualidade}
            </span>
          )}
        </div>
      </div>
    </button>
  )
}

/**
 * Skeleton placeholder para loading state.
 */
export function VideoCardSkeleton() {
  return (
    <div className="flex-shrink-0 w-[160px] overflow-hidden rounded-xl border border-white/5 bg-surface-800 sm:w-[200px] md:w-[220px] lg:w-[240px]">
      <div className="skeleton-pulse aspect-[2/3] w-full rounded-xl" />
    </div>
  )
}
