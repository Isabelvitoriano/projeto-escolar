<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Editar Curso</title>
</head>
<body>

<div class="card formulario">
    <div class="card-cabecalho">
        <h2>Editar Curso</h2>
        <button type="button" class="btn share" data-compartilhar>
        <asset:image src="compartilhar.svg" alt=""/>
        Compartilhar formulário</button>
    </div>

    <g:form controller="curso" action="update" id="${curso.id}" method="POST">
        <g:render template="form"/>

        <div class="form-acoes">
            <button type="submit" class="btn atualizar"><asset:image src="resetar.svg" alt=""/>Atualizar</button>
            <g:link controller="curso" action="index" class="btn cancel">Cancelar</g:link>
        </div>
    </g:form>
</div>

</body>
</html>