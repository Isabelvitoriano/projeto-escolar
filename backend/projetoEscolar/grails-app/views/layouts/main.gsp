<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>
        <g:layoutTitle default="DevSchool"/>
    </title>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>
<header class="cabecalho">
    <div class="icone">
        <asset:image
            src="icon.svg"
            alt="DevSchool"
            class="icon"/>
    </div>

    <div class="titulo">
        <h1>DevSchool</h1>
    </div>
</header>

<nav class="navbar">
    <a href="${createLink(controller: 'aluno', action: 'index')}"
    class="${controllerName == 'aluno' ? 'ativo' : ''}">
    Alunos
    <span class="contador">
        ${totalAlunos ?: 0}
    </span>
    </a>
    <a href="${createLink(controller: 'curso', action: 'index')}"
    class="${controllerName == 'curso' ? 'ativo' : ''}">
    Cursos
    <span class="contador">
        ${totalCursos ?: 0}
    </span>
    </a>
    <a href="${createLink(controller: 'matricula', action: 'index')}"
    class="${controllerName == 'matricula' ? 'ativo' : ''}">
    Matrículas
    <span class="contador">
        ${totalMatriculas ?: 0}
    </span>
    </a>
</nav>

<main class="conteudo">
    <g:if test="${flash.message}">
        <div class="alerta-sucesso">
            ${flash.message}
        </div>
    </g:if>

    <g:if test="${flash.error}">
    <div class="alerta-erro">
        ${flash.error}
    </div>
    </g:if>

    <g:Layoutbody/>
</main>

<asset:javascript src="application.js"/>

</body>