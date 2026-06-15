import { useEffect } from 'react'
import { useLocation } from 'react-router-dom'

/**
 * Scroll para o topo ao navegar entre páginas.
 */
export default function ScrollToTop() {
  const { pathname } = useLocation()

  useEffect(() => {
    window.scrollTo(0, 0)
  }, [pathname])

  return null
}
