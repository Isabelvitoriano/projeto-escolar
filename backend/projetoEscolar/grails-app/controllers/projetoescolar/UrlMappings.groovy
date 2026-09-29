package projetoescolar

class UrlMappings {

    static mappings = {
        '/alunos'(controller: 'aluno', action: 'index', method: 'GET')
        '/alunos/novo'(controller: 'aluno', action: 'create', method: 'GET')
        '/alunos'(controller: 'aluno', action: 'save', method: 'POST')
        '/alunos/$id/editar'(controller: 'aluno', action: 'edit', method: 'GET')
        '/alunos/$id/atualizar'(controller: 'aluno', action: 'update', method: 'POST')
        '/alunos/excluir'(controller: 'aluno', action: 'delete', method: 'POST')

        '/cursos'(controller: 'curso', action: 'index', method: 'GET')
        '/cursos/novo'(controller: 'curso', action: 'create', method: 'GET')
        '/cursos'(controller: 'curso', action: 'save', method: 'POST')
        '/cursos/$id/editar'(controller: 'curso', action: 'edit', method: 'GET')
        '/cursos/$id/atualizar'(controller: 'curso', action: 'update', method: 'POST')
        '/cursos/excluir'(controller: 'curso', action: 'delete', method: 'POST')

        '/matriculas'(controller: 'matricula', action: 'index', method: 'GET')
        '/matriculas/novo'(controller: 'matricula', action: 'create', method: 'GET')
        '/matriculas'(controller: 'matricula', action: 'save', method: 'POST')
        '/matriculas/$id/editar'(controller: 'matricula', action: 'edit', method: 'GET')
        '/matriculas/$id/atualizar'(controller: 'matricula', action: 'update', method: 'POST')
        '/matriculas/excluir'(controller: 'matricula', action: 'delete', method: 'POST')

        "/"(controller: 'aluno', action: 'index')
        "500"(view: "/error")
        "404"(view: "/notFound")
    }
}