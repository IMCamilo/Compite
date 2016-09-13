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
                <a class="navbar-brand" href="${createLink(controller:'proyecto', action:'index')}">Proyectos</a>
                <a class="navbar-brand" href="${createLink(controller:'transporte', action:'index')}">Transporte</a>
                <a class="navbar-brand" href="${createLink(controller:'empresa', action:'index')}">Empresa</a>
                <a class="navbar-brand" href="${createLink(controller:'asignacion', action:'index')}">Asignación</a>
                <a class="navbar-brand" href="${createLink(controller:'auditoria', action:'index')}">Auditoría</a>
                <a class="navbar-brand" href="${createLink(controller:'usuario', action:'index')}">Usuarios</a>
                <a class="navbar-brand" href="${createLink(controller:'item', action:'index')}">Item</a>
                <a class="navbar-brand" href="${createLink(controller:'rendicion', action:'index')}">Rendición</a>
                <a class="navbar-brand" href="${createLink(controller:'Egreso', action:'index')}">Egreso</a>
                <a class="navbar-brand" href="${createLink(controller:'administrador', action:'reportes')}">Reportes</a>
                <!-- <li><a class="dropdown-button" href="#!" data-activates="dropdown1">(Controllers)<i class="material-icons right">arrow_drop_down</i></a></li> -->
                <a class="navbar-brand" href="${createLink(controller:'login', action:'logout')}">Cerrar Sesión</a>
            </div>
            <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
                <ul class="nav navbar-nav navbar-right">
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
