<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width-device-width, initial-scale=1">

    <title>
        <g:layoutTitle default="DevSchool"/>
    </title>
    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>
<header class="cabecalho">
    <div class="icon">
        <asset:image src="icon.svg" alt="DevSchool" class="icon"/>
    </div>

    <div class="titulo">
        <h1>DevSchool</h1>
    </div>
</header>

<nav class="navbar">
    <g:link controller="aluno" action="index" class="${params.controller == 'aluno' ? 'ativo' : ''}">
        <span class="item-menu">
            <asset:image src="aluno.svg" alt="" class="icon-menu"/>
            Alunos
            <span class="contador">
                ${projetoescolar.Aluno.count()}
            </span>
        </span>
    </g:link>

    <g:link controller="curso" action="index" class="${params.controller == 'curso' ? 'ativo' : ''}">
        <span class="item-menu">
            <asset:image src="curso.svg" alt="" class="icon-menu"/>
            Cursos
            <span class="conta">
                ${projetoescolar.Curso.count()}
            </span>
        </span>
    </g:link>

    <g:link controller="matricula" action="index" class="${params.controller == 'matricula' ? 'ativo' : ''}">
        <span class="item-menu">
            <asset:image src="matricula.svg" alt="" class="icon-menu"/>
            Matrículas
            <span class="conta">
                ${projetoescolar.Matricula.count()}
            </span>
        </span>
    </g:link>
</nav>

<main class="conteudo">
    <g:if test="${ flash.message }">
       <div class="alerta sucesso">
            ${flash.message}
       </div>
    </g:if>

    <g:if test="${ flash.error }">
       <div class="alerta erro">
            ${flash.error}
       </div>
    </g:if>

    <g:layoutBody/>
</main>

<asset:javascript src="application.js"/>

</body>
</html>