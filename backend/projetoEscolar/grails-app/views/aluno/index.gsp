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
        <g:link controller="aluno" action="create" class="create-btn">
            <svg id="add" width="64px" height="64px" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">

            <g id="SVGRepo_bgCarrier" stroke-width="0"/>

            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>

            <g id="SVGRepo_iconCarrier"> <path d="M4 12H20M12 4V20" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/> </g>

            </svg>
        Novo aluno</g:link>
    </div>
</div>

<div class="visualizacao">
    <h2 class="titulo-page">Alunos Cadastrados</h2>

    <table class="tabela" data-tabela data-busca="#busca-alunos">
        <thead class="tabela-header">
            <tr>
                <th>MATRÍCULA / ID</th>
                <th>NOME COMPLETO</th>
                <th>E-MAIL</th>
                <th>NASCIMENTO</th>
                <th>AÇÕES</th>
            </tr>
        </thead>
        <tbody class="tabela-body">
            <g:each in="${alunos}" var="aluno">
                <tr data-search="${aluno.id} ${aluno.nome} ${aluno.email}">
                    <td id="coluna-center">${aluno.id}</td>
                    <td>${aluno.nome}</td>
                    <td>${aluno.email}</td>
                    <td><g:formatDate date="${aluno.dataNascimento}" format="dd/MM/yyyy"/></td>
                    <td>
                        <div class="acoes">
                            <g:link controller="aluno" action="edit" id="${aluno.id}" class="btn editar">
                                <svg id="edit" width="800px" height="800px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <title/>
                                <g id="Complete">
                                <g id="editar">
                                <g>
                                <path d="M20,16v4a2,2,0,0,1-2,2H4a2,2,0,0,1-2-2V6A2,2,0,0,1,4,4H8" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
                                <polygon fill="none" points="12.5 15.8 22 6.2 17.8 2 8.3 11.5 8 16 12.5 15.8" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
                                </g>
                                </g>
                                </g>
                                </svg>
                            </g:link>
                            <g:form controller="aluno" action="delete" id="${aluno.id}" method="POST" data-confirm="Tem certeza que deseja remover este aluno?">
                                <button type="submit" class="remover">
                                    <svg id="trash" width="800px" height="800px" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M160 256H96a32 32 0 0 1 0-64h256V95.936a32 32 0 0 1 32-32h256a32 32 0 0 1 32 32V192h256a32 32 0 1 1 0 64h-64v672a32 32 0 0 1-32 32H192a32 32 0 0 1-32-32V256zm448-64v-64H416v64h192zM224 896h576V256H224v640zm192-128a32 32 0 0 1-32-32V416a32 32 0 0 1 64 0v320a32 32 0 0 1-32 32zm192 0a32 32 0 0 1-32-32V416a32 32 0 0 1 64 0v320a32 32 0 0 1-32 32z"/></svg>
                                </button>
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