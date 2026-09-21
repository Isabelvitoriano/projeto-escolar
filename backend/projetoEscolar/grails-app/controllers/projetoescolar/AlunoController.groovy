package projetoescolar

import grails.converters.JSON

class AlunoController {

    static responseFormats = ['json']

    AlunoService alunoService

    def index() {
        respond alunoService.listar()
    }

    def show(Long id) {
        def aluno = alunoService.buscarId(id)

        if (aluno == null) {
            render status: 404, text: 'Aluno não encontrado'
            return
        }

        respond aluno
    }

    def save() {

        def aluno = new Aluno(
                nome: request.JSON.nome,
                email: request.JSON.email,
                dataNascimento: request.JSON.dataNascimento
        )

        if (!aluno.validate()) {
            respond aluno.errors, status: 400
            return
        }

        alunoService.salvar(aluno)
        respond aluno, status: 201
    }

    def update(Long id) {

        def aluno = alunoService.buscarId(id)

        if (aluno == null) {
            render status: 404, text: 'Aluno não encontrado'
            return
        }

        bindData(aluno, request.JSON)

        if (!aluno.validate()) {
            respond aluno.errors, status: 400
            return
        }

        alunoService.atualizar(aluno)
        respond aluno
    }

    def delete(Long id) {
        def removido = alunoService.excluir(id)

        if (!removido) {
            render status: 404, text: 'Aluno não encontrado'
            return
        }

        render status: 204
    }
}
