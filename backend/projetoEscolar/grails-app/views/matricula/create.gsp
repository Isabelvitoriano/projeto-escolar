<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Matrículas</title>
</head>

<body>

<div class="barra-acoes">

    <h2>Matrículas</h2>

    <a
        class="botao botao-primario"
        href="${createLink(
            controller: 'matricula',
            action: 'create'
        )}">
        + Nova matrícula
    </a>

</div>

<form
    method="GET"
    action="${createLink(
        controller: 'matricula',
        action: 'index'
    )}">

    <input
        class="campo-busca"
        type="text"
        name="busca"
        value="${params.busca ?: ''}"
        placeholder="Pesquisar por ID, aluno ou curso...">

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
        <th>Aluno</th>
        <th>Curso</th>
        <th>Data</th>
        <th>Valor pago</th>
        <th>Ações</th>
    </tr>

    </thead>

    <tbody>

    <g:each in="${matriculas}" var="matricula">

        <tr>

            <td>
                ${matricula.id}
            </td>

            <td>
                ${matricula.aluno?.nome ?: '-'}
            </td>

            <td>
                ${matricula.curso?.titulo ?: '-'}
            </td>

            <td>
                <g:formatDate
                    date="${matricula.dataMatricula}"
                    format="dd/MM/yyyy"/>
            </td>

            <td>
                <g:formatNumber
                    number="${matricula.valorPago}"
                    type="currency"
                    currencyCode="BRL"/>
            </td>

            <td>

                <div class="acoes">

                    <a
                        class="botao botao-secundario"
                        href="${createLink(
                            controller: 'matricula',
                            action: 'edit',
                            id: matricula.id
                        )}">
                        Editar
                    </a>

                    <g:form
                        controller="matricula"
                        action="delete"
                        id="${matricula.id}"
                        method="POST">

                        <button
                            class="botao botao-perigo"
                            type="submit"
                            onclick="return confirm('Tem certeza que deseja remover esta matrícula?');">
                            Remover
                        </button>

                    </g:form>

                </div>

            </td>

        </tr>

    </g:each>

    <g:if test="${!matriculas}">
        <tr>
            <td colspan="6">
                Nenhuma matrícula encontrada.
            </td>
        </tr>
    </g:if>

    </tbody>

</table>

</body>
</html>