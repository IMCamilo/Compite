<meta name="layout" content="auditoria/auditoria.main"/>
<div class="row">
    <form class="col s12">
        <g:form action="save">
            <div class="input-field col s6">
                <g:select name="usuario" from="${usuarios}" optionValue="nombres" optionKey="id"/>
                <label>Usuario</label>
            </div>
            <div class="input-field col s6">
                <input id="datepicker1" name="fecha" value="" type="date" class="datepicker">
                <label for="datepicker1">Fecha</label>
            </div>
            <div class="input-field col s12">
                <g:textArea id="desc" class="materialize-textarea" name="descripcion"/>
                <label for="desc">Descripción</label>
            </div>
            <g:actionSubmit class="waves-effect waves-light btn" value="Save"/>
        </g:form>
    </form>
</div>