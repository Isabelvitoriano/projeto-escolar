<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Alunos</title>
</head>
<body>

<div class="barra-acoes">
    <div class="busca">
        <svg id="search" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.7955 15.8111L21 21M18 10.5C18 14.6421 14.6421 18 10.5 18C6.35786 18 3 14.6421 3 10.5C3 6.35786 6.35786 3 10.5 3C14.6421 3 18 6.35786 18 10.5Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <input id="busca-alunos" class="campo-busca" type="search" placeholder="Pesquisar por nome, e-mail ou ID..."/>
    </div>
    <div class="criar">
        <g:link controller="aluno" action="create" class="btn">
        <svg id="add" width="64px" height="64px" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">

        <g id="SVGRepo_bgCarrier" stroke-width="0"/>

        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>

        <g id="SVGRepo_iconCarrier"> <path d="M4 12H20M12 4V20" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/> </g>

        </svg>
        Novo aluno</g:link>
    </div>
</div>

<div class="visualizacao">
    <h2 class="titulo-page">Alunos</h2>

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