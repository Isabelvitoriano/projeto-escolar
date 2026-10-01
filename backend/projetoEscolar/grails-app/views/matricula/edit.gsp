<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Editar Matrícula</title>
</head>
<body>

<div class="card formulario">
    <div class="card-cabecalho">
        <h2>Editar Matrícula</h2>
        <button type="button" class="btn btn-small" data-compartilhar>Compartilhar formulário</button>
    </div>

    <g:form controller="matricula" action="update" id="${matricula.id}" method="POST">
        <g:render template="form"/>

        <div class="form-acoes">
            <button type="submit" class="btn btn-primary">Atualizar</button>
            <g:link controller="matricula" action="index" class="btn">Cancelar</g:link>
        </div>
    </g:form>
</div>

</body>
</html>