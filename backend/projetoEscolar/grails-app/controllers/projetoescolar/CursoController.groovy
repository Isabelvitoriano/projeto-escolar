package projetoescolar

class CursoController {

    CursoService cursoService

    def index() {

        def cursos = cursoService.listar()

        [
            cursos: cursos,
            totalAlunos: Aluno.count(),
            totalCursos: cursos.size(),
            totalMatriculas: Matricula.count()
        ]
    }

    def create() {

        [
            totalAlunos: Aluno.count(),
            totalCursos: Curso.count(),
            totalMatriculas: Matricula.count()
        ]
    }

    def save() {

        def curso = new Curso(
                titulo: params.titulo,
                descricao: params.descricao,
                cargaHoraria: params.int(
                        'cargaHoraria'
                )
        )

        if (!curso.validate()) {

            render(
                    view: 'create',
                    model: [
                            curso: curso,
                            totalAlunos: Aluno.count(),
                            totalCursos: Curso.count(),
                            totalMatriculas: Matricula.count()
                    ]
            )

            return
        }

        cursoService.salvar(curso)

        flash.message = 'Curso cadastrado com sucesso.'

        redirect(action: 'index')
    }

    def edit(Long id) {

        def curso = cursoService.buscarId(id)

        if (!curso) {

            flash.error = 'Curso não encontrado.'

            redirect(action: 'index')

            return
        }

        [
            curso: curso,
            totalAlunos: Aluno.count(),
            totalCursos: Curso.count(),
            totalMatriculas: Matricula.count()
        ]
    }

    def update(Long id) {

        def curso = cursoService.buscarId(id)

        if (!curso) {

            flash.error = 'Curso não encontrado.'

            redirect(action: 'index')

            return
        }

        curso.titulo = params.titulo
        curso.descricao = params.descricao
        curso.cargaHoraria = params.int('cargaHoraria')

        if (!curso.validate()) {

            render(
                    view: 'edit',
                    model: [
                            curso: curso,
                            totalAlunos: Aluno.count(),
                            totalCursos: Curso.count(),
                            totalMatriculas: Matricula.count()
                    ]
            )

            return
        }

        cursoService.atualizar(curso)

        flash.message = 'Curso atualizado com sucesso.'

        redirect(action: 'index')
    }

    def delete(Long id) {

        def removido = cursoService.excluir(id)

        if (!removido) {
            flash.error = 'Curso não encontrado.'
        } else {
            flash.message = 'Curso removido com sucesso.'
        }

        redirect(action: 'index')
    }
}