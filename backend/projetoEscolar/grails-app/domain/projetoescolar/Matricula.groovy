package projetoescolar

class Matricula {

    Date dataMatricula
    BigDecimal valorPago

    static belongsTo = [
            aluno: Aluno,
            curso: Curso
    ]

    static constraints = {
        dataMatricula nullable: false
        valorPago nullable: false, min: 0.0G, scale: 2
        aluno nullable: false
        curso nullable: false
    }
}
