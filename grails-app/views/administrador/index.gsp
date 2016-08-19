<title>COMPITE - Admistrador</title>
<meta name="layout" content="administrador"/>
<script>
    $(function() {
        $("#tabs").tabs();
    });
</script>
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
                <li class="tab col s4"><a class="active"  href="${createLink(controller:'administrador', action:'index')}">RENDICIONES DE PROYECTO</a></li>
                <li class="tab col s4"><a href="${createLink(controller:'administrador', action:'administrar')}">ADMINISTRAR</a></li>
                <li class="tab col s4"><a href="${createLink(controller:'administrador', action:'reportes')}">REPORTES</a></li>
            </ul>
            <div id="formulario1" class="col s12">
                <!--aca va el formulario seleccion de proyecto-->
                <div id="seleccionProyecto" class="col s12">
                    <ul class="collapsible" data-collapsible="expandable" style="width:100%">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">contacts</i>BUSCAR PROYECTO PÚBLICO</div>
                            <div class="collapsible-body">
                                <ul class="collection">
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle blue">work</i>

                                        <a href="#!" class="collection-item">
                                            <table class="highlight responsive-table">
                                                <thead>
                                                <tr>
                                                    <th data-field="id">NOMBRE DEL PROYECTO</th>
                                                    <th data-field="name">ESTADO</th>
                                                    <th data-field="price">PERSONA A CARGO</th>
                                                </tr>
                                                </thead>

                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><del>Sin Rendiciones Pendientes</del></td>
                                                    <td>Camilo</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><ins>Rendiciones Pendientes</ins></td>
                                                    <td>Pardo</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><del>Sin Rendiciones Pendientes</del></td>
                                                    <td>Santana</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><ins>Rendiciones Pendientes</ins></td>
                                                    <td>Jhonathan</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><del>Sin Rendiciones Pendientes</del></td>
                                                    <td>Adolfo</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><ins>Rendiciones Pendientes</ins></td>
                                                    <td>Pablo</td>
                                                </tr>
                                                </tbody>

                                            </table>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">person_pin</i>BUSCAR PROYECTO PRIVADO</div>
                            <div class="collapsible-body">
                                <ul class="collection">
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle blue">work</i>
                                        <a href="#!" class="collection-item">
                                            <table class="highlight responsive-table">
                                                <thead>
                                                <tr>
                                                    <th data-field="id">NOMBRE DEL PROYECTO</th>
                                                    <th data-field="name">ESTADO</th>
                                                    <th data-field="price">PERSONA A CARGO</th>
                                                </tr>
                                                </thead>

                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><del>Sin Rendiciones Pendientes</del></td>
                                                    <td>Camilo</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><ins>Rendiciones Pendientes</ins></td>
                                                    <td>Pardo</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><del>Sin Rendiciones Pendientes</del></td>
                                                    <td>Santana</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><ins>Rendiciones Pendientes</ins></td>
                                                    <td>Jhonathan</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><del>Sin Rendiciones Pendientes</del></td>
                                                    <td>Adolfo</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Nombre Proyecto</td>
                                                    <td><ins>Rendiciones Pendientes</ins></td>
                                                    <td>Pablo</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>


            </div>
        </div>
    </div>
</div>


