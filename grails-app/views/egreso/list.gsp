<meta name="layout" content="auditoria/auditoria.main"/>
<g:each in="${egresos}" var="egreso">
    Usuario ${egreso.usuario} <br/>
    Fecha ${egreso.fechaCreacion}<br/>
    aprobacion ${egreso.aprobacion}<br/>
    sedeEnvio ${egreso.sedeEnvio}<br/>
    tipoRendicion ${egreso.tipoRendicion}<br/>
    <g:link action="edit" id="${egreso.id}">Editar</g:link><br/>
    <g:link action="delete" id="${egreso.id}">Borrar</g:link><br/><br/>
</g:each>
<g:link action="create">Nueva auditoria</g:link>

