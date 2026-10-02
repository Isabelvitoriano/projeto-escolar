<%@ page contentType="text/html;charset=UTF-8" %>

<div class="form-grupo">
    <label for="nome">Nome completo</label>
    <input
        type="text"
        id="nome"
        name="nome"
        value="${aluno?.nome}"
        required
        placeholder="Ex: Isabel Vitoriano"/>
    <g:hasErrors bean="${aluno}" field="nome">
        <div class="erro-campo">
            <g:message error="${it}"/>
        </div>
    </g:hasErrors>
</div>

<div class="form-grupo">
    <label for="email">E-mail</label>
    <input
        type="email"
        id="email"
        name="email"
        value="${aluno?.email}"
        required
        placeholder="exemplo@email.com"/>
    <g:hasErrors bean="${aluno}" field="email">
        <div class="erro-campo">
            <g:message error="${it}"/>
        </div>
    </g:hasErrors>
</div>

<div class="form-grupo">
    <label for="dataNascimento">Data de Nascimento</label>
    <input
        type="date"
        name="dataNascimento"
        value="${formatDate(date: aluno?.dataNascimento, format: 'yyyy-MM-dd')}"/>
    <g:hasErrors bean="${aluno}" field="dataNascimento">
        <div class="erro-campo">
            <g:message error="${it}"/>
        </div>
    </g:hasErrors>
</div>