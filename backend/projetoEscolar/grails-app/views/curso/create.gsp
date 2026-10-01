<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main">

<title>Novo Curso</title>

<div class="card">
    <div class="card-header">

        <h2>Novo curso</h2>

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
        action="save"
        method="POST"
        class="formulario">

        <g:render template="form" model="[curso: curso]"/>

        <div class="form-acoes">
            <g:submitButton
                name="salvar"
                value="Cadastrar"
                class="btn salvar"/>

            <g:link
                controller="curso"
                action="index"
                class="btn cancelar">
                Cancelar
            </g:link>
        </div>
    </g:form>
</div>