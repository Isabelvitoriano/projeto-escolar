<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Matrículas</title>
</head>
<body>

<div class="barra-acoes">
    <div class="busca">
        <svg id="search" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.7955 15.8111L21 21M18 10.5C18 14.6421 14.6421 18 10.5 18C6.35786 18 3 14.6421 3 10.5C3 6.35786 6.35786 3 10.5 3C14.6421 3 18 6.35786 18 10.5Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <input
            id="busca-matriculas"
            class="campo-busca"
            type="search"
            placeholder="Pesquisar por aluno, curso ou ID..."/>
    </div>
    <div class="criar">
        <g:link controller="matricula" action="create" class="create-btn">
            <svg id="add" width="64px" height="64px" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">

            <g id="SVGRepo_bgCarrier" stroke-width="0"/>

            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>

            <g id="SVGRepo_iconCarrier"> <path d="M4 12H20M12 4V20" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/> </g>

            </svg>
            Nova matrícula
        </g:link>
    </div>
</div>

<div class="visualizacao matriculas">
    <h2 class="titulo-page">Matrículas Cadastradas</h2>

    <table class="tabela matriculas" data-tabela data-busca="#busca-matriculas">
    <thead class="tabela-header">
        <tr>
            <th>ID</th>
            <th>ALUNO</th>
            <th>CURSO</th>
            <th>DATA</th>
            <th>VALOR</th>
            <th>AÇÕES</th>
        </tr>
    </thead>
    <tbody class="tabela-body">
        <g:each in="${matriculas}" var="matricula">
            <tr data-search="${matricula.id} ${matricula.aluno?.nome} ${matricula.curso?.titulo}">
                <td id="coluna-center">${matricula.id}</td>
                <td>${matricula.aluno?.nome}</td>
                <td>${matricula.curso?.titulo}</td>
                <td id="coluna-center"><g:formatDate date="${matricula.dataMatricula}" format="dd/MM/yyyy"/></td>
                <td>R$${matricula.valorPago}</td>
                <td>
                    <div class="acoes">
                        <g:link controller="matricula" action="edit" id="${matricula.id}" class="btn editar">
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
                        <g:form controller="matricula" action="delete" id="${matricula.id}" method="POST" data-confirm="Tem certeza que deseja cancelar esta matrícula?">
                            <button type="submit" class="btn remover">
                                    <svg id="trash" width="800px" height="800px" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M160 256H96a32 32 0 0 1 0-64h256V95.936a32 32 0 0 1 32-32h256a32 32 0 0 1 32 32V192h256a32 32 0 1 1 0 64h-64v672a32 32 0 0 1-32 32H192a32 32 0 0 1-32-32V256zm448-64v-64H416v64h192zM224 896h576V256H224v640zm192-128a32 32 0 0 1-32-32V416a32 32 0 0 1 64 0v320a32 32 0 0 1-32 32zm192 0a32 32 0 0 1-32-32V416a32 32 0 0 1 64 0v320a32 32 0 0 1-32 32z"/></svg>
                            </button>
                        </g:form>
                    </div>
                </td>
            </tr>
        </g:each>
        <tr class="linha-vazia" style="${matriculas ? 'display:none' : ''}">
            <td colspan="6" class="vazio">Nenhuma matrícula encontrada</td>
        </tr>
    </tbody>
</table>
</div>
</body>
</html>