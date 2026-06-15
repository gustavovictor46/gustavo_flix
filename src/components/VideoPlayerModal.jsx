import { useEffect, useRef, useCallback } from 'react'

/**
 * Modal fullscreen com player de vídeo HTML5.
 */
export default function VideoPlayerModal({ video, onClose }) {
  const videoRef = useRef(null)
  const modalRef = useRef(null)

  // Fechar com Escape
  const handleKeyDown = useCallback(
    (e) => {
      if (e.key === 'Escape') onClose()
    },
    [onClose]
  )

  useEffect(() => {
    document.addEventListener('keydown', handleKeyDown)
    document.body.style.overflow = 'hidden'

    return () => {
      document.removeEventListener('keydown', handleKeyDown)
      document.body.style.overflow = ''
    }
  }, [handleKeyDown])

  // Auto-play ao abrir
  useEffect(() => {
    if (videoRef.current) {
      videoRef.current.play().catch(() => {
        // Autoplay bloqueado pelo browser — ok, user clica play
      })
    }
  }, [video])

  // Click fora do player fecha o modal
  const handleBackdropClick = (e) => {
    if (e.target === modalRef.current) onClose()
  }

  if (!video) return null

  return (
    <div
      ref={modalRef}
      onClick={handleBackdropClick}
      className="fixed inset-0 z-[100] flex items-center justify-center bg-black/95 backdrop-blur-md animate-in fade-in"
      role="dialog"
      aria-modal="true"
      aria-label={`Assistindo ${video.titulo}`}
    >
      {/* Close Button */}
      <button
        onClick={onClose}
        className="absolute right-4 top-4 z-10 rounded-full bg-white/10 p-2.5 text-white transition-all hover:bg-white/20 hover:scale-110 active:scale-95 md:right-8 md:top-8"
        aria-label="Fechar player"
      >
        <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
          <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>

      {/* Video Info Bar */}
      <div className="absolute left-4 top-4 z-10 max-w-md md:left-8 md:top-8">
        <h2 className="text-lg font-bold text-white md:text-2xl">{video.titulo}</h2>
        <span className="mt-1 inline-block text-xs font-medium uppercase tracking-wider text-brand-400">
          {video.categoria}
        </span>
      </div>

      {/* Player Container */}
      <div className="relative w-full max-w-6xl px-4 md:px-8">
        <div className="relative overflow-hidden rounded-2xl bg-black shadow-2xl shadow-black/50 ring-1 ring-white/10">
          <video
            ref={videoRef}
            src={video.video_url}
            controls
            controlsList="nodownload"
            playsInline
            className="aspect-video w-full"
            poster={video.capa_url}
          >
            Seu navegador não suporta o elemento de vídeo.
          </video>
        </div>

        {/* Video Description below player */}
        <p className="mt-4 text-center text-sm text-gray-400 md:text-base">
          {video.descricao}
        </p>
      </div>
    </div>
  )
}
