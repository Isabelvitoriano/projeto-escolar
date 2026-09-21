package projetoescolar

class UrlMappings {

    static mappings = {

        "/alunos"(controller: "aluno") {
            action = [GET: "index", POST: "save"]
        }

        "/alunos/$id"(controller: "aluno") {
            action = [GET: "show", PUT: "update", DELETE: "delete"]
        }

        "/cursos"(controller: "curso") {
            action = [GET: "index", POST: "save"]
        }

        "/cursos/$id"(controller: "curso") {
            action = [GET: "show", PUT: "update", DELETE: "delete"]
        }

        "/matriculas"(controller: "matricula") {
            action = [GET: "index", POST: "save"]
        }

        "/matriculas/$id"(controller: "matricula") {
            action = [GET: "show", PUT: "update", DELETE: "delete"]
        }

        "/"(view: "/index")
        "500"(view: "/error")
        "404"(view: "/notFound")
    }
}