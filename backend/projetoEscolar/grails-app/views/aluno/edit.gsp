<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Editar aluno</title>
</head>

<body>
<div class="card-formulario">

    <h2>Editar aluno</h2>

    <g:hasErrors bean="${aluno}">
        <div class="alerta erro">
            <g:renderErrors bean="${aluno}"/>
        </div>
    </g:hasErrors>

    <g:form
        controller="aluno"
        action="update"
        id="${aluno.id}"
        method="POST"
        class="formulario">

        <div class="formulario-grupo">

            <label for="nome">
                Nome
            </label>

            <input
                id="nome"
                type="text"
                name="nome"
                maxlength="100"
                value="${aluno.nome}"
                required>

        </div>

        <div class="formulario-grupo">

            <label for="email">
                E-mail
            </label>

            <input
                id="email"
                type="email"
                name="email"
                value="${aluno.email}"
                required>

        </div>

        <div class="formulario-grupo">

            <label for="dataNascimento">
                Data de nascimento
            </label>

            <input
                id="dataNascimento"
                type="date"
                name="dataNascimento"
                value="${aluno.dataNascimento?.format('yyyy-MM-dd')}"
                max="${new Date().format('yyyy-MM-dd')}"
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
                href="${createLink(controller: 'aluno', action: 'index')}">
                Cancelar
            </a>

        </div>

    </g:form>

</div>
</body>
</html>