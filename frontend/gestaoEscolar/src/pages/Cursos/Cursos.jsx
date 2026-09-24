import { useNavigate, useOutletContext } from 'react-router-dom'
import { useEffect, useState } from 'react'
import { App as AntApp, Button, Input, Popconfirm, Space, Table, Typography } from 'antd'
import { api, mensagemDeErro } from '../../services/api.js'
import Pesquisar from '../../assets/pesquisar.svg?react'

function Cursos() {
  const navigate = useNavigate()
  const { message } = AntApp.useApp()
  const [cursos, setCursos] = useState([])
  const [carregando, setCarregando] = useState(true)
  const [busca, setBusca] = useState('')

  async function carregar() {
    try {
      setCursos(await api.listar('cursos'))
    } catch (erro) {
      message.error(mensagemDeErro(erro, 'Não foi possível carregar os cursos.'))
    } finally {
      setCarregando(false)
    }
  }

  useEffect(() => {
    carregar()
  }, [])

  async function excluir(id) {
    try {
      await api.excluir('cursos', id)
      message.success('Curso removido')
      setCarregando(true)
      carregar()
    } catch (erro) {
      message.error(mensagemDeErro(erro, 'Não foi possível remover o curso.'))
    }
  }

  const termo = busca.trim().toLowerCase()
  const filtrados = cursos.filter(
    (c) => String(c.id) === termo || c.titulo.toLowerCase().includes(termo)
  )

  const colunas = [
    { title: 'ID', dataIndex: 'id', width: 70 },
    { title: 'Título', dataIndex: 'titulo' },
    { title: 'Descrição', dataIndex: 'descricao', ellipsis: true },
    { title: 'Carga horária', dataIndex: 'cargaHoraria', render: (h) => `${h} h` },
    {
      title: 'Ações',
      render: (_, curso) => (
        <Space>
          <Button size='small' onClick={() => navigate(`/cursos/${curso.id}/editar`)}>Editar</Button>
          <Popconfirm
            title='Tem certeza que deseja remover este curso?'
            description='As matrículas dele também serão removidas.'
            okText='Remover'
            cancelText='Cancelar'
            okButtonProps={{ danger: true }}
            onConfirm={() => excluir(curso.id)}
          >
            <Button size='small' danger>Remover</Button>
          </Popconfirm>
        </Space>
      ),
    },
  ]

  return (
    <>
      <Typography.Title level={3}>Cursos</Typography.Title>

      <div className='barra-acoes'>
        <Input
          allowClear
          placeholder='Pesquisar por título ou ID...'
          prefix={<Pesquisar className='icone-busca' />}
          value={busca}
          onChange={(e) => setBusca(e.target.value)}
        />
        <Button type='primary' onClick={() => navigate('/cursos/novo')}>+ Novo curso</Button>
      </div>

      <Table
        rowKey='id'
        columns={colunas}
        dataSource={filtrados}
        loading={carregando}
        locale={{ emptyText: 'Nenhum curso encontrado' }}
        pagination={{ pageSize: 8, hideOnSinglePage: true }}
        scroll={{ x: 'max-content' }}
      />
    </>
  )
}

export default Cursos