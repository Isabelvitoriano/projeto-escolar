package projetoescolar

import grails.gorm.transactions.Transactional

@Transactional
class MatriculaService {

    def listar() {
        return Matricula.list()
    }

    def buscarId(Long id) {
        return Matricula.get(id)
    }

    def salvar(Matricula matricula) {
        matricula.save()
        return matricula
    }

    def atualizar(Matricula matricula) {
        matricula.save()
        return matricula
    }

    def excluir(Long id) {
        Matricula matricula = buscarId(id)

        if (matricula == null) {
            return false
        }

        matricula.delete()
        return true
    }
}
