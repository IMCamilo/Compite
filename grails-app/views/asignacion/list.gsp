<meta name="layout" content="auditoria/auditoria.main"/>

    <g:each in="${asignaciones}" var="asig">
        Usuario ${asig.usuario} <br/>
        Proyecto ${asig.proyecto}<br/>
        Fecha ${asig.fecha}<br/>
        Detalle ${asig.detalle}<br/>
        <g:link action="edit" id="${asig.id}">Editar</g:link><br/>
        <g:link action="delete" id="${asig.id}">Borrar</g:link><br/><br/>
    </g:each>
