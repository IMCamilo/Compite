<meta name="layout" content="auditoria/auditoria.main"/>
<g:form action="update" id="${usuario.id}">
    rut: <g:textField name="rut" value="${usuario.rut}"/><br />
    nombres: <g:textField name="nombres" value="${usuario.nombres}"/><br />
    paterno: <g:textField name="paterno" value="${usuario.paterno}"/><br />
    materno: <g:textField name="materno" value="${usuario.materno}"/><br />
    direccion: <g:textField name="direccion" value="${usuario.direccion}"/><br />
    correo: <g:textField name="correo" value="${usuario.correo}"/><br />
    telefono: <g:textField name="telefono" value="${usuario.telefono}"/><br />
    clave: <g:textField name="clave" value="${usuario.clave}"/><br />
    tipo: <g:textField name="tipo" value="${usuario.tipo}"/><br />
    <g:actionSubmit value="Update" />
</g:form>
