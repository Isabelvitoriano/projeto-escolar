import { useState } from 'react'
import { ConfigProvider } from 'antd'
import './global.css'
import Header from './components/Header/Header.jsx'
import Alunos from './pages/Alunos/Alunos.jsx'

function App() {
    const [paginaAtual, setPaginaAtual] = useState('alunos')
    const contadores = {alunos: 4, cursos: 3, matriculas: 4}

    return (
        <ConfigProvider
            theme={{token: {colorPrimary: '#0c84f3', fontFamily: "'Poopins', sans-serif"}}}
        >
            <Header
                paginaAtual={paginaAtual}
                aoMudarPagina={setPaginaAtual}
                contadores={contadores}
                aoReinciar={() => console.log('reiniciar: ainda sem função')}
            />

            <main className='conteudo'>
                {paginaAtual === 'alunos' && <Alunos/>}
                {paginaAtual === 'cursos' && <h2>Página de Curso</h2>}
                {paginaAtual === 'matriculas' && <h2>Página de Matrículas</h2>}
            </main>
        </ConfigProvider>
    )
}

export default App;