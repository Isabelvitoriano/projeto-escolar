import { useEffect, useState } from 'react'
import { Outlet, useLocation } from 'react-router-dom'
import Header from '../Header/Header.jsx'
import { api } from '../../services/api.js'

function AppLayout() {
  const { pathname } = useLocation()
  const [contadores, setContadores] = useState({ alunos: 0, cursos: 0, matriculas: 0 })

  async function atualizarContadores() {
    try {
      const [a, c, m] = await Promise.all([
        api.listar('alunos'),
        api.listar('cursos'),
        api.listar('matriculas'),
      ])
      setContadores({ alunos: a.length, cursos: c.length, matriculas: m.length })
    } catch (erro) {
      console.error(erro)
    }
  }

  useEffect(() => {
    atualizarContadores()
  }, [pathname])

  return (
    <>
      <Header contadores={contadores} aoReiniciar={() => console.log('reiniciar')} />
      <main className='conteudo'>
        <Outlet context={{ atualizarContadores }} />
      </main>
    </>
  )
}

export default AppLayout