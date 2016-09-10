<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>COMPITE - Crear Rendición</title>
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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
    <script type='text/javascript'>
        $(function () {
            $(".datepicker").datepicker({
                firstDay: 1,
                dateFormat: 'dd/mm/yy',
                numberOfMonths: 1,
                hideIfNoPrevNext: true,
                inline: true,
                monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
                monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
                dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá']
            });
        });
    </script>
</head>
<body style="font-size:75%">
<div class="row" style="width:80%">
    <div class="section">
        <div id="tabs">
            <div id="formulario2" class="col s12">
                <div class="card-panel teal lighten-2 90A4AE" style="color:#FFFFFF; font-weight: bold;">
                    CREAR NUEVA RENDICIÓN PARA PROYECTO ID: ${id}
                </div>
                <!--aca va el formulario para crear rendiciones-->
                <ul class="collapsible" data-collapsible="expandable" style="width:100%">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">navigation</i>MOVILIZACION</div>
                        <div class="collapsible-body">
                            <div class="row">
                                <g:form controller="rendicion" action="save" class="col s12">
                                    <input type="hidden" name="proyecto" value="${id}"/>
                                    <input type="hidden" name="usuario" value="${session.usuarioLogueado.id}"/>
                                    <input type="hidden" name="tipo" value="Movilizacion"/>
                                    <div class="col s12">
                                        <div class="input-field col s6">
                                            <select name="item" class="browser-default" required>
                                                <option value="">Seleccione un Item</option>
                                                <g:each in="${itemMovilizacion}">
                                                    <option value="${it.id}">${it.nombre}</option>
                                                </g:each>
                                            </select>
                                        </div>
                                        <div class="input-field col s6">
                                            <select name="transporte" class="browser-default" required>
                                                <option value="">Seleccione un Móvil</option>
                                                <g:each in="${transportes}">
                                                    <option value="${it.id}">${it.descripcion}</option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mPrecio" name="precio" type="text" class="validate">
                                        <label for="mPrecio">Precio</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <input id="mMotivo" name="motivo" type="text" class="validate">
                                        <label for="mDesde">Motivo</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mDesde" name="desde" type="text" class="modal-trigger" href="#modal1">
                                        <label for="mDesde">Lugar Desde</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mHasta" name="hasta" type="text" class="validate" >
                                        <label for="mHasta">Lugar Hasta</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mNombre" name="nombre" type="text" class="validate">
                                        <label for="mNombre">Nombre Rendición</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mBoletas" name="nBoleta" type="text" class="validate">
                                        <label for="mBoletas">Boletas</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="mKmInicial" name="kmInicial" type="text" class="validate">
                                        <label for="mKmInicial">KM Inicial</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="mKmFinal" name="kmFinal" type="text" class="validate">
                                        <label for="mKmFinal">KM Final</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="mRecorrido" name="distancia" type="text" class="validate">
                                        <label for="mRecorrido">Distancia Recorrida</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mTiempo" name="tiempo" type="text" class="validate">
                                        <label for="mTiempo">Tiempo</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mTotal" name="total" type="text" class="validate">
                                        <label for="mTotal">Total</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input name="fecha" class="datepicker" type="text" id="mFecha">
                                        <label for="mFecha">Fecha</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <input id="mDescripcion" name="descripcion" type="text" class="validate">
                                        <label for="mDescripcion">Descripción</label>
                                    </div>
                                    <div class="col s12 m12">
                                        <div class="btn">
                                            <span>Cargar Archivos</span>
                                            <input type="file" name="mArchivos">
                                        </div>
                                        <!--<a class="btn" onclick="Materialize.toast('RENDICIÓN DE MOVILIZACIÓN CREADA CORRECTAMENTE', 4000)">CREAR</a>-->
                                    </div>
                                    <div class="col s12 m12">
                                        <br>
                                    </div>
                                    <div class="col s12 m12">
                                        <input type="submit" value="CREAR" class="btn">
                                    </div>
                                </g:form>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">person_pip</i>COLACIÓN</div>
                        <div class="collapsible-body">
                            <div class="row">
                                <div class="col s6 m6">
                                    <input id="fecha" type="text" value="04/08/2016"> ITEM :
                                    <select class="browser-default">
                                        <option value="1">ITEM 1</option>
                                        <option value="2">ITEM 2</option>
                                        <option value="3">ITEM 3</option>
                                    </select>
                                    <input id="motivo" value="MOTIVO" type="text">
                                    <form action="#">
                                        <div class="file-field input-field">
                                            <div class="file-path-wrapper">
                                                <input type="file" multiple>
                                                <input class="file-path validate" type="text" value="CLIC PARA CARGAR ARCHIVOS" placeholder="CARGAR ARCHIVOS">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!--LADO 2-->
                                <div class="col s6 m6">
                                    <input id="precio1" type="text" value="PRECIO TOTAL">
                                </div>
                                <div class="col s12 m12">
                                    <a class="btn" onclick="Materialize.toast('RENDICIÓN DE MOVILIZACIÓN CREADA CORRECTAMENTE', 4000)">CREAR</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">playlist_add</i>OTROS</div>
                        <div class="collapsible-body">
                            <div class="row">
                                <div class="col s6 m6">
                                    <input id="fecha" type="text" value="04/08/2016"> ITEM :
                                    <select class="browser-default">
                                        <option value="1">ITEM 1</option>
                                        <option value="2">ITEM 2</option>
                                        <option value="3">ITEM 3</option>
                                    </select>
                                    <input id="motivo" value="MOTIVO" type="text">
                                    <form action="#">
                                        <div class="file-field input-field">
                                            <div class="file-path-wrapper">
                                                <input type="file" multiple>
                                                <input class="file-path validate" type="text" value="CLIC PARA CARGAR ARCHIVOS" placeholder="CARGAR ARCHIVOS">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!--LADO 2-->
                                <div class="col s6 m6">
                                    <input id="precio2" type="text" value="PRECIO">
                                    <input id="boletas" value="BOLETAS" type="text">
                                    <input id="deshasta" type="text" value="DESDE HASTA">
                                </div>
                                <div class="col s12 m12">
                                    <a class="btn" onclick="Materialize.toast('RENDICIÓN DE MOVILIZACIÓN CREADA CORRECTAMENTE', 4000)">CREAR</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">work</i>AUDITORÍA (PROYECTO PÚBLICO)</div>
                        <div class="collapsible-body">
                            <div class="row">
                                <div class="col s6 m6">
                                    <input id="fecha" type="text" value="04/08/2016"> ITEM :
                                    <input id="persona" value="PERSONA A CARGO" type="text">
                                    <form action="#">
                                        <div class="file-field input-field">
                                            <div class="file-path-wrapper">
                                                <input type="file" multiple>
                                                <input class="file-path validate" type="text" value="CLIC PARA CARGAR ARCHIVOS" placeholder="CARGAR ARCHIVOS">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!--LADO 2-->
                                <div class="col s6 m6">
                                    ESTADO DEL PROYECTO :
                                    <select class="browser-default">
                                        <option value="1">EN CURSO</option>
                                        <option value="2">FINALIZADO</option>
                                        <option value="3">PAUSADO</option>
                                    </select>
                                    <input id="descripcion" type="text" class="materialize-textarea" value="DESCRIPCION">
                                </div>
                                <div class="col s12 m12">
                                    <a class="btn" onclick="Materialize.toast('RENDICIÓN DE COLACIÓN CREADA CORRECTAMENTE', 4000)">CREAR</a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <!--aca va el formulario para crear rendiciones-->
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