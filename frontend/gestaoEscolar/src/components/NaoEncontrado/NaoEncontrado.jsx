import { Button, Result } from 'antd'
import { useNavigate } from 'react-router-dom'

function NaoEncontrado({ titulo = 'Página não encontrada', voltarPara = '/alunos' }) {
  const navigate = useNavigate()

  return (
    <Result
      status='404'
      title={titulo}
      extra={<Button type='primary' onClick={() => navigate(voltarPara)}>Voltar</Button>}
    />
  )
}

export default NaoEncontrado