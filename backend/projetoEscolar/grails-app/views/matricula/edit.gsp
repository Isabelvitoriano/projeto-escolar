<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Editar Matrícula</title>
</head>

<body>
<div class="card-formulario">

    <h2>Editar Matrícula</h2>

    <g:hasErrors bean="${matricula}">
        <div class="alerta erro">
            <g:renderErrors bean="${matricula}"/>
        </div>
    </g:hasErrors>

    <g:form
        controller="matricula"
        action="update"
        id="${matricula?.id}"
        method="POST"
        class="formulario">

        <div class="formulario-grupo">
            <label for="aluno">Aluno</label>
            <select id="aluno" name="aluno.id" required>
                <option value="">Selecione um aluno...</option>
                <g:each in="${alunos}" var="aluno">
                    <option value="${aluno.id}" ${matricula?.aluno?.id == aluno.id ? 'selected' : ''}>
                        ${aluno.nome}
                    </option>
                </g:each>
            </select>
        </div>

        <div class="formulario-grupo">
            <label for="curso">Curso</label>
            <select id="curso" name="curso.id" required>
                <option value="">Selecione um curso...</option>
                <g:each in="${cursos}" var="curso">
                    <option value="${curso.id}" ${matricula?.curso?.id == curso.id ? 'selected' : ''}>
                        ${curso.nome}
                    </option>
                </g:each>
            </select>
        </div>

        <div class="formulario-grupo">
            <label for="dataMatricula">Data da Matrícula</label>
            <input
                id="dataMatricula"
                type="date"
                name="dataMatricula"
                value="${matricula?.dataMatricula?.format('yyyy-MM-dd')}"
                required>
        </div>

        <div class="formulario-grupo">
            <label for="valorPago">Valor Pago</label>
            <input
                id="valorPago"
                type="number"
                step="0.01"
                name="valorPago"
                value="${matricula?.valorPago}"
                required>
        </div>

        <div class="botoes">
            <button
                type="submit"
                class="botao botao-primario">
                Salvar
            </button>

            <a
                class="botao botao-secundario"
                href="${createLink(controller: 'matricula', action: 'index')}">
                Cancelar
            </a>
        </div>

    </g:form>

</div>
</body>
</html>