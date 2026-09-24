import { useNavigate, useOutletContext } from 'react-router-dom'
import { useEffect, useState } from 'react'
import { App as AntApp, Button, Input, Popconfirm, Space, Table, Typography } from 'antd'
import { api, mensagemDeErro } from '../../services/api.js'
import { formatarData, formatarMoeda, idDe } from '../../utils/formatar.js'
import Pesquisar from '../../assets/pesquisar.svg?react'

function Matriculas() {
  const navigate = useNavigate()
  const { message } = AntApp.useApp()
  const [matriculas, setMatriculas] = useState([])
  const [alunos, setAlunos] = useState([])
  const [cursos, setCursos] = useState([])
  const [carregando, setCarregando] = useState(true)
  const [busca, setBusca] = useState('')

  async function carregar() {
    try {
      const [m, a, c] = await Promise.all([
        api.listar('matriculas'),
        api.listar('alunos'),
        api.listar('cursos'),
      ])
      setMatriculas(m)
      setAlunos(a)
      setCursos(c)
    } catch (erro) {
      message.error(mensagemDeErro(erro, 'Não foi possível carregar as matrículas.'))
    } finally {
      setCarregando(false)
    }
  }

  useEffect(() => {
    carregar()
  }, [])

  async function excluir(id) {
    try {
      await api.excluir('matriculas', id)
      message.success('Matrícula removida')
      setCarregando(true)
      carregar()
    } catch (erro) {
      message.error(mensagemDeErro(erro, 'Não foi possível remover a matrícula.'))
    }
  }

  const nomeAluno = (m) => alunos.find((a) => a.id === idDe(m.aluno))?.nome ?? '-'
  const tituloCurso = (m) => cursos.find((c) => c.id === idDe(m.curso))?.titulo ?? '-'

  const termo = busca.trim().toLowerCase()
  const filtradas = matriculas.filter(
    (m) =>
      String(m.id) === termo ||
      nomeAluno(m).toLowerCase().includes(termo) ||
      tituloCurso(m).toLowerCase().includes(termo)
  )

  const colunas = [
    { title: 'ID', dataIndex: 'id', width: 70 },
    { title: 'Aluno', render: (_, m) => nomeAluno(m) },
    { title: 'Curso', render: (_, m) => tituloCurso(m) },
    { title: 'Data', dataIndex: 'dataMatricula', render: formatarData },
    { title: 'Valor pago', dataIndex: 'valorPago', render: formatarMoeda },
    {
      title: 'Ações',
      render: (_, m) => (
        <Space>
          <Button size='small' onClick={() => navigate(`/matriculas/${m.id}/editar`)}>Editar</Button>
          <Popconfirm
            title='Tem certeza que deseja remover esta matrícula?'
            okText='Remover'
            cancelText='Cancelar'
            okButtonProps={{ danger: true }}
            onConfirm={() => excluir(m.id)}
          >
            <Button size='small' danger>Remover</Button>
          </Popconfirm>
        </Space>
      ),
    },
  ]

  return (
    <>
      <Typography.Title level={3}>Matrículas</Typography.Title>

      <div className='barra-acoes'>
        <Input
          allowClear
          placeholder='Pesquisar por ID, aluno ou curso...'
          prefix={<Pesquisar className='icone-busca' />}
          value={busca}
          onChange={(e) => setBusca(e.target.value)}
        />
        <Button type='primary' onClick={() => navigate('/matriculas/novo')}>+ Nova matrícula</Button>
      </div>

      <Table
        rowKey='id'
        columns={colunas}
        dataSource={filtradas}
        loading={carregando}
        locale={{ emptyText: 'Nenhuma matrícula encontrada' }}
        pagination={{ pageSize: 8, hideOnSinglePage: true }}
        scroll={{ x: 'max-content' }}
      />
    </>
  )
}

export default Matriculas