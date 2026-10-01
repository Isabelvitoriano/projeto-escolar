<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Alunos</title>
</head>
<body>

<h2 class="titulo-pagina">Alunos</h2>

<div class="barra-acoes">
    <div class="busca">
        <asset:image src="pesquisar.svg" alt=""/>
        <input id="busca-alunos" class="campo-busca" type="search" placeholder="Pesquisar por nome, e-mail ou ID..."/>
        <g:link controller="aluno" action="create" class="btn criar">
        <asset:image src="add.svg" alt=""/>
        Novo aluno</g:link>
    </div>
</div>

<div class="tabela-wrapper">
    <table class="tabela" data-tabela data-busca="#busca-alunos">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Data de nascimento</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${alunos}" var="aluno">
                <tr data-search="${aluno.id} ${aluno.nome} ${aluno.email}">
                    <td>${aluno.id}</td>
                    <td>${aluno.nome}</td>
                    <td>${aluno.email}</td>
                    <td><g:formatDate date="${aluno.dataNascimento}" format="dd/MM/yyyy"/></td>
                    <td>
                        <div class="acoes">
                            <g:link controller="aluno" action="edit" id="${aluno.id}" class="btn editar"><asset:image src="editar.svg" alt=""/></g:link>
                            <g:form controller="aluno" action="delete" id="${aluno.id}" method="POST" data-confirm="Tem certeza que deseja remover este aluno?">
                                <button type="submit" class="btn remover"><asset:image src="lixeira.svg" alt=""/></button>
                            </g:form>
                        </div>
                    </td>
                </tr>
            </g:each>
            <tr class="linha-vazia" style="${alunos ? 'display:none' : ''}">
                <td colspan="5" class="vazio">Nenhum aluno encontrado</td>
            </tr>
        </tbody>
    </table>
</div>
</body>
</html>