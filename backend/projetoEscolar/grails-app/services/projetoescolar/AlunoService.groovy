package projetoescolar

import grails.gorm.transactions.Transactional

@Transactional
class AlunoService {

    def listar() {
        return Aluno.list()
    }

    def buscarId(Long id) {
        return Aluno.get(id)
    }

    def salvar(Aluno aluno) {
        aluno.save()
        return aluno
    }

    def atualizar(Aluno aluno) {
        aluno.save()
        return aluno
    }

    def excluir(Long id) {
        Aluno aluno = buscarId(id)

        if (aluno == null) {
            return false
        }

        aluno.delete()
        return true
    }
}
