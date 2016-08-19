<meta name="layout" content="auditoria/auditoria.main"/>
<g:each in="${auditorias}" var="auditoria">
    <div class="row">
        <div class="col s12">
            <div class="card blue-grey darken-1">
                <div class="card-content white-text">
                    <span class="card-title">Fecha: ${auditoria.fecha}<span class="badge white-text">ID: ${auditoria.id}</span></span>
                    <p>Descrición: ${auditoria.descripcion}</p>
                </div>
                <div class="card-action">
                    <a href=""><g:link action="edit" id="${auditoria.id}">Editar</g:link></a>
                    <a href=""><g:link action="delete" id="${auditoria.id}">Borrar</g:link></a>
                </div>
            </div>
        </div>
    </div>
</g:each>