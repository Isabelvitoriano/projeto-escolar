<%@ page contentType="text/html;charset=UTF-8" %>

<meta name="layout" content="main">

<title>Alunos</title>
<h2 class="titulo-page">Alunos</h2>

<div class="barra-acoes">
    <div class="busca">
        <asset:image src="pesquisar.svg" alt=""/>
    </div>

    <input
        type="search"
        id="busca-alunos"
        class="campo-busca"
        placeholder="Pesquisar por nome, e-mail, ID..."/>
</div>

<g:link controller="aluno" action="create" class="btn criar">
    <asset:image src="add.svg" alt="" class="add"/>
    Novo Aluno
</g:link>

<div class="table">
    <table
        class="tabela"
        data-tabela
        data-busca="#busca-alunos"
        data-paginacao="#paginacao-alunos">

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
            <g:each var="aluno" in="${ alunos }">
               <tr data-search="${aluno.id} ${aluno.email} ${aluno.dataNascimento}">
                <td>${aluno.id}</td>
                <td>${aluno.nome}</td>
                <td>${aluno.email}</td>
                <td>
                    <g:formatDate
                        date="${aluno.dataNascimento}"
                        format="dd-MM-yyyy"
                    />
                </td>

                <td>
                    <div class="acoes">
                        <g:link
                            controller="aluno"
                            action="edit"
                            id="${aluno.id}"
                            class="btn editar">
                        <asset:image src="editar.svg" alt="" class="edit"/> 
                        </g:link>

                        <g:form
                            controller="aluno"
                            action="delete"
                            id="${aluno.id}"
                            method="POST"
                            data-confirm="Tem certeza que deseja que deseja remover o aluno?">
                        <button type="submit" class="btn excluir">
                            <asset:image src="lixeira.svg" alt="" class="trash"/>
                        </button>
                        </g:form>
                    </div>
                </td>
               </tr>
            </g:each>

            <tr class="linha-vazia" style="${alunos ? 'display:none' : ''}">
                <td class="vazio" colspan="5">
                    Nenhum aluno encontrado
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="paginacao" id="paginacao-alunos"></div>