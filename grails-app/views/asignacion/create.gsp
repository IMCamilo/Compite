<meta name="layout" content="auditoria/auditoria.main"/>
    <g:form action="save">
        usuario <g:select name="usuario" from="${usuarios}" optionValue="nombres" optionKey="id"/><br/>
        proyecto <g:select name="proyecto" from="${proyectos}" optionValue="nombre" optionKey="id"/><br/>
        fecha <g:datePicker name="fecha" value="${new Date()}" noSelection="['':'Selecciona Mes']"/><br/>
        detalle <g:textArea name="detalle" value="" />
        <g:actionSubmit value="Save"/>
    </g:form>