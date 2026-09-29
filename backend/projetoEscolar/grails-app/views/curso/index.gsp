<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Cursos</title>
</head>

<body>

<div class="barra-acoes">

    <h2>Cursos</h2>

    <a
        class="botao botao-primario"
        href="${createLink(controller: 'curso', action: 'create')}">
        + Novo curso
    </a>

</div>

<form
    method="GET"
    action="${createLink(controller: 'curso', action: 'index')}">

    <input
        class="campo-busca"
        type="text"
        name="busca"
        value="${params.busca ?: ''}"
        placeholder="Pesquisar por título ou ID...">

    <button
        class="botao botao-secundario"
        type="submit">
        Pesquisar
    </button>

</form>

<br>

<table class="tabela">

    <thead>

    <tr>
        <th>ID</th>
        <th>Título</th>
        <th>Descrição</th>
        <th>Carga horária</th>
        <th>Ações</th>
    </tr>

    </thead>

    <tbody>

    <g:each in="${cursos}" var="curso">

        <tr>

            <td>${curso.id}</td>

            <td>${curso.titulo}</td>

            <td>${curso.descricao}</td>

            <td>${curso.cargaHoraria}</td>

            <td>

                <div class="acoes">
                    <a
                        class="botao botao-secundario"
                        href="${createLink(
                            controller: 'curso',
                            action: 'edit',
                            id: curso.id
                        )}">
                        Editar
                    </a>

                    <g:form
                        controller="curso"
                        action="delete"
                        id="${curso.id}"
                        method="POST">

                        <button
                            class="botao botao-perigo"
                            type="submit"
                            onclick="return confirm('Tem certeza que deseja remover este curso?');">
                            Remover
                        </button>
                    </g:form>
                </div>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>