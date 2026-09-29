<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Novo curso</title>
</head>

<body>

<div class="card-formulario">

    <h2>Novo curso</h2>

    <g:hasErrors bean="${curso}">
        <div class="alerta erro">
            <g:renderErrors bean="${curso}"/>
        </div>
    </g:hasErrors>

    <g:form
        controller="curso"
        action="save"
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
                value="${curso?.titulo ?: ''}"
                placeholder="Ex.: Desenvolvimento Web"
                required>

        </div>

        <div class="formulario-grupo">

            <label for="descricao">
                Descrição
            </label>

            <textarea
                id="descricao"
                name="descricao"
                rows="3"
                placeholder="Resumo do conteúdo do curso"
                required>${curso?.descricao ?: ''}</textarea>

        </div>

        <div class="formulario-grupo">

            <label for="cargaHoraria">
                Carga horária (horas)
            </label>

            <input
                id="cargaHoraria"
                type="number"
                name="cargaHoraria"
                min="1"
                value="${curso?.cargaHoraria ?: ''}"
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
                href="${createLink(controller: 'curso', action: 'index')}">
                Cancelar
            </a>

        </div>

    </g:form>

</div>

</body>
</html>