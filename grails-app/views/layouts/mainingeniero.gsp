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
                    <a href="${createLink(controller:'proyecto', action:'index')}">
                        <i class="fa grails-icon">
                            <asset:image src="grails-cupsonly-logo-white.svg"/>
                        </i> COMPITE
                    </a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a class="navbar-brand" href="${createLink(controller:'ingeniero')}">Proyectos</a></li>
                <li><a class="navbar-brand" href="${createLink(controller:'egresoMov')}">Egreso Movilizacion</a></li>
                <li><a class="navbar-brand" href="${createLink(controller:'ingeniero', action:'cargarperfil',)}">Perfil</a></li>
                <li>
                    <a class="navbar-brand" href="${createLink(controller:'login', action:'logout')}">
                        Cerrar sesión ${session.usuarioLogueado.nombres} ${session.usuarioLogueado.paterno}
                    </a>
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
