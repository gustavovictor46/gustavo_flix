import { useState, useEffect, useRef } from 'react'
import { Link } from 'react-router-dom'

/**
 * Header translúcido com logo, navegação, busca e avatar.
 */
export default function Header({ searchQuery, onSearchChange }) {
  const [scrolled, setScrolled] = useState(false)
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false)
  const [searchOpen, setSearchOpen] = useState(false)
  const searchInputRef = useRef(null)

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 40)
    window.addEventListener('scroll', onScroll, { passive: true })
    return () => window.removeEventListener('scroll', onScroll)
  }, [])

  useEffect(() => {
    if (searchOpen && searchInputRef.current) {
      searchInputRef.current.focus()
    }
  }, [searchOpen])

  const navLinks = [
    { label: 'Início', href: '#inicio' },
    { label: 'Filmes', href: '#filmes' },
    { label: 'Séries', href: '#series' },
  ]

  return (
    <header
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-500 ${
        scrolled
          ? 'glass border-b border-white/5 shadow-2xl shadow-black/30'
          : 'bg-gradient-to-b from-black/70 to-transparent'
      }`}
    >
      <div className="mx-auto flex max-w-[1440px] items-center justify-between px-4 py-3 md:px-8">
        {/* Logo */}
        <Link to="/" className="group flex items-center gap-1 select-none">
          <span className="text-2xl font-black tracking-tight md:text-3xl">
            <span className="text-brand-500 drop-shadow-[0_0_12px_rgba(229,9,20,0.5)] transition-all group-hover:drop-shadow-[0_0_20px_rgba(229,9,20,0.7)]">
              G
            </span>
            <span className="text-white">ustavo</span>
            <span className="text-brand-500 drop-shadow-[0_0_12px_rgba(229,9,20,0.5)] transition-all group-hover:drop-shadow-[0_0_20px_rgba(229,9,20,0.7)]">
              Flix
            </span>
          </span>
        </Link>

        {/* Nav — Desktop */}
        <nav className="hidden items-center gap-8 md:flex" aria-label="Navegação principal">
          {navLinks.map((link) => (
            <a
              key={link.href}
              href={link.href}
              className="relative text-sm font-medium text-gray-300 transition-colors hover:text-white after:absolute after:-bottom-1 after:left-0 after:h-0.5 after:w-0 after:bg-brand-500 after:transition-all after:duration-300 hover:after:w-full"
            >
              {link.label}
            </a>
          ))}
        </nav>

        {/* Right side — Search + Avatar */}
        <div className="flex items-center gap-3">
          {/* Search */}
          <div className="relative flex items-center">
            <button
              onClick={() => setSearchOpen(!searchOpen)}
              className="rounded-full p-2 text-gray-300 transition-colors hover:bg-white/10 hover:text-white"
              aria-label="Buscar"
            >
              <svg className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </button>

            <div
              className={`absolute right-0 top-full mt-2 overflow-hidden transition-all duration-300 md:right-auto md:top-auto md:mt-0 md:relative md:ml-2 ${
                searchOpen
                  ? 'w-56 opacity-100 md:w-64'
                  : 'w-0 opacity-0 pointer-events-none'
              }`}
            >
              <input
                ref={searchInputRef}
                type="text"
                placeholder="Buscar títulos..."
                value={searchQuery}
                onChange={(e) => onSearchChange(e.target.value)}
                className="w-full rounded-lg border border-white/10 bg-surface-800/90 px-4 py-2 text-sm text-white placeholder-gray-500 outline-none backdrop-blur-md transition-all focus:border-brand-500/50 focus:ring-1 focus:ring-brand-500/30"
              />
            </div>
          </div>

          {/* Avatar */}
          <button className="group relative h-8 w-8 overflow-hidden rounded-lg ring-2 ring-transparent transition-all hover:ring-brand-500/60">
            <div className="flex h-full w-full items-center justify-center bg-gradient-to-br from-brand-500 to-accent-500 text-xs font-bold text-white">
              G
            </div>
          </button>

          {/* Mobile Menu Toggle */}
          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="rounded-lg p-2 text-gray-300 transition-colors hover:bg-white/10 hover:text-white md:hidden"
            aria-label="Menu"
          >
            <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              {mobileMenuOpen ? (
                <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
              ) : (
                <path strokeLinecap="round" strokeLinejoin="round" d="M4 6h16M4 12h16M4 18h16" />
              )}
            </svg>
          </button>
        </div>
      </div>

      {/* Mobile Nav */}
      <div
        className={`overflow-hidden transition-all duration-300 md:hidden ${
          mobileMenuOpen ? 'max-h-60 border-t border-white/5' : 'max-h-0'
        }`}
      >
        <nav className="glass flex flex-col gap-1 px-4 py-3" aria-label="Navegação mobile">
          {navLinks.map((link) => (
            <a
              key={link.href}
              href={link.href}
              onClick={() => setMobileMenuOpen(false)}
              className="rounded-lg px-4 py-2.5 text-sm font-medium text-gray-300 transition-colors hover:bg-white/5 hover:text-white"
            >
              {link.label}
            </a>
          ))}
        </nav>
      </div>
    </header>
  )
}
