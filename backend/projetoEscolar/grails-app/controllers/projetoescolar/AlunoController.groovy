package projetoescolar

class AlunoController {

    AlunoService alunoService

    def index() {
        [alunos: alunoService.listar()]
    }

    def create() {
        [aluno: new Aluno()]
    }

    def edit(Long id) {
        def aluno = alunoService.buscarId(id)

        if (!aluno) {
            render(
                view: '/notFound',
                model: [
                    titulo: 'Aluno não encontrado'
                ]
            )
            return
        }
        [aluno: aluno]
    }

    def save() {
        def aluno = new Aluno(
            nome: params.nome,
            email: params.email,
            dataNascimento: parse.Date(
                params.dataNascimento
            )
        )

        if (!aluno.validate()) {
            render(
                view: 'create',
                model: [
                    aluno: aluno
                ]
            )
            return
        }
        alunoService.salvar(aluno)
        flash.message = 'Aluno cadastrado com sucesso'
        redirect(action: 'index')
    }

    def update(Long id) {
        def aluno = alunoService.buscarId(id)

        if (!aluno) {
            render(
                view:'/notFound',
                model: [
                    titulo: 'Aluno não encontrado'
                ]
            )
            return
        }
        aluno.nome = params.nome
        aluno.email = params.email
        aluno.dataNascimento = parse.Date(
            params.dataNascimento
        )

        if (!aluno.validate()) {
            render(
                view: 'edit',
                model: [
                    aluno: aluno
                ]
            )
            return
        }
        alunoService.atualizar(aluno)
        flash.message = 'Aluno atualizado com sucesso'
        redirect(action: 'index')
    }

    def delete(Long id) {
        if (!alunoService.excluir(id)) {
            flash.error = 'Aluno não encontrado'
        } else {
            flash.message = 'Aluno removido com sucesso'
        }
        redirect(action: 'index')
    }
}