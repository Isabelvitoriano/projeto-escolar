package projetoescolar

class Curso {

    String titulo
    String descricao
    Integer cargaHoraria

    static hasMany = [matriculas: Matricula]

    static constraints = {
        titulo nullable: false, blank: false
        descricao nullable: false, blank: false
        cargaHoraria nullable: false, blank: false, min: 1
    }
}
