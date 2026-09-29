<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Novo aluno</title>
</head>

<body>
<div class="card-formulario">

    <div class="barra-acoes">

        <h2>Novo aluno</h2>

        <button
            type="button"
            class="botao botao-secundario"
            onclick="copiarLink()">
            Compartilhar formulário
        </button>

    </div>

    <g:hasErrors bean="${aluno}">
        <div class="alerta erro">
            <g:renderErrors bean="${aluno}"/>
        </div>
    </g:hasErrors>

    <g:form
        controller="aluno"
        action="save"
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
                value="${aluno?.nome ?: ''}"
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
                value="${aluno?.email ?: ''}"
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
                value="${aluno?.dataNascimento?.format('yyyy-MM-dd') ?: ''}"
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

<script>

function copiarLink() {

    navigator.clipboard.writeText(window.location.href)
        .then(function () {
            alert('Link copiado!')
        })
        .catch(function () {
            prompt('Copie o link abaixo:', window.location.href)
        })

}

</script>
</body>
</html>