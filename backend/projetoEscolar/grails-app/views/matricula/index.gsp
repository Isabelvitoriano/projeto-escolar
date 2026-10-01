<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Matrículas</title>
</head>
<body>

<h2 class="titulo-pagina">Matrículas</h2>

<div class="barra-acoes">
    <div class="busca-wrapper">
        <asset:image src="pesquisar.svg" alt=""/>
        <input id="busca-matriculas" class="campo-busca" type="search" placeholder="Pesquisar por aluno, curso ou ID..."/>
    </div>
    <g:link controller="matricula" action="create" class="btn btn-primary">+ Nova matrícula</g:link>
</div>

<div class="tabela-wrapper">
    <table class="tabela" data-tabela data-busca="#busca-matriculas" data-paginacao="#paginacao-matriculas">
        <thead>
            <tr>
                <th>ID</th>
                <th>Aluno</th>
                <th>Curso</th>
                <th>Data da Matrícula</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${matriculas}" var="matricula">
                <tr data-search="${matricula.id} ${matricula.aluno?.nome} ${matricula.curso?.titulo}">
                    <td>${matricula.id}</td>
                    <td>${matricula.aluno?.nome}</td>
                    <td>${matricula.curso?.titulo}</td>
                    <td><g:formatDate date="${matricula.dataMatricula}" format="dd/MM/yyyy"/></td>
                    <td>
                        <div class="acoes">
                            <g:link controller="matricula" action="edit" id="${matricula.id}" class="btn btn-small">Editar</g:link>
                            <g:form controller="matricula" action="delete" id="${matricula.id}" method="POST" data-confirm="Tem certeza que deseja cancelar esta matrícula?">
                                <button type="submit" class="btn btn-danger btn-small">Remover</button>
                            </g:form>
                        </div>
                    </td>
                </tr>
            </g:each>
            <tr class="linha-vazia" style="${matriculas ? 'display:none' : ''}">
                <td colspan="5" class="vazio">Nenhuma matrícula encontrada</td>
            </tr>
        </tbody>
    </table>
</div>

<div id="paginacao-matriculas" class="paginacao"></div>

</body>
</html>