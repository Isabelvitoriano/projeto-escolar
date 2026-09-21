package projetoescolar

import grails.gorm.transactions.Transactional

@Transactional
class CursoService {

    def listar() {
        return Curso.list()
    }

    def buscarId(Long id) {
        return Curso.get(id)
    }

    def salvar(Curso curso) {
        curso.save()
        return curso
    }

    def atualizar(Curso curso) {
        curso.save()
        return curso
    }

    def excluir(Long id) {
        Curso curso = buscarId(id)

        if (curso == null) {
            return false
        }

        curso.delete()
        return true
    }
}
