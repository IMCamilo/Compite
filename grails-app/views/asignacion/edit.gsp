<meta name="layout" content="auditoria/auditoria.main"/>
<g:form action="update" id="${asignacion.id}">
    usuario <g:select name="usuario" from="${usuarios}" optionValue="nombres" optionKey="id"/><br/>
    proyecto <g:select name="proyecto" from="${proyectos}" optionValue="nombre" optionKey="id"/><br/>
    fecha <g:datePicker name="fecha" value="${new Date()}" noSelection="['':'Selecciona Mes']"/><br/>
    detalle <g:textArea name="detalle" value="${asignacion.detalle}" />
    <g:actionSubmit value="Update"/>
</g:form>
