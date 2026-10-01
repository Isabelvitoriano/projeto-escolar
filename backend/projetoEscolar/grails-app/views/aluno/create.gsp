<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Novo Aluno</title>
</head>
<body>

<div class="card formulario">
    <div class="card-cabecalho">
        <h2>Novo Aluno</h2>
    </div>

    <g:form controller="aluno" action="save" method="POST">
        <g:render template="form"/>

        <div class="form-acoes">
            <button type="submit" class="btn btn-primary">Salvar</button>
            <g:link controller="aluno" action="index" class="btn">Cancelar</g:link>
        </div>
    </g:form>
</div>

</body>
</html>