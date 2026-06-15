import VideoCard, { VideoCardSkeleton } from './VideoCard'

/**
 * Carrossel horizontal com scroll snap para uma categoria de vídeos.
 */
export default function MediaCarousel({ title, videos, loading, onPlay }) {
  if (!loading && videos.length === 0) return null

  return (
    <section className="py-6 md:py-8">
      {/* Section Title */}
      <div className="mx-auto max-w-[1440px] px-4 md:px-8">
        <h2 className="mb-4 text-lg font-bold text-white md:mb-6 md:text-xl lg:text-2xl">
          {title}
        </h2>
      </div>

      {/* Scrollable row */}
      <div className="relative">
        {/* Edge fade indicators */}
        <div className="pointer-events-none absolute left-0 top-0 z-10 h-full w-8 bg-gradient-to-r from-surface-900 to-transparent md:w-16" />
        <div className="pointer-events-none absolute right-0 top-0 z-10 h-full w-8 bg-gradient-to-l from-surface-900 to-transparent md:w-16" />

        <div className="scrollbar-hide flex gap-3 overflow-x-auto px-4 pb-4 scroll-smooth snap-x snap-mandatory md:gap-4 md:px-8">
          {loading
            ? Array.from({ length: 8 }).map((_, i) => (
                <VideoCardSkeleton key={i} />
              ))
            : videos.map((video) => (
                <VideoCard key={video.id} video={video} onPlay={onPlay} />
              ))}
        </div>
      </div>
    </section>
  )
}
