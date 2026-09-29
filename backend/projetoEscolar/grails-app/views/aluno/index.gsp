<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Alunos</title>
</head>

<body>
<div class="barra-acoes">
    <h2>Alunos</h2>

    <a href="${createLink(controller: 'aluno', action: 'create')}"
    class="botao botao-primario">
        <div>
            <asset:image
                src="add.svg"
                alt="adicionar"
                class="add"/>
        </div>
        Novo Aluno
    </a>
</div>

<form method="GET" action="${createLink(controller: 'aluno', action: 'index')}">
    <input
        class="campo-busca"
        type="text"
        name="busca"
        value="${params.busca ?: ''}"
        placeholder="Pesquisar por nome, e-mail ou ID...">

    <button class="botao botao-secundario" type="submit">
        <div>
            <asset:image
                src="pesquisar.sgv"
                alt="pesquisar"
                class="search"/>
        </div>
        Pesquisar
    </button>
</form>

<br>

<table class="tabela">
    <thead>
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>E-mail</th>
        <th>Data de Nascimento</th>
        <th>Ações</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${alunos}" var="aluno">
        <tr>
            <td>
                ${aluno.id}
            </td>
            <td>
                ${aluno.nome}
            </td>
            <td>
                ${aluno.email}
            </td>
            <td>
                <g:formatDate
                    date="${aluno.dataNascimento}"
                    format="dd-MM-yyyy"/>
            </td>
            <td>
                <div class="acoes">
                    <a href="${createLink(controller: 'aluno', action: 'edit', id: aluno.id)}"
                    class="botao editar">
                    <div>
                        <asset:image
                            src="editar.svg"
                            alt="editar"
                            class="edit"/>
                    </div>
                    </a>

                    <g:form
                        controller="aluno"
                        action="delete"
                        id="${aluno.id}"
                        method="DELETE">
                        <button
                        class="botao"
                        type="submit"
                        onclick="return confirm('Tem certeza que deseja remover este aluno?');">
                        <div>
                            <asset:image
                                src="lixeira.svg"
                                alt="remover"
                                class="delete"/>
                        </div>
                        </button>
                    </g:form>
                </div>
            </td>
        </tr>
    </g:each>

    <g:if test="${!alunos}">
        <tr>
            <td colspan="5">
                Nenhum aluno encontrado.
            </td>
        </tr>
    </g:if>
</table>
</body>
</html>