<%@ page contentType="text/html;charset=UTF-8" %>

<div class="form-grupo">
    <div class="itens-form">
        <label for="alunoId">SELECIONE O ALUNO</label>
        <select id="alunoId" name="alunoId" required>
            <option value="">Selecione um aluno...</option>
            <g:each in="${alunos}" var="aluno">
                <option value="${aluno.id}" ${aluno.id == matricula?.aluno?.id ? 'selected' : ''}>
                    ${aluno.nome} (${aluno.email})
                </option>
            </g:each>
        </select>
    </div>

    <div class="itens-form">
        <label for="cursoId">SELECIONE O CURSO</label>
        <select id="cursoId" name="cursoId" required>
            <option value="">Selecione um curso...</option>
            <g:each in="${cursos}" var="curso">
                <option value="${curso.id}" ${curso.id == matricula?.curso?.id ? 'selected' : ''}>
                    ${curso.titulo}
                </option>
            </g:each>
        </select>
    </div>

    <div class="itens-form">
        <label for="dataMatricula">DATA DA MATRÍCULA</label>
        <input type="date" name="dataMatricula" value="${formatDate(date: matricula?.dataMatricula ?: new Date(), format: 'yyyy-MM-dd')}" />
    </div>
</div>