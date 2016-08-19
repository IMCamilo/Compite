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
                <li class="tab col s4"><a class="active" href="${createLink(controller:'administrador', action:'administrar')}">ADMINISTRAR</a></li>
                <li class="tab col s4"><a href="${createLink(controller:'administrador', action:'reportes')}">REPORTES</a></li>
            </ul>

            <div id="formulario2" class="col s12">
                <div class="card-panel teal lighten-2 90a4ae blue-grey">CREAR NUEVA RENDICIÓN</div>
                <!--aca va el formulario para crear rendiciones-->
                <ul class="collapsible" data-collapsible="expandable" style="width:100%">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">navigation</i>USUARIOS DEL SISTEMA</div>
                        <div class="collapsible-body">
                            <form action="" class="usuarios">
                                <input type="text" class="nombre" value="Búscar por nombre">
                                <input type="text" class="nombre" value="Búscar por usuario">
                                <input type="text" class="nombre" value="Búscar por correo">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">person_pip</i>PROYECTOS</div>
                        <div class="collapsible-body">
                            <form action="" class="usuarios">
                                <input type="text" class="nombre" value="Búscar por nombre">
                                <input type="text" class="nombre" value="Búscar por usuario encargado">
                                <input type="text" class="nombre" value="Búscar por cliente">
                                <input type="text" class="nombre" value="Búscar por tipo de proyecto">
                            </form>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">playlist_add</i>ASIGNACIÓN DE PROYECTOS</div>
                        <div class="collapsible-body">
                            <form action="" class="usuarios">
                                <input type="text" class="nombre" value="Búscar por nombre">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">work</i>ADMINISTRAR LOS ITEMS</div>
                        <div class="collapsible-body">
                            <form action="" class="items">
                                <input type="text" class="texto" value="Buscar por codigo del item">
                                <input type="text" class="texto" value="Buscar por nombre del item">
                            </form>
                        </div>
                    </li>
                </ul>
                <!--"aca va el formulario para crear rendiciones"-->
            </div>

        </div>
    </div>
</div>
</div>

<g:javascript>
    $(function() {
        $("#tabs").tabs();
    });
</g:javascript>

