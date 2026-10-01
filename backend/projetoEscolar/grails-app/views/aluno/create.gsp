<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main">

<title>Novo Aluno</title>

<div class="card">
    <div class="card-header">

        <h2>Novo aluno</h2>

        <g:link
            controller="aluno"
            action="index"
            class="btn voltar">

            <asset:image src="voltar.svg" alt="" class="back"/>
            Voltar
        </g:link>

    </div>

    <g:form
        controller="aluno"
        action="save"
        method="POST"
        class="formulario">

        <g:render template="form" model="[aluno: aluno]"/>

        <div class="form-acoes">
            <g:submitButton
                name="salvar"
                value="Cadastrar"
                class="btn salvar"/>

            <g:link
                controller="aluno"
                action="index"
                class="btn cancelar">
                Cancelar
            </g:link>
        </div>
    </g:form>
</div>