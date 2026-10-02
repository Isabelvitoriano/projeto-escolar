<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Cursos</title>
</head>
<body>

<h2 class="titulo-pagina">Cursos</h2>

<div class="barra-acoes">
    <div class="busca">
        <asset:image src="pesquisar.svg" alt=""/>
        <input id="busca-cursos" class="campo-busca" type="search" placeholder="Pesquisar por titulo ou ID..."/>
        <g:link controller="curso" action="create" class="btn criar">
        <asset:image src="add.svg" alt=""/>
        Novo curso</g:link>
    </div>
</div>

<div class="visualizacao">
    <table class="tabela" data-tabela data-busca="#busca-cursos">
        <thead>
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Descrição</th>
                <th>Carga Horária</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${cursos}" var="curso">
                <tr data-search="${curso.id} ${curso.titulo}">
                    <td>${curso.id}</td>
                    <td>${curso.titulo}</td>
                    <td>${curso.descricao ?: '-'}</td>
                    <td>${curso.cargaHoraria}h</td>
                    <td>
                        <div class="acoes">
                            <g:link controller="curso" action="edit" id="${curso.id}" class="btn editar"><asset:image src="editar.svg" alt=""/></g:link>
                            <g:form controller="curso" action="delete" id="${curso.id}" method="POST" data-confirm="Tem certeza que deseja remover este curso?">
                                <button type="submit" class="btn remover"><asset:image src="lixeira.svg" alt=""/></button>
                            </g:form>
                        </div>
                    </td>
                </tr>
            </g:each>
            <tr class="linha-vazia" style="${cursos ? 'display:none' : ''}">
                <td colspan="4" class="vazio">Nenhum curso encontrado</td>
            </tr>
        </tbody>
    </table>
</div>
</body>
</html>