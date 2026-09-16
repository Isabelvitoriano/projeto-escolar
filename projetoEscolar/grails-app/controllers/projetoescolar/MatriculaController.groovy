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

        def matricula = new Matricula(
                titulo: request.JSON.titulo,
                descricao: request.JSON.descricao,
                cargaHoraria: request.JSON.cargaHoraria
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
