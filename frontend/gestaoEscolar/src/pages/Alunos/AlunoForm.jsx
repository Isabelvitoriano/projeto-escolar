import { useEffect, useState } from 'react'
import { useLocation, useNavigate, useParams } from 'react-router-dom'
import { App as AntApp, Button, Card, DatePicker, Form, Input, Space, Spin } from 'antd'
import dayjs from 'dayjs'
import { api, mensagemDeErro } from '../../services/api.js'
import BotaoCompartilhar from '../../components/Compartilhar/BotaoCompartilhar.jsx'
import NaoEncontrado from '../../components/NaoEncontrado/NaoEncontrado.jsx'

function AlunoForm() {
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
    api.buscar('alunos', id)
      .then((aluno) =>
        form.setFieldsValue({
          nome: aluno.nome,
          email: aluno.email,
          dataNascimento: dayjs(aluno.dataNascimento),
        })
      )
      .catch((erro) =>
        setErroCarga(
          erro.status === 404
            ? 'Aluno não encontrado'
            : mensagemDeErro(erro, 'Não foi possível carregar o aluno.')
        )
      )
      .finally(() => setCarregando(false))
  }, [id, editando, form])

  async function aoSalvar(valores) {
    setSalvando(true)
    const dados = {
      nome: valores.nome,
      email: valores.email,
      dataNascimento: valores.dataNascimento.format('YYYY-MM-DD'),
    }
    try {
      if (editando) {
        await api.atualizar('alunos', id, dados)
        message.success('Aluno atualizado')
        navigate(`/alunos`)
      } else {
        const criado = await api.criar('alunos', dados)
        message.success('Aluno cadastrado')
        navigate(`/alunos/`)
      }
    } catch (erro) {
      message.error(mensagemDeErro(erro, 'Não foi possível salvar o aluno.'))
    } finally {
      setSalvando(false)
    }
  }

  if (erroCarga) return <NaoEncontrado titulo={erroCarga} voltarPara='/alunos' />

  return (
    <Card
      title={editando ? 'Editar aluno' : 'Novo aluno'}
      extra={<BotaoCompartilhar caminho={pathname} texto='Compartilhar formulário' />}
    >
      <Spin spinning={carregando}>
        <Form form={form} layout='vertical' onFinish={aoSalvar} style={{ maxWidth: 480 }}>
          <Form.Item
            name='nome'
            label='Nome'
            rules={[
              { required: true, message: 'Informe o nome' },
              { max: 100, message: 'Máximo de 100 caracteres' },
            ]}
          >
            <Input placeholder='Ex.: Ana Souza' />
          </Form.Item>

          <Form.Item
            name='email'
            label='E-mail'
            rules={[
              { required: true, message: 'Informe o e-mail' },
              { type: 'email', message: 'E-mail em formato inválido' },
            ]}
          >
            <Input placeholder='Ex.: ana@email.com' />
          </Form.Item>

          <Form.Item
            name='dataNascimento'
            label='Data de nascimento'
            rules={[{ required: true, message: 'Informe a data de nascimento' }]}
          >
            <DatePicker
              format='DD/MM/YYYY'
              placeholder='dd/mm/aaaa'
              style={{ width: '50%' }}
              disabledDate={(dia) => dia.isAfter(dayjs())}
            />
          </Form.Item>

          <Space>
            <Button type='primary' htmlType='submit' loading={salvando}>Salvar</Button>
            <Button disabled={salvando} onClick={() => navigate(editando ? `/alunos` : '/alunos')}>
              Cancelar
            </Button>
          </Space>
        </Form>
      </Spin>
    </Card>
  )
}

export default AlunoForm