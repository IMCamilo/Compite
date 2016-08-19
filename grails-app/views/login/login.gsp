<!DOCTYPE html>
<html lang="es">
<head>
    <title>COMPITE - Iniciar sesión</title>
    <asset:link rel="icon" href="compite/favicon.png" type="image/x-ico" sizes="32x32"/>
    <!--<link rel="icon" href="img/favicon.png" sizes="32x32">-->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <!-- CSS  -->
    <asset:stylesheet src="compite/materialize.css"/>
    <asset:stylesheet src="compite/style.css"/>
    <asset:stylesheet src="compite/googlefonts.css"/>
    <!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
    <!--link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />-->
</head>
<body>
    <nav class="white" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="index.html" class="brand-logo">
                <asset:image src="compite/compite2.png" alt="logo" class="img-responsive" width="50%" height="50%" style="padding-top:10px"/>
                <!--<img src="img/compite2.png" alt="logo" class="img-responsive" width="50%" height="50%" style="padding-top:10px">-->
            </a>
            <ul class="right hide-on-med-and-down">
                <li><a href="http://localhost:8080">Inicio</a></li>
            </ul>
            <ul id="nav-mobile" class="side-nav">
                <li><a href="http://localhost:8080">Inicio</a></li>
            </ul>
            <a href="index.html" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        </div>
    </nav>
    <div class="container">
        <div class="section">
            <div class="row">
                <center>
                    <asset:image src="compite/logo.png" width="30%" height="30%"/>
                    <!--<img src="img/logo.png" width="30%" height="30%">-->
                </center>
            </div>
        </div>
        <div class="section">
            <div class="row">
                <div class="col s12 m4">
                </div>
                <div class="col s12 m4">
                    <div class="row">
                        <!--<form class="col s12" action="admin.html">-->
                        <form class="col s12" action="ingeniero.html">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">account_circle</i>
                                    <input id="icon_prefix" type="text" class="validate">
                                    <label for="icon_prefix">Correo electrónico</label>
                                </div>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">vpn_key</i>
                                    <input id="icon_telephone" type="tel" class="validate">
                                    <label for="icon_telephone">Contraseña</label>
                                </div>
                                <div class="input-field col s12">
                                    <button class="btn waves-effect waves-light" style="width:100%; height:50px" type="submit">Entrar
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col s12 m4">
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
                            <!--<img class="responsive-img" src="img/santiago-1.png" width="100px" height="100px">-->
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
                            <!--<img class="responsive-img" src="img/valparaiso-1.png" width="100px" height="100px">-->
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
                            <!--<img class="responsive-img" src="img/biobio-1.png" width="100px" height="100px">-->
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
                            <!--<img class="responsive-img" src="img/araucania-1.png" width="100px" height="100px">-->
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
<!--<script src="js/materialize.js"></script>
<script src="js/init.js"></script>-->
</body>

</html>
