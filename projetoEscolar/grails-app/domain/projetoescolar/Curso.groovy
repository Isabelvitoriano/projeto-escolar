package projetoescolar

class Curso {

    String titulo
    String descricao
    Integer cargaHoraria

    static hasMany = [matriculas: Matricula]

    static constraints = {
        titulo nullable: false, blank: false
        descricao nullable: false, blalnk: false
        cargaHoraria nullable: false, min: 1
    }
}
