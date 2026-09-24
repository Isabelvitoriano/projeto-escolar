import { useEffect, useState } from 'react'
import { useLocation, useNavigate, useParams } from 'react-router-dom'
import { App as AntApp, Button, Card, DatePicker, Form, InputNumber, Select, Space, Spin } from 'antd'
import dayjs from 'dayjs'
import { api, mensagemDeErro } from '../../services/api.js'
import { idDe } from '../../utils/formatar.js'
import BotaoCompartilhar from '../../components/Compartilhar/BotaoCompartilhar.jsx'
import NaoEncontrado from '../../components/NaoEncontrado/NaoEncontrado.jsx'

function MatriculaForm() {
  const { id } = useParams()
  const editando = Boolean(id)
  const { pathname } = useLocation()
  const navigate = useNavigate()
  const { message } = AntApp.useApp()
  const [form] = Form.useForm()
  const [alunos, setAlunos] = useState([])
  const [cursos, setCursos] = useState([])
  const [carregando, setCarregando] = useState(true)
  const [salvando, setSalvando] = useState(false)
  const [erroCarga, setErroCarga] = useState(null)

  useEffect(() => {
    async function preparar() {
      try {
        const [a, c] = await Promise.all([api.listar('alunos'), api.listar('cursos')])
        setAlunos(a)
        setCursos(c)
        if (editando) {
          const m = await api.buscar('matriculas', id)
          form.setFieldsValue({
            alunoId: idDe(m.aluno),
            cursoId: idDe(m.curso),
            dataMatricula: dayjs(m.dataMatricula),
            valorPago: Number(m.valorPago),
          })
        }
      } catch (erro) {
        setErroCarga(
          erro.status === 404
            ? 'Matrícula não encontrada'
            : mensagemDeErro(erro, 'Não foi possível carregar o formulário.')
        )
      } finally {
        setCarregando(false)
      }
    }
    preparar()
  }, [id, editando, form])

  async function aoSalvar(valores) {
    setSalvando(true)
    const dados = {
      alunoId: valores.alunoId,
      cursoId: valores.cursoId,
      dataMatricula: valores.dataMatricula.format('YYYY-MM-DD'),
      valorPago: valores.valorPago,  
    }
    try {
      if (editando) {
        await api.atualizar('matriculas', id, dados)
        message.success('Matrícula atualizada')
        navigate(`/matriculas/`)
      } else {
        const criada = await api.criar('matriculas', dados)
        message.success('Matrícula cadastrada')
        navigate(`/matriculas/`)
      }
    } catch (erro) {
      message.error(mensagemDeErro(erro, 'Não foi possível salvar a matrícula.'))
    } finally {
      setSalvando(false)
    }
  }

  if (erroCarga) return <NaoEncontrado titulo={erroCarga} voltarPara='/matriculas' />

  return (
    <Card
      title={editando ? 'Editar matrícula' : 'Nova matrícula'}
      extra={<BotaoCompartilhar caminho={pathname} texto='Compartilhar formulário' />}
    >
      <Spin spinning={carregando}>
        <Form form={form} layout='vertical' onFinish={aoSalvar} style={{ maxWidth: 480 }}>
          <Form.Item name='alunoId' label='Aluno' rules={[{ required: true, message: 'Selecione o aluno' }]}>
            <Select
              showSearch
              placeholder='Selecione o aluno'
              optionFilterProp='label'
              options={alunos.map((a) => ({ value: a.id, label: a.nome }))}
            />
          </Form.Item>

          <Form.Item name='cursoId' label='Curso' rules={[{ required: true, message: 'Selecione o curso' }]}>
            <Select
              showSearch
              placeholder='Selecione o curso'
              optionFilterProp='label'
              options={cursos.map((c) => ({ value: c.id, label: c.titulo }))}
            />
          </Form.Item>

          <Form.Item name='dataMatricula' label='Data da matrícula' rules={[{ required: true, message: 'Informe a data' }]}>
            <DatePicker format='DD/MM/YYYY' placeholder='dd/mm/aaaa' style={{ width: '100%' }} />
          </Form.Item>

          <Form.Item
            name='valorPago'
            label='Valor pago'
            rules={[
              { required: true, message: 'Informe o valor pago' },
              { type: 'number', min: 0, message: 'O valor não pode ser negativo' },
            ]}
          >
            <InputNumber
              min={0}
              step={0.01}
              precision={2}
              decimalSeparator=','
              prefix='R$'
              style={{ width: '100%' }}
            />
          </Form.Item>

          <Space>
            <Button type='primary' htmlType='submit' loading={salvando}>Salvar</Button>
            <Button disabled={salvando} onClick={() => navigate(editando ? `/matriculas/` : '/matriculas')}>
              Cancelar
            </Button>
          </Space>
        </Form>
      </Spin>
    </Card>
  )
}

export default MatriculaForm