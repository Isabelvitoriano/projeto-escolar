package projetoescolar

class CursoController {

    CursoService cursoService

    def index() {
        [cursos: cursoService.listar()]
    }

    def create() {
        render(view: 'create', model: [curso: new Curso()])
    }

    def edit(Long id) {
        def curso = cursoService.buscarId(id)

        if (!curso) {
            render(
                view: '/notFound',
                model: [titulo: 'Curso não encontrado']
            )
            return
        }
        [curso: curso]
    }

    def save() {
        def curso = new Curso(
            titulo: params.titulo,
            descricao: params.descricao,
            cargaHoraria: params.int('cargaHoraria')
        )

        if (!curso.validate()) {
            render(
                view: 'create',
                model: [curso: curso]
            )
            return
        }
        cursoService.salvar(curso)
        flash.message = 'Curso cadastrado com sucesso'
        redirect(action: 'index')
    }

    def update(Long id) {
        def curso = cursoService.buscarId(id)

        if (!curso) {
            render(
                view: '/notFound',
                model: [titulo: 'Curso não encontrado']
            )
            return
        }
        curso.titulo = params.titulo
        curso.descricao = params.descricao
        curso.cargaHoraria = params.int('cargaHoraria')

        if (!curso.validate()) {
            render(
                view: 'edit',
                model: [curso: curso]
            )
            return
        }
        cursoService.atualizar(curso)
        flash.message = 'Curso atualizado com sucesso'
        redirect(action: 'index')
    }

    def delete(Long id) {
        if (!cursoService.excluir(id)) {
            flash.error = 'Curso não encontrado'
        } else {
            flash.message = 'Curso removido com sucesso'
        }
        redirect(action: 'index')
    }
}