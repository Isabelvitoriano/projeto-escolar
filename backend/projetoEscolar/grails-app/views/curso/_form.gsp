<%@ page contentType="text/html;charset=UTF-8" %>

<div class="form-grupo">
    <label for="titulo">Título do Curso</label>
    <input type="text" id="titulo" name="titulo" value="${curso?.titulo}" required placeholder="Ex: Ciência da Computação"/>
    <g:hasErrors bean="${curso}" field="titulo">
        <div class="erro-campo"><g:message error="${it}"/></div>
    </g:hasErrors>
</div>

<div class="form-grupo">
    <label for="descricao">Descrição</label>
    <textarea id="descricao" name="descricao" rows="4" placeholder="Descreva o conteúdo do curso...">${curso?.descricao}</textarea>
    <g:hasErrors bean="${curso}" field="descricao">
        <div class="erro-campo"><g:message error="${it}"/></div>
    </g:hasErrors>
</div>

<div class="form-grupo">
    <label for="cargaHoraria">Carga Horária</label>
    <input type="number" value="${curso?.cargaHoraria}" id="cargaHoraria" name="cargaHoraria" min="1" required></field>
    <g:hasErrors bean="${curso}" field="cargaHoraria">
        <div class="erro-campo"><g:message error="${it}"/></div>
    </g:hasErrors>
</div>