package projetoescolar

import grails.converters.JSON

class MatriculaController {

    static responseFormats = ['json']

    MatriculaService matriculaService

    def index() {
        respond matriculaService.listar()
    }

    def show(Long id) {
        def matricula = matriculaService.buscarId(id)

        if (matricula == null) {
            render status: 404, text: 'Matricula não encontrado'
            return
        }

        respond matricula
    }

    def save() {
        def aluno = Aluno.get(request.JSON.alunoId as Long)
        def curso = Curso.get(request.JSON.cursoId as Long)

        if (aluno == null) {
            render status: 404, text: "Aluno não encontrado"
            return
        }

        if (curso == null) {
            render status: 404, text: "Curso não encontrado"
            return
        }

        def matricula = new Matricula(
                dataMatricula: request.JSON.dataMatricula,
                valorPago: request.JSON.valorPago,
                aluno: aluno,
                curso: curso
        )

        if (!matricula.validate()) {
            respond matricula.errors, status: 400
            return
        }

        matriculaService.salvar(matricula)
        respond matricula, status: 201
    }

    def update(Long id) {

        def matricula = matriculaService.buscarId(id)

        if (matricula == null) {
            render status: 404, text: 'Matricula não encontrado'
            return
        }

        bindData(matricula, request.JSON)

        if (!matricula.validate()) {
            respond matricula.errors, status: 400
            return
        }

        matriculaService.atualizar(matricula)
        respond matricula
    }

    def delete(Long id) {
        def removido = matriculaService.excluir(id)

        if (!removido) {
            render status: 404, text: 'Matricula não encontrado'
            return
        }

        render status: 204
    }
}
