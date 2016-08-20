<meta name="layout" content="auditoria/auditoria.main"/>
<div class="row">
    <div class="col l12 m6">
        <div class="card blue-grey darken-1">
            <div class="card-content white-text">
                <span class="card-title">
                    ${usuario.nombres} ${usuario.paterno} ${usuario.materno}
                    <span class="badge white-text">RUT: ${usuario.rut} - ID: ${usuario.id}</span>
                </span>
                <div class="row">
                    <strong>RUT:    </strong>${usuario.rut}<br/>
                    <strong>Nombres: </strong>${usuario.nombres}<br/>
                    <strong>Paterno: </strong>${usuario.paterno}<br/>
                    <strong>Materno: </strong>${usuario.materno}<br/>
                    <strong>direccion: </strong>${usuario.direccion}<br/>
                    <strong>correo: </strong>${usuario.correo}<br/>
                    <strong>telefono: </strong>${usuario.telefono}<br/>
                    <strong>clave: </strong>${usuario.clave}<br/>
                    <strong>tipo: </strong>${usuario.tipo}
                </div>
            </div>
            <div class="card-action">
                <a href=""><g:link action="edit" id="${usuario.id}">Editar</g:link></a>
                <a href=""><g:link action="delete" id="${usuario.id}">Eliminar</g:link></a>
            </div>
        </div>
    </div>
</div>