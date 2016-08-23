<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>COMPITE - Tus Proyectos</title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <asset:stylesheet src="compite/materialize.css" media="screen,projection"/>
    <asset:stylesheet src="compite/style.css" media="screen,projection"/>
    <asset:stylesheet src="compite/googlefonts.css"/>
    <asset:stylesheet src="compite/formularios.css"/>
    <script>
        $(document).ready(function() {
            $('.tooltipped').tooltip({
                delay: 50
            });
        });
    </script>
</head>
<!--al seleccionar proyecto ir a una nuevarendicion (controller)-->
<body style="font-size:75%">

<div class="row" style="width:80%">
    <div class="section">
        <div id="tabs">
            <div id="formulario1" class="col s12">
                <!--aca va el formulario seleccion de proyecto-->
                <div id="seleccionProyecto" class="col s12">
                    <ul class="collapsible" data-collapsible="expandable" style="width:100%">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">contacts</i>TUS PROYECTOS PÚBLICOS</div>
                            <div class="collapsible-body">
                                <ul class="collection">
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle blue">work</i>
                                        <a href="${createLink(controller:'ingeniero', action:'nuevarendicion')}" class="collection-item">
                                            <span class="title">Nombre Primer Proyecto</span>
                                            <br>
                                            <span>Ubicado en ...</span>
                                        </a>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle blue">work</i>
                                        <a href="${createLink(controller:'ingeniero', action:'nuevarendicion')}" class="collection-item">
                                            <span class="title">Nombre Segundo Proyecto</span>
                                            <br>
                                            <span>Ubicado en ...</span>
                                        </a>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle blue">work</i>
                                        <a href="${createLink(controller:'ingeniero', action:'nuevarendicion')}" class="collection-item">
                                            <span class="title">Nombre Tercer Proyecto</span>
                                            <br>
                                            <span>Ubicado en ...</span>
                                        </a>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle blue">work</i>
                                        <a href="${createLink(controller:'ingeniero', action:'nuevarendicion')}" class="collection-item">
                                            <span class="title">Nombre Cuarto Proyecto</span>
                                            <br>
                                            <span>Ubicado en ...</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">person_pin</i>TUS PROYECTOS PRIVADOS</div>
                            <div class="collapsible-body">
                                <ul class="collection">
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle blue">work</i>
                                        <a href="${createLink(controller:'ingeniero', action:'nuevarendicion')}" class="collection-item">
                                            <span class="title">Nombre Primer Proyecto</span>
                                            <br>
                                            <span>Ubicado en ...</span>
                                        </a>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle blue">work</i>
                                        <a href="${createLink(controller:'ingeniero', action:'nuevarendicion')}" class="collection-item">
                                            <span class="title">Nombre Segundo Proyecto</span>
                                            <br>
                                            <span>Ubicado en ...</span>
                                        </a>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle blue">work</i>
                                        <a href="${createLink(controller:'ingeniero', action:'nuevarendicion')}" class="collection-item">
                                            <span class="title">Nombre Tercer Proyecto</span>
                                            <br>
                                            <span>Ubicado en ...</span>
                                        </a>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle blue">work</i>
                                        <a href="${createLink(controller:'ingeniero', action:'nuevarendicion')}" class="collection-item">
                                            <span class="title">Nombre Cuarto Proyecto</span>
                                            <br>
                                            <span>Ubicado en ...</span>
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
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<asset:javascript src="compite/materialize.js"/>
<asset:javascript src="compite/init.js"/>
<script>
    $(function() {
        $("#tabs").tabs();
    });
</script>
</body>
</html>