package projetoescolar

import grails.converters.JSON

class CursoController {

    static responseFormats = ['json']

    CursoService cursoService

    def index() {
        respond cursoService.listar()
    }

    def show(Long id) {
        def curso = cursoService.buscarId(id)

        if (curso == null) {
            render status: 404, text: 'Curso não encontrado'
            return
        }

        respond curso
    }

    def save() {

        def curso = new Curso(
                titulo: request.JSON.titulo,
                descricao: request.JSON.descricao,
                cargaHoraria: request.JSON.cargaHoraria
        )

        if (!curso.validate()) {
            respond curso.errors, status: 400
            return
        }

        cursoService.salvar(curso)
        respond curso, status: 201
    }

    def update(Long id) {

        def curso = cursoService.buscarId(id)

        if (curso == null) {
            render status: 404, text: 'Curso não encontrado'
            return
        }

        bindData(curso, request.JSON)

        if (!curso.validate()) {
            respond curso.errors, status: 400
            return
        }

        cursoService.atualizar(curso)
        respond curso
    }

    def delete(Long id) {
        def removido = cursoService.excluir(id)

        if (!removido) {
            render status: 404, text: 'Curso não encontrado'
            return
        }

        render status: 204
    }
}
