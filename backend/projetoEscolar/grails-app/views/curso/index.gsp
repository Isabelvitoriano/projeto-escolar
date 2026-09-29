<%@ page contentType="text/html;charset=UTF-8" %>

<meta name="layout" content="main">

<title>Cursos</title>
<h2 class="titulo-page">Cursos</h2>

<div class="barra-acoes">
    <div class="busca">
        <asset:image src="pesquisar.svg" alt=""/>
    </div>

    <input
        type="search"
        id="busca-cursos"
        class="campo-busca"
        placeholder="Pesquisar por título ou ID..."/>
</div>

<g:link controller="curso" action="create" class="btn criar">
    <asset:image src="add.svg" alt="" class="add"/>
    Novo Curso
</g:link>

<div class="table">
    <table
        class="tabela"
        data-tabela
        data-busca="#busca-cursos"
        data-paginacao="#paginacao-cursos">

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
            <g:each var="curso" in="${ cursos }">
               <tr data-search="${curso.id} ${curso.titulo} ${curso.descricao}">
                <td>${curso.id}</td>
                <td>${curso.titulo}</td>
                <td>${curso.descricao}</td>
                <td>${curso.cargaHoraria}h</td>

                <td>
                    <div class="acoes">
                        <g:link
                            controller="curso"
                            action="edit"
                            id="${curso.id}"
                            class="btn editar">
                        <asset:image src="editar.svg" alt="" class="edit"/> 
                        </g:link>

                        <g:form
                            controller="curso"
                            action="delete"
                            id="${curso.id}"
                            method="POST"
                            data-confirm="Tem certeza que deseja que deseja remover o curso?">
                        <button type="submit" class="btn excluir">
                            <asset:image src="lixeira.svg" alt="" class="trash"/>
                        </button>
                        </g:form>
                    </div>
                </td>
               </tr>
            </g:each>

            <tr class="linha-vazia" style="${cursos ? 'display:none' : ''}">
                <td class="vazio" colspan="5">
                    Nenhum curso encontrado
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="paginacao" id="paginacao-curso"></div>