<div class="form-grupo">
    <label for="titulo">Título</label>

    <g:textField
        name="titulo"
        id="titulo"
        value="${curso?.titulo}"
        required="true"/>
    
    <g:hasErrors bean="${curso}" field="titulo">
        <div class="campo-erro">
            <g:fieldError bean="${curso}" field="titulo"/>
        </div>
    </g:hasErrors>
</div>

<div class="form-grupo">
    <label for="descricao">Descrição</label>

    <g:textArea
        name="descricao"
        id="descricao"
        value="${curso?.descricao}"
        rows="4"/>
    
    <g:hasErrors bean="${curso}" field="descricao">
        <div class="campo-erro">
            <g:fieldError bean="${curso}" field="descricao"/>
        </div>
    </g:hasErrors>
</div>

<div class="form-grupo">
    <label for="cargaHoraria">Carga Horária</label>

    <g:field
        type="number"
        name="cargaHoraria"
        id="cargaHoraria"
        value="${curso?.cargaHoraria}"
        min="1"
        required="true"/>
    
    <g:hasErrors bean="${curso}" field="cargaHoraria">
        <div class="campo-erro">
            <g:fieldError bean="${curso}" field="cargaHoraria"/>
        </div>
    </g:hasErrors>
</div>