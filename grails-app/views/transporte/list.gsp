<meta name="layout" content="auditoria/auditoria.main" />

    <g:each in="${transportes}" var="tran">
        usuario ${tran.usuario} <br/>
        nombre ${tran.nombre}"/><br/>
        marca ${tran.marca}"/><br/>
        modelo ${tran.modelo}"/><br/>
        kmPorLitro ${tran.kmPorLitro}"/><br/>
        descripcion ${tran.descripcion}"/><br/>
        <g:link action="edit" id="${tran.id}">Editar</g:link><br/>
        <g:link action="delete" id="${tran.id}">Borrar</g:link><br/><br/>
    </g:each>
    <g:link action="create">Nuevo transporte</g:link>
