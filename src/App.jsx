import { useState, useMemo } from 'react'
import Header from './components/Header'
import HeroBanner from './components/HeroBanner'
import MediaCarousel from './components/MediaCarousel'
import VideoPlayerModal from './components/VideoPlayerModal'
import { useVideos } from './hooks/useVideos'

export default function App() {
  const { videos, loading, error } = useVideos()
  const [searchQuery, setSearchQuery] = useState('')
  const [selectedVideo, setSelectedVideo] = useState(null)

  // Filtrar vídeos pela busca
  const filteredVideos = useMemo(() => {
    if (!searchQuery.trim()) return videos
    const query = searchQuery.toLowerCase().trim()
    return videos.filter(
      (v) =>
        v.titulo.toLowerCase().includes(query) ||
        v.categoria.toLowerCase().includes(query)
    )
  }, [videos, searchQuery])

  // Vídeo em destaque (primeiro com em_destaque=true ou o primeiro da lista)
  const featuredVideo = useMemo(
    () => videos.find((v) => v.em_destaque) || videos[0],
    [videos]
  )

  // Agrupar vídeos por categoria para os carrosséis
  const videosByCategory = useMemo(() => {
    const groups = {}
    filteredVideos.forEach((video) => {
      if (!groups[video.categoria]) {
        groups[video.categoria] = []
      }
      groups[video.categoria].push(video)
    })
    return groups
  }, [filteredVideos])

  const handlePlay = (video) => setSelectedVideo(video)
  const handleClosePlayer = () => setSelectedVideo(null)

  return (
    <div className="min-h-screen bg-surface-900">
      {/* Header */}
      <Header searchQuery={searchQuery} onSearchChange={setSearchQuery} />

      {/* Hero Banner */}
      {!searchQuery && (
        <HeroBanner
          video={featuredVideo}
          onPlay={handlePlay}
          onInfo={(video) => {
            /* Futuro: abrir modal de detalhes */
          }}
        />
      )}

      {/* Main Content */}
      <main
        id="filmes"
        className={`relative z-10 ${searchQuery ? 'pt-24' : '-mt-16'}`}
      >
        {/* Error Banner */}
        {error && (
          <div className="mx-auto max-w-[1440px] px-4 pt-4 md:px-8">
            <div className="rounded-xl border border-yellow-500/20 bg-yellow-500/10 px-4 py-3 text-sm text-yellow-200">
              <span className="font-semibold">⚠ Aviso:</span> Não foi possível
              conectar ao Supabase ({error}). Exibindo dados de demonstração.
            </div>
          </div>
        )}

        {/* Search Results Info */}
        {searchQuery && (
          <div className="mx-auto max-w-[1440px] px-4 pb-2 md:px-8">
            <p className="text-sm text-gray-400">
              {filteredVideos.length === 0 ? (
                <>
                  Nenhum resultado para{' '}
                  <span className="font-semibold text-white">"{searchQuery}"</span>
                </>
              ) : (
                <>
                  {filteredVideos.length} resultado{filteredVideos.length !== 1 && 's'} para{' '}
                  <span className="font-semibold text-white">"{searchQuery}"</span>
                </>
              )}
            </p>
          </div>
        )}

        {/* "Todos os Títulos" Carousel — when searching */}
        {searchQuery && filteredVideos.length > 0 && (
          <MediaCarousel
            title="Resultados da Busca"
            videos={filteredVideos}
            loading={false}
            onPlay={handlePlay}
          />
        )}

        {/* Category Carousels — when NOT searching */}
        {!searchQuery && (
          <>
            {/* All videos row */}
            <MediaCarousel
              title="Em Alta"
              videos={filteredVideos}
              loading={loading}
              onPlay={handlePlay}
            />

            {/* Per-category rows */}
            {Object.entries(videosByCategory).map(([category, vids]) => (
              <MediaCarousel
                key={category}
                title={category}
                videos={vids}
                loading={loading}
                onPlay={handlePlay}
              />
            ))}
          </>
        )}

        {/* Empty State — No results and not loading */}
        {!loading && filteredVideos.length === 0 && searchQuery && (
          <div className="flex flex-col items-center justify-center py-32">
            <svg className="mb-4 h-16 w-16 text-surface-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z" />
            </svg>
            <p className="text-lg font-semibold text-gray-500">Nenhum título encontrado</p>
            <p className="mt-1 text-sm text-gray-600">Tente buscar por outro termo</p>
          </div>
        )}
      </main>

      {/* Footer */}
      <footer id="series" className="border-t border-white/5 py-8 mt-16">
        <div className="mx-auto max-w-[1440px] px-4 text-center md:px-8">
          <p className="text-xs text-gray-600">
            © {new Date().getFullYear()}{' '}
            <span className="font-semibold text-gray-500">GustavoFlix</span>. Todos
            os direitos reservados. Projeto educacional.
          </p>
        </div>
      </footer>

      {/* Video Player Modal */}
      {selectedVideo && (
        <VideoPlayerModal video={selectedVideo} onClose={handleClosePlayer} />
      )}
    </div>
  )
}
