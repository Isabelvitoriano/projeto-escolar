<div class="form-grupo">
    <label for="titulo">Título</label>

    <g:textField
        name="titulo"
        id="titulo"
        value="${curso?.titulo}"
        required="true"/>

    <g:hasError bean="${curso}" field="titulo">
        <div class="erro-campo">
            <g:fieldError
                bean="${curso}"
                field="titulo"/>
        </div>
    </g:hasError>
</div>

<div class="form-grupo">
    <label for="descricao">Descrição</label>

    <g:textField
        name="descricao"
        id="descricao"
        value="${curso?.descricao}"
        rows="4"/>

    <g:hasError bean="${curso}" field="descricao">
        <div class="erro-campo">
            <g:fieldError
                bean="${curso}"
                field="descricao"/>
        </div>
    </g:hasError>
</div>

<div class="form-grupo">
    <label for="cargaHoraria">Carga Horária</label>

    <g:textField
        type="number"
        name="cargaHoraria"
        id="cargaHoraria"
        value="${curso?.cargaHoraria}"
        min="1"
        required="true"/>

    <g:hasError bean="${curso}" field="cargaHoraria">
        <div class="erro-campo">
            <g:fieldError
                bean="${curso}"
                field="cargaHoraria"/>
        </div>
    </g:hasError>
</div>