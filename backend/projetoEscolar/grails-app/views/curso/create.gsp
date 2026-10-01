<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Novo Curso</title>
</head>
<body>

<div class="card formulario">
    <div class="card-header">
        <h2>Novo Curso</h2>
        <button type="button" class="btn share" data-compartilhar>
        <asset:image src="compartilhar.svg" alt=""/>
        Compartilhar formulário</button>
    </div>

    <g:form controller="curso" action="save" method="POST">
        <g:render template="form"/>

        <div class="form-acoes">
            <button type="submit" class="btn save"><asset:image src="salvar.svg" alt=""/>Cadastrar</button>
            <g:link controller="curso" action="index" class="btn cancel">Cancelar</g:link>
        </div>
    </g:form>
</div>
</body>
</html>