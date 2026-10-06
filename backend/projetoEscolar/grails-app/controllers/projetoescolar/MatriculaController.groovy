package projetoescolar

class MatriculaController {

    MatriculaService matriculaService

    def index() {

        def matriculas = matriculaService.listar()

        [
            matriculas: matriculas,
            totalAlunos: Aluno.count(),
            totalCursos: Curso.count(),
            totalMatriculas: matriculas.size()
        ]
    }

    def create() {

        [
            alunos: Aluno.list(sort: 'nome'),
            cursos: Curso.list(sort: 'titulo'),

            totalAlunos: Aluno.count(),
            totalCursos: Curso.count(),
            totalMatriculas: Matricula.count()
        ]
    }
    
    def edit(Long id) {

        def matricula = matriculaService.buscarId(id)

        if (!matricula) {

            flash.error = 'Matrícula não encontrada.'

            redirect(uri: '/matriculas')

            return
        }

        [
            matricula: matricula,
            alunos: Aluno.list(sort: 'nome'),
            cursos: Curso.list(sort: 'titulo'),
            totalAlunos: Aluno.count(),
            totalCursos: Curso.count(),
            totalMatriculas: Matricula.count()
        ]
    }

    def save() {

        def aluno = Aluno.get(params.long('alunoId'))
        def curso = Curso.get(params.long('cursoId'))

        def matricula = new Matricula(
                aluno: aluno,
                curso: curso,
                dataMatricula: params.date(
                        'dataMatricula',
                        'yyyy-MM-dd'
                ),
                valorPago: params.valorPago ? (params.valorPago as BigDecimal) : null
        )

        if (!matricula.validate()) {

            render(
                    view: 'create',
                    model: [
                            matricula: matricula,
                            alunos: Aluno.list(sort: 'nome'),
                            cursos: Curso.list(sort: 'titulo'),
                            totalAlunos: Aluno.count(),
                            totalCursos: Curso.count(),
                            totalMatriculas: Matricula.count()
                    ]
            )

            return
        }

        matriculaService.salvar(matricula)

        flash.message = 'Matrícula cadastrada com sucesso.'

        redirect(uri: '/matriculas')
    }


    def update(Long id) {

        def matricula = matriculaService.buscarId(id)

        if (!matricula) {

            flash.error = 'Matrícula não encontrada.'

            redirect(uri: '/matriculas')

            return
        }

        matricula.aluno =
                Aluno.get(params.long('alunoId'))

        matricula.curso =
                Curso.get(params.long('cursoId'))

        matricula.dataMatricula =
                params.date(
                        'dataMatricula',
                        'yyyy-MM-dd'
                )

        matricula.valorPago =
                params.valorPago ? (params.valorPago as BigDecimal) : null

        if (!matricula.validate()) {

            render(
                    view: 'edit',
                    model: [
                            matricula: matricula,
                            alunos: Aluno.list(sort: 'nome'),
                            cursos: Curso.list(sort: 'titulo'),
                            totalAlunos: Aluno.count(),
                            totalCursos: Curso.count(),
                            totalMatriculas: Matricula.count()
                    ]
            )

            return
        }

        matriculaService.atualizar(matricula)

        flash.message = 'Matrícula atualizada com sucesso.'

        redirect(uri: '/matriculas')
    }

    def delete(Long id) {

        def removido = matriculaService.excluir(id)

        if (!removido) {
            flash.error = 'Matrícula não encontrada.'
        } else {
            flash.message = 'Matrícula removida com sucesso.'
        }

        redirect(uri: '/matriculas')
    }
}