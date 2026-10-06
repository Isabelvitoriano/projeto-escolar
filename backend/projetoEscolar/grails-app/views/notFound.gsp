<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Página não encontrada</title>
</head>
<body>
    <div class="card not-found">
        <h2>${titulo ?: 'Página não encontrada'}</h2>
        <p>O recurso que você tentou acessar não existe ou foi removido.</p>
        <g:link controller="aluno" action="index">Voltar ao início</g:link>
    </div>
</body>
</html>