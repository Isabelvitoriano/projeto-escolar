package projetoescolar

import java.text.SimpleDateFormat

class BootStrap {

    def init = { servletContext ->
        Aluno.withTransaction {
            if (Aluno.count() > 0) return

            def data = {String s -> new SimpleDateFormat('yyyy-MM-dd').parse(s)}

            def ana = new Aluno(nome: 'Ana Souza', email: 'ana@email.com', dataNascimento: data('2000-10-01')).save(failOnError: true)
            def bruno = new Aluno(nome: 'Bruno Lima', email: 'bruno@email.com', dataNascimento: data('1999-05-22')).save(failOnError: true)
            def carla = new Aluno(nome: 'Carla Mendes', email: 'carla@email.com', dataNascimento: data('2008-09-03')).save(failOnError: true)
            def diego = new Aluno(nome: 'Diego Alves', email: 'diego@email.com', dataNascimento: data('1977-12-15')).save(failOnError: true)

            def web = new Curso(titulo: 'Desenvolvimento Web', descricao: 'HTML, CSS, JavaScript e React', cargaHoraria: 60).save(failOnError: true)
            def bd = new Curso(titulo: 'Banco de Dados', descricao: 'Modelagem e SQL', cargaHoraria: 40).save(failOnError: true)
            def eng = new Curso(titulo: 'Engenharia de Software', descricao: 'Requisitos, UML e processos', cargaHoraria: 120).save(failOnError: true)

            new Matricula(aluno: ana, curso: web, dataMatricula: data('2026-08-01'), valorPago: 350.00).save(failOnError: true)
            new Matricula(aluno: bruno, curso: eng, dataMatricula: data('2026-09-15'), valorPago: 280.99).save(failOnError: true)
            new Matricula(aluno: carla, curso: bd, dataMatricula: data('2026-02-27'), valorPago: 120.64).save(failOnError: true)
            new Matricula(aluno: diego, curso: bd, dataMatricula: data('2026-05-09'), valorPago: 120.64).save(failOnError: true)
        }
    }

    def destroy = {
    }

}
