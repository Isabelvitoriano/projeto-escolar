<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main">

<title>Editar Curso</title>

<div class="card">
    <div class="card-header">
        <h2>Editar Curso</h2>

        <g:link
            controller="curso"
            action="index"
            class="btn voltar">
            <asset:image src="voltar.svg" alt="" class="back"/>
            Voltar
        </g:link>
    </div>

    <g:form
        controller="curso"
        action="update"
        id="${curso.id}"
        method="POST"
        class="formulario">
    
        <g:render template="form" model="[curso: curso]" />

        <div class="form-acoes">
            <g:submitButton
                <asset:image src="salvar.svg" alt="" class="save"/>
                name="atualizar"
                value="Salvar"
                class="btn update"/>

            <g:link
                controller="curso"
                action="index"
                class="btn cancelar">
                Cancelar
            </g:link>
        </div>        
    </g:form>
</div>