<!DOCTYPE html>
<html lang="es">
<head>
    <title>COMPITE</title>
    <asset:javascript src="compite/nprogress.js"/>
    <asset:stylesheet src="compite/nprogress.css"/>
    <asset:link rel="icon" href="compite/favicon.png" type="image/x-ico" sizes="32x32"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <asset:stylesheet src="compite/materialize.css"/>
    <asset:stylesheet src="compite/style.css"/>
    <asset:stylesheet src="compite/googlefonts.css"/>
</head>

<body>
<script>NProgress.start();</script>
<nav class="white" role="navigation">
    <div class="navbar-fixed">
        <nav class="white" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="http://localhost:8080" class="brand-logo">
                    <asset:image src="compite/compite2.png" alt="logo" class="img-responsive" width="50%" height="50%" style="padding-top:10px"/>
                </a>
                <ul id="dropdown1" class="dropdown-content">
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
                    <li><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
                    </g:each>
                </ul>
                <ul class="right hide-on-med-and-down">
                    <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Controladores Disponibles<i class="material-icons right">arrow_drop_down</i></a></li>
                    <li><a href="${createLink(controller:'login', action:'login')}">Iniciar Sesión</a></li>
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
                        <li><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
                    </g:each>
                    <li><a href="${createLink(controller:'login', action:'login')}">Iniciar Sesión</a></li>
                </ul>
                <a href="" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
    </div>
</nav>
<div id="load"></div>
<div id="index-banner" class="parallax-container">
    <div class="section no-pad-bot">
        <div class="container">
            <h1 class="header center teal-text text-lighten-2">Potenciamos lo mejor de cada PYME</h1>
            <div class="row center">
                <h5 class="header col s12 light" style="color:#000000">
                    Somos una organización que potencia lo mejor de cada PYME a través de procesos de acompañamiento, asesoría, capacitación e instancias colaborativas que mejoran la productividad y competitividad de las empresas
                </h5>
            </div>
        </div>
    </div>
    <div class="parallax"><asset:image class="responsive-img" src="compite/background4.jpg" alt=""/></div>
</div>

<div class="container">
    <div class="section">
        <!--   Icon Section   -->
        <div class="row">
            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center brown-text"><i class="material-icons">group</i></h2>
                    <h5 class="center">Quiénes Somos</h5>
                    <p class="light">COMPITE nace a partir de necesidades reales, latentes y transversales de las pequeñas y medianas empresas, y de quienes las manejan. Nuestro objetivo como organización es generar un país más equitativo, con mejores empresas, mejores
                    profesionales y mejores personas.</p>
                </div>
            </div>
            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center brown-text"><i class="material-icons">navigation</i></h2>
                    <h5 class="center">Nuestra Misión</h5>
                    <p class="light">Transformar a las pymes en empresas en empresas que muevan la economía del país y sus mercados, impactando direcetamente en el bienestar de sus dueños y colaboradores. Gestionar e innovar como un motor del cambio, el cual vamos
                    llevamos adelante con metodologías que unen el trabajo practico, la experiencia y la academia.</p>
                </div>
            </div>
            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center brown-text"><i class="material-icons">visibility</i></h2>
                    <h5 class="center">Visión</h5>
                    <p class="light">Ser el principal referente PYME de latinoamérica, realizando iniciativas de alto impacto que nos permitan llevar a las PYMES y sus dueños a un siguiente nivel de perfeccionamiento profesional y crecimiento empresarial, apegandonos
                    siempre a la vanguardia de las tecnologías y la globalización industrial.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
        <div class="container">
            <div class="row center">
                <h5 class="header col s12 light"><!--asdfasdf--></h5>
            </div>
        </div>
    </div>
    <div class="parallax"><asset:image class="responsive-img" src="compite/background1.jpg" alt="Unsplashed background img 1"/></div>
</div>
<div class="container" style="padding-top:50px">
    <div class="section">
        <!--   Icon Section   -->
        <div class="row">
            <div class="col s12 m6">
                <div class="icon-block">
                    <center>
<asset:image class="responsive-img" src="compite/compite-negativo.png" alt="logo" class="img-responsive" width="40%" height="40%"/>
                    </center>
                </div>
            </div>
            <div class="col s12 m6">
                <div class="icon-block">
                    <center>
<asset:image class="responsive-img" src="compite/logouniversidad.png" alt="logo" class="img-responsive" width="40%" height="40%"/>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="section no-pad-bot">
        <div class="container">
            <div class="row center">
                <!--texto bajo los logos-->
            </div>
        </div>
    </div>
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
<asset:javascript src="compite/forms.js"/>
<asset:javascript src="compite/init.js"/>
<script>NProgress.done();</script>
</body>
</html>