<title>COMPITE - Iniciar sesión</title>
<meta name="layout" content="administrador"/>

<nav class="white" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="index.html" class="brand-logo">
            <asset:image src="compite/compite2.png" alt="logo" class="img-responsive" width="50%" height="50%" style="padding-top:10px"/>
        </a>
        <ul class="right hide-on-med-and-down">
            <li><a href="login.html">Salir</a></li>
        </ul>
        <ul id="nav-mobile" class="side-nav">
            <li><a href="login.html">Salir</a></li>
        </ul>
        <a href="index.html" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>
<div class="row" style="width:80%">
    <div class="section">
        <div id="tabs">
            <ul class="tabs">
                <li class="tab col s4"><a href="${createLink(controller:'administrador', action:'index')}">RENDICIONES DE PROYECTO</a></li>
                <li class="tab col s4"><a href="${createLink(controller:'administrador', action:'administrar')}">ADMINISTRAR</a></li>
                <li class="tab col s4"><a class="active" hrf="${createLink(controller:'administrador', action:'reportes')}">REPORTES</a></li>
            </ul>
        </div>
    </div>
    <div class="formulario">

    </div>
</div>


