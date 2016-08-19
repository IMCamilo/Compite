<meta name="layout" content="auditoria/auditoria.main"/>
<g:form action="save">
    usuario <g:select name="usuario" from="${usuarios}" optionValue="nombres" optionKey="id"/><br/>
    fecha <g:datePicker name="fechaCreacion" value="${new Date()}" noSelection="['':'Selecciona Mes']"/><br/>
    aprobacion <g:textField name="aprobacion" value="" />
    sedeEnvio <g:textField name="sedeEnvio" value=""/>
    tipoRendicion <g:textField name="tipoRendicion" value="" />
    <g:actionSubmit value="Save"/>
</g:form>