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
                                <form class="col s12" name="rendicionMovilizacion">
                                    <div class="input-field col s6">
                                        <select name="mItem" class="browser-default">
                                            <option value="1">Seleccione Item</option>
                                            <option value="2">ITEM 1</option>
                                            <option value="3">ITEM 2</option>
                                            <option value="4">ITEM 3</option>
                                        </select>
                                    </div>
                                    <div class="input-field col s6">
                                        <select name="mMotivo" class="browser-default">
                                            <option value="1">Seleccione Motivo</option>
                                            <option value="2">ITEM 1</option>
                                            <option value="3">ITEM 2</option>
                                            <option value="4">ITEM 3</option>
                                        </select>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mDesde" name="mDesde" type="text" class="validate">
                                        <label for="mDesde">Lugar Desde</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mHasta" name="mHasta" type="text" class="validate">
                                        <label for="mHasta">Lugar Hasta</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mPrecio" name="mPrecio" type="text" class="validate">
                                        <label for="mPrecio">Precio</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mNombre" name="mNombre" type="text" class="validate">
                                        <label for="mNombre">Nombre Rendición</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mBoletas" name="mBoletas" type="text" class="validate">
                                        <label for="mBoletas">Boletas</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mRecorrido" name="mRecorrido" type="text" class="validate">
                                        <label for="mRecorrido">Recorrido</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mTiempo" name="mTiempo" type="text" class="validate">
                                        <label for="mTiempo">Tiempo</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="mTotal" name="mTotal" type="text" class="validate">
                                        <label for="mTotal">Total</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input name="mFecha" class="datepicker" type="text" id="mFecha">
                                        <label for="mFecha">Fecha</label>
                                    </div>
                                    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
                                    <link rel="stylesheet" href="/resources/demos/style.css">
                                    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                                    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
                                    <script>
                                        $(function() {
                                            $(".datepicker").datepicker();
                                            $('.datepicker').datepicker('option', {dateFormat: 'dd/mm/yy'});
                                        });
                                    </script>
                                    <div class="input-field col s12">
                                        <form action="#">
                                            <div class="file-field input-field">
                                                <div class="btn">
                                                    <span>Cargar Archivos</span>
                                                    <input type="file" name="mArchivos">
                                                </div>
                                                <div class="file-path-wrapper">
                                                    <input class="file-path validate" type="text">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col s12 m12">
                                        <div class="btn">
                                            <span>Cargar Archivos</span>
                                            <input type="file" name="mArchivos">
                                        </div>
                                        <a class="btn" onclick="Materialize.toast('RENDICIÓN DE MOVILIZACIÓN CREADA CORRECTAMENTE', 4000)">CREAR</a>
                                    </div>
                                </form>
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