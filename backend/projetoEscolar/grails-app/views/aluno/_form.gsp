<div class="form-grupo">
    <label for="nome">Nome</label>

    <g:textField
        name="nome"
        id="nome"
        value="${aluno?.nome}"
        required="true"/>
    
    <g:hasErrors bean="${aluno}" field="nome">
        <div class="campo-erro">
            <g:fieldError bean="${aluno}" field="nome"/>
        </div>
    </g:hasErrors>
</div>

<div class="form-grupo">
    <label for="email">Email</label>

    <g:field
        type="email"
        name="email"
        id="email"
        value="${aluno?.email}"
        required="true"/>
    
    <g:hasErrors bean="${aluno}" field="email">
        <div class="campo-erro">
            <g:fieldError bean="${aluno}" field="email"/>
        </div>
    </g:hasErrors>
</div>

<div class="form-grupo">
    <label for="dataNascimento">Data de Nascimento</label>

    <g:field
        type="date"
        name="dataNascimento"
        id="dataNascimento"
        value="${aluno?.dataNascimento ? formatDate(date: aluno.dataNascimento, format: 'dd-MM-yyyy') :  ''}"
        required="true"/>
    
    <g:hasErrors bean="${aluno}" field="dataNascimento">
        <div class="campo-erro">
            <g:fieldError bean="${aluno}" field="dataNascimento"/>
        </div>
    </g:hasErrors>
</div>