<!DOCTYPE html>
<html lang="es">
<head>
    <title>COMPITE - Auditoría - Lista</title>
    <asset:link rel="icon" href="compite/favicon.png" type="image/x-ico" sizes="32x32"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <asset:stylesheet src="compite/materialize.css"/>
    <asset:stylesheet src="compite/style.css"/>
    <asset:stylesheet src="compite/googlefonts.css"/>
</head>
<body>
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

            <!--
            <ul class="right hide-on-med-and-down">
                <li><a href="${createLink(controller:'auditoria', action:'list')}">Listar</a></li>
            </ul>
            <ul id="nav-mobile" class="side-nav">
                <li><a href="${createLink(controller:'auditoria', action:'list')}">Listar</a></li>
            </ul>
            <a href="index.html" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            -->
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

<footer class="page-footer teal">
    <div class="container">
        <div class="row">
            <div class="col l3 s12">
                <li class="white-text">OFICINA CENTRAL SANTIAGO</li>
                <ul>
                    <li>
                        <a class="white-text" href="#">
                            <asset:image src="compite/santiago-1.png" class="responsive-img" width="100px" height="100px"/>
                        </a>
                    </li>
                    <li><a class="white-text" href="#">Galicia #539, Las Condes. Santiago.</a></li>
                    <li><a class="white-text" href="#">+562 223311693</a></li>
                </ul>
            </div>
            <div class="col l3 s12">
                <li class="white-text">OFICINA REGIONAL VALPARAÍSO</li>
                <ul>
                    <li>
                        <a class="white-text" href="#">
                            <asset:image src="compite/valparaiso-1.png" class="responsive-img" width="100px" height="100px"/>
                        </a>
                    </li>
                    <li><a class="white-text" href="#!">Balmaceda #305, Cerro Castillo, Viña del Mar.</a></li>
                    <li><a class="white-text" href="#!">+5632&nbsp;2335 92962</a></li>
                </ul>
            </div>
            <div class="col l3 s12">
                <li class="white-text">OFICINA REGIONAL BÍO-BÍO</li>
                <ul>
                    <li>
                        <a class="white-text" href="#!">
                            <asset:image src="compite/biobio-1.png" class="responsive-img" width="100px" height="100px"/>
                        </a>
                    </li>
                    <li><a class="white-text" href="#!">Bernardo O’higgins #980, oficina F, Concepción.</a></li>
                    <li><a class="white-text" href="#!">+5641 222 1035</a></li>
                </ul>
            </div>
            <div class="col l3 s12">
                <li class="white-text">OFICINA REGIONAL ARAUCANÍA</li>
                <ul>
                    <li>
                        <a class="white-text" href="#!">
                            <asset:image src="compite/araucania-1.png" class="responsive-img" width="100px" height="100px"/>
                        </a>
                    </li>
                    <li><a class="white-text" href="#!">Antonio Varas #687, Oficina 708. Temuco.</a></li>
                    <li><a class="white-text" href="#!">+5645 273 0693</a></li>
                    <li><a class="white-text" href="#!">Link 4</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            <a class="brown-text text-lighten-3" href="https://www.compite.cl">COMPITE</a> - 2016
        </div>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<asset:javascript src="compite/materialize.js"/>
<asset:javascript src="compite/init.js"/>
</body>

</html>
