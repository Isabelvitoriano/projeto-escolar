    def update(Long id) {

        def matricula = matriculaService.buscarId(id)

        if (matricula == null) {
            render status: 404, text: 'Matricula não encontrado'
            return
        }

        def aluno = Aluno.get(request.JSON.alunoId as Long)
        def curso = Curso.get(request.JSON.cursoId as Long)

        if (aluno == null) {
            render status: 404, text: 'Aluno não encontrado'
            return
        }

        if (curso == null) {
            render status: 404, text: 'Curso não encontrado'
            return
        }

        matricula.aluno = aluno
        matricula.curso = curso
        bindData(matricula, request.JSON, [include: ['dataMatricula', 'valorPago']])

        if (!matricula.validate()) {
            respond matricula.errors, status: 400
            return
        }

        matriculaService.atualizar(matricula)
        respond matricula
    }