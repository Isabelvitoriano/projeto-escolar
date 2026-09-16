package projetoescolar

class Aluno {

    String nome
    String email
    Date dataNascimento

    static hasMany = [matriculas: Matricula]

    static constraints = {
        nome nullable: false, blank: false, maxSize: 100
        email nullable: false, blank: false, email: true, unique: true
        dataNascimento nullable: false
    }
}
