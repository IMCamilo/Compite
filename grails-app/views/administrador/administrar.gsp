<title>COMPITE - Administrar</title>
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
                <li class="tab col s4"><a class="active" href="${createLink(controller:'administrador', action:'administrar')}">ADMINISTRAR</a></li>
                <li class="tab col s4"><a href="${createLink(controller:'administrador', action:'reportes')}">REPORTES</a></li>
            </ul>

            <div id="formulario2" class="col s12">
                <div class="card-panel teal lighten-2 90a4ae blue-grey">CREAR NUEVA RENDICIÓN</div>
                <!--aca va el formulario para crear rendiciones-->
                <ul class="collapsible" data-collapsible="expandable" style="width:100%">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">navigation</i><a href="${createLink(controller:'usuario', action:'index')}">USUARIOS DEL SISTEMA</a></div>

                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">person_pip</i><a href="${createLink(controller:'proyecto', action:'index')}">PROYECTOS</a></div>

                    </li>
                    <li>
                        <div class="collapsible-header"></a><i class="material-icons">playlist_add</i><a href="${createLink(controller:'auditoria', action:'index')}">AUDITORÍA</a></div>

                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">work</i><a href="${createLink(controller:'item', action:'index')}">ITEM´S DE GASTOS</a></div>

                    </li>
                </ul>
                <!--"aca va el formulario para crear rendiciones"-->
            </div>

        </div>
    </div>
</div>




