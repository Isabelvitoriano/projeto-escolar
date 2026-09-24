import { useEffect, useState } from 'react'
import { useLocation, useNavigate, useParams } from 'react-router-dom'
import { App as AntApp, Button, Card, Form, Input, InputNumber, Space, Spin } from 'antd'
import { api, mensagemDeErro } from '../../services/api.js'
import BotaoCompartilhar from '../../components/Compartilhar/BotaoCompartilhar.jsx'
import NaoEncontrado from '../../components/NaoEncontrado/NaoEncontrado.jsx'

function CursoForm() {
  const { id } = useParams()
  const editando = Boolean(id)
  const { pathname } = useLocation()
  const navigate = useNavigate()
  const { message } = AntApp.useApp()
  const [form] = Form.useForm()
  const [carregando, setCarregando] = useState(editando)
  const [salvando, setSalvando] = useState(false)
  const [erroCarga, setErroCarga] = useState(null)

  useEffect(() => {
    if (!editando) return
    api.buscar('cursos', id)
      .then((curso) =>
        form.setFieldsValue({
          titulo: curso.titulo,
          descricao: curso.descricao,
          cargaHoraria: curso.cargaHoraria,
        })
      )
      .catch((erro) =>
        setErroCarga(
          erro.status === 404
            ? 'Curso não encontrado'
            : mensagemDeErro(erro, 'Não foi possível carregar o curso.')
        )
      )
      .finally(() => setCarregando(false))
  }, [id, editando, form])

  async function aoSalvar(valores) {
    setSalvando(true)
    const dados = {
      titulo: valores.titulo,
      descricao: valores.descricao,
      cargaHoraria: valores.cargaHoraria,  
    }
    try {
      if (editando) {
        await api.atualizar('cursos', id, dados)
        message.success('Curso atualizado')
        navigate(`/cursos/`)
      } else {
        const criado = await api.criar('cursos', dados)
        message.success('Curso cadastrado')
        navigate(`/cursos/`)
      }
    } catch (erro) {
      message.error(mensagemDeErro(erro, 'Não foi possível salvar o curso.'))
    } finally {
      setSalvando(false)
    }
  }

  if (erroCarga) return <NaoEncontrado titulo={erroCarga} voltarPara='/cursos' />

  return (
    <Card
      title={editando ? 'Editar curso' : 'Novo curso'}
      extra={<BotaoCompartilhar caminho={pathname} texto='Compartilhar formulário' />}
    >
      <Spin spinning={carregando}>
        <Form form={form} layout='vertical' onFinish={aoSalvar} style={{ maxWidth: 480 }}>
          <Form.Item name='titulo' label='Título' rules={[{ required: true, message: 'Informe o título' }]}>
            <Input placeholder='Ex.: Desenvolvimento Web' />
          </Form.Item>

          <Form.Item name='descricao' label='Descrição' rules={[{ required: true, message: 'Informe a descrição' }]}>
            <Input.TextArea rows={3} placeholder='Resumo do conteúdo do curso' />
          </Form.Item>

          <Form.Item
            name='cargaHoraria'
            label='Carga horária (horas)'
            rules={[
              { required: true, message: 'Informe a carga horária' },
              { type: 'number', min: 1, message: 'A carga horária deve ser maior que zero' },
            ]}
          >
            <InputNumber min={1} precision={0} style={{ width: '50%'}} />
          </Form.Item>

          <Space>
            <Button type='primary' htmlType='submit' loading={salvando}>Salvar</Button>
            <Button disabled={salvando} onClick={() => navigate(editando ? `/cursos/` : '/cursos')}>
              Cancelar
            </Button>
          </Space>
        </Form>
      </Spin>
    </Card>
  )
}

export default CursoForm