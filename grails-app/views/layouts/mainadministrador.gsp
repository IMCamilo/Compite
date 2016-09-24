<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>
<body>
    
    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container" style="float: right; margin-right: 0%">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
                <ul class="nav navbar-nav navbar-left">
                    <li>
                        <a href="${createLink(controller:'programa')}">
                            <i class="fa grails-icon">
                                <asset:image src="grails-cupsonly-logo-white.svg"/>
                            </i> COMPITE
                        </a>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a class="navbar-brand" href="${createLink(controller:'proyecto')}">Proyectos</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'transporte')}">Transporte</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'empresa')}">Empresa</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'asignacion')}">Asignación</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'auditoria')}">Auditoría</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'usuario')}">Usuarios</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'item')}">Item</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'rendicion')}">Rendición</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'Egreso')}">Egreso</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'administrador', action:'reportes')}">Reportes</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'estadistica')}">Estadísticas</a></li>
                    <li role="presentation" class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            ${session.usuarioLogueado.nombres} ${session.usuarioLogueado.paterno} <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="navbar-brand" href="${createLink(controller:'administrador', action:'cargarperfil',)}">Perfil</a></li>
                            <li>
                                <a class="navbar-brand" href="${createLink(controller:'login', action:'logout')}">
                                    Cerrar sesión
                                </a>
                            </li>
                        </ul>
                    </li>

                    <g:pageProperty name="page.nav" />
                </ul>
            </div>
        </div>
    </div>

    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
