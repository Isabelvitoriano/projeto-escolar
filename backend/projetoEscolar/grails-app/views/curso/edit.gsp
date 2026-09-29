<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Editar curso</title>
</head>

<body>
<div class="card-formulario">

    <h2>Editar curso</h2>

    <g:hasErrors bean="${curso}">
        <div class="alerta erro">
            <g:renderErrors bean="${curso}"/>
        </div>
    </g:hasErrors>

    <g:form
        controller="curso"
        action="update"
        id="${curso.id}"
        method="POST"
        class="formulario">

        <div class="formulario-grupo">

            <label for="titulo">
                Título
            </label>

            <input
                id="titulo"
                type="text"
                name="titulo"
                maxlength="100"
                value="${curso.titulo}"
                required>

        </div>

        <div class="formulario-grupo">

            <label for="descricao">
                Descrição
            </label>

            <input
                id="descricao"
                type="descricao"
                name="descricao"
                value="${curso.descricao}"
                required>

        </div>

        <div class="formulario-grupo">

            <label for="cargaHoraria">
                Carga Horária
            </label>

            <input
                id="cargaHoraria"
                type="number"
                name="cargaHoraria"
                value="${curso.cargaHoraria}"

        </div>

        <div class="botoes">

            <button
                type="submit"
                class="botao botao-primario">
                Salvar
            </button>

            <a
                class="botao botao-secundario"
                href="${createLink(controller: 'curso', action: 'index')}">
                Cancelar
            </a>

        </div>

    </g:form>

</div>
</body>
</html>