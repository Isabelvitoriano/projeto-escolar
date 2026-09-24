import { Navigate, Route, Routes } from 'react-router-dom'
import { App as AntApp, ConfigProvider } from 'antd'
import AppLayout from './components/AppLayout/AppLayout.jsx'
import NaoEncontrado from './components/NaoEncontrado/NaoEncontrado.jsx'
import Alunos from './pages/Alunos/Alunos.jsx'
import AlunoForm from './pages/Alunos/AlunoForm.jsx'
import Cursos from './pages/Cursos/Cursos.jsx'
import CursoForm from './pages/Cursos/CursoForm.jsx'
import Matriculas from './pages/Matriculas/Matriculas.jsx'
import MatriculaForm from './pages/Matriculas/MatriculaForm.jsx'

function App() {
  return (
    <ConfigProvider
      theme={{ token: { colorPrimary: '#0c84f3', fontFamily: "'Poppins', sans-serif" } }}
    >
      <AntApp>
        <Routes>
          <Route element={<AppLayout />}>
            <Route index element={<Navigate to='/alunos' replace />} />
            <Route path='alunos' element={<Alunos />} />
            <Route path='alunos/novo' element={<AlunoForm />} />
            <Route path='alunos/:id/editar' element={<AlunoForm />} />
            <Route path='cursos' element={<Cursos />} />
            <Route path='cursos/novo' element={<CursoForm />} />
            <Route path='cursos/:id/editar' element={<CursoForm />} />
            <Route path='matriculas' element={<Matriculas />} />
            <Route path='matriculas/novo' element={<MatriculaForm />} />
            <Route path='matriculas/:id/editar' element={<MatriculaForm />} />
            <Route path='*' element={<NaoEncontrado />} />
          </Route>
        </Routes>
      </AntApp>
    </ConfigProvider>
  )
}

export default App