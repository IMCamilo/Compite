<meta name="layout" content="auditoria/auditoria.main"/>
<g:form action="update" id="${egreso.id}">
    Usuario <g:select name="usuario" from="${egreso.usuario}" optionValue="nombres" optionKey="id"/><br/>
    Fecha <g:datePicker name="fechaCreacion" value="${new Date()}" noSelection="['':'Selecciona Mes']"/><br/>
    aprobacion <g:textField name="aprobacion" value="${egreso.aprobacion}" />
    sedeEnvio <g:textField name="sedeEnvio" value="${egreso.sedeEnvio}"/>
    tipoRendicion <g:textField name="tipoRendicion" value="${egreso.tipoRendicion}" />
    <g:actionSubmit value="Update" />
</g:form>
