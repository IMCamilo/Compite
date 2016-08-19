<meta name="layout" content="auditoria/auditoria.main"/>
<div class="navbar-fixed">
    <nav class="white" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="index.html" class="brand-logo">
                <asset:image src="compite/compite2.png" alt="logo" class="img-responsive" width="50%" height="50%" style="padding-top:10px"/>
            </a>

            <ul class="right hide-on-med-and-down">
                <li><a href="${createLink(controller:'auditoria', action:'list')}">Listar</a></li>
                <li><a href="${createLink(controller:'auditoria', action:'create')}">Nuevo Registro</a></li>
                <li><a href="${createLink(controller:'login', action:'login')}">Carrar Sesión</a></li>
            </ul>
        </div>
    </nav>
</div>

<div class="container">
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
</div>