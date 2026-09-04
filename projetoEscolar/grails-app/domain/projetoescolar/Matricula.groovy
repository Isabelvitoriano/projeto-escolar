package projetoescolar

class Matricula {

    Date dataMatricula
    BigDecimal valorPago

    Aluno aluno
    Curso curso

    static belongsTo = [
            aluno: Aluno,
            curso: Curso
    ]

    static constraints = {
        dataMatricula nullable: false
        valorPago nullable: false, min: 0.0G
        aluno nullable: false
        curso nullable: false
    }
}
