import { Table } from "antd"

const alunos = [
    {id: 1, nome: 'Ana', email: 'ana@email.com', dataNascimento: '2008-11-22'},
    {id: 2, nome: 'Chris', email: 'chris@email.com', dataNascimento: '2008-04-01'},
]

const colunas = [
    {title: 'ID', dataIndex: 'id'},
    {title: 'Nome', dataIndex: 'nome'},
    {title: 'E-mail', dataIndex: 'email'},
    {title: 'Data de Nascimento', dataIndex: 'dataNascimento'},
]

const Alunos = () => {
  return <Table rowKey='id' columns={colunas} dataSource={alunos}/>
}

export default Alunos;