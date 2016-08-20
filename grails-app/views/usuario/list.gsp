<meta name="layout" content="auditoria/auditoria.main"/>
<g:each in="${usuarios}" var="usuario">
    <div class="row">
        <div class="col s12">
            <div class="card blue-grey darken-1">
                <div class="card-content white-text">
                    <div class="card-content white-text">
                        <span class="card-title">${usuario.nombres} ${usuario.paterno}<span class="badge white-text">ID: ${usuario.rut}</span></span>
                        <p>
                            <strong class="deep-orange-text">RUT: </strong>${usuario.rut} Nombres: ${usuario.nombres} Paterno: ${usuario.paterno}
                            materno: ${usuario.materno}<br/>
                            direccion: ${usuario.direccion}<br/>
                            correo: ${usuario.correo}<br/>
                            telefono: ${usuario.telefono}<br/>
                            clave: ${usuario.clave}<br/>
                            tipo: ${usuario.tipo}
                        </p>
                    </div>
                    <div class="card-action">
                        <a href=""><g:link action="edit" id="${usuario.id}">Editar</g:link></a>
                        <a href=""><g:link action="delete" id="${usuario.id}">Eliminar</g:link></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:each>
<g:link action="create">Create new usuario</g:link>