package projetoescolar

import grails.converters.JSON

class AlunoController {

    static responseFormats = ['json']

    AlunoService alunoService

    def index() {
        def alunos = respond alunoService.listar()

        [
            alunos: alunos,
            totalAlunos: alunos.size(),
            totalCursos: Curso.count(),
            totalMatriculas: Matricula.coun()
        ]
    }

    def create() {
        [
            totalAlunos: Aluno.count(),
            totalCursos = Curso.count(),
            totalMatriculas = Matricula.count()
        ]
    }

    def save() {

        def aluno = new Aluno(
                nome: params.nome,
                email: params.email,
                dataNascimento: params.date(
                    'dataNascimento',
                    'yyyy-MM-dd'
                )
        )

        if (!aluno.validate()) {
            render(
                view: 'create'
                model: [
                    aluno: aluno,
                    totalAlunos: Aluno.count(),
                    totalCursos: Curso.count(),
                    totalMatriculas: Matricula.count()
                ]
            )
            return
        }

        alunoService.salvar(aluno)
        flash.message = 'Aluno cadastrado com sucesso.'
        redirect(action:'index')
    }

    def update(Long id) {

        def aluno = alunoService.buscarId(id)

        if(!aluno) {
            flash.error = 'Aluno não encontrado.'
            redirect(action:'index')
            return
        }

        aluno.nome = params.nome
        aluno.email = params.email
        aluno.dataNascimento =
            params.date('dataNascimento', 'yyyy-MM-dd')

        if(!aluno.validate()) {
            render(
                view: 'edit',
                model: [
                    aluno: aluno,
                    totalAlunos: Aluno.count(),
                    totalCursos: Curso.count(),
                    totalMatriculas: Matricula.count()
                ]
            )
        }

        alunoService.atualizar(aluno)
        flash.message = 'Aluno atualizado com sucesso.'
        redirect(action:'index')
    }

    def delete(Long id) {
        def removido = alunoService.excluir(id)

        if (!removido) {
            flash.error = 'Aluno não encontrado.'
        } else {
            flash.message = "Aluno removido com sucesso."
        }

        redirect(action:'index')
    }
}
