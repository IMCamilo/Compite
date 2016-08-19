<meta name="layout" content="auditoria/auditoria.main"/>
<div class="row">
    <form class="col s12">
        <g:form action="update" id="${auditoria.id}">
            <div class="input-field col s6">
                <g:select name="usuario" from="${auditoria.usuario}" optionValue="nombres" optionKey="id"/>
                <label>Usuario</label>
            </div>
            <div class="input-field col s6">
                <input id="datepicker1" name="fecha" value="${auditoria.fecha}" type="date" class="datepicker">
                <label for="datepicker1">Fecha</label>
            </div>
            <div class="input-field col s12">
                <g:textArea id="desc" class="materialize-textarea" value="${auditoria.descripcion}" name="descripcion"/>
                <label for="desc">Descripción</label>
            </div>
            <!--
            Fecha <g:datePicker name="fecha" value="${new Date()}" noSelection="['':'Selecciona Mes']"/>
            Descripcion <g:textArea name="descripcion" value="" rows="5" cols="40"/>
            -->

            <g:actionSubmit class="waves-effect waves-light btn" value="Update"/>
        </g:form>
    </form>
</div>
