package projetoescolar

import java.text.SimpleDateFormat

class BootStrap {

    def init = { servletContext ->
        Aluno.withTransaction {
            if (Aluno.count() > 0) return

            // Criação do formatador explicito para evitar ambiguidade com o nome da variável
            def parseData = { String s -> new SimpleDateFormat('yyyy-MM-dd').parse(s) }

            def ana    = new Aluno(nome: 'Ana Souza',    email: 'ana@email.com',    dataNascimento: parseData('2000-01-10')).save(failOnError: true)
            def bruno  = new Aluno(nome: 'Bruno Lima',   email: 'bruno@email.com',  dataNascimento: parseData('1999-05-22')).save(failOnError: true)
            def carla  = new Aluno(nome: 'Carla Mendes', email: 'carla@email.com',  dataNascimento: parseData('2001-09-03')).save(failOnError: true)
            def diego  = new Aluno(nome: 'Diego Alves',  email: 'diego@email.com',  dataNascimento: parseData('1998-12-15')).save(failOnError: true)

            def web = new Curso(titulo: 'Desenvolvimento Web', descricao: 'HTML, CSS, JavaScript e React', cargaHoraria: 60).save(failOnError: true)
            def bd  = new Curso(titulo: 'Banco de Dados', descricao: 'Modelagem e SQL', cargaHoraria: 40).save(failOnError: true)
            def eng = new Curso(titulo: 'Engenharia de Software', descricao: 'Requisitos, UML e processos', cargaHoraria: 80).save(failOnError: true)

            new Matricula(aluno: ana,   curso: web, dataMatricula: parseData('2026-08-01'), valorPago: 350.00).save(failOnError: true)
            new Matricula(aluno: bruno, curso: bd,  dataMatricula: parseData('2026-08-05'), valorPago: 280.50).save(failOnError: true)
            new Matricula(aluno: carla, curso: web, dataMatricula: parseData('2026-08-10'), valorPago: 350.00).save(failOnError: true)
            new Matricula(aluno: diego, curso: eng, dataMatricula: parseData('2026-08-12'), valorPago: 420.00).save(failOnError: true)
        }
    }

    def destroy = {
    }
}
