<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainingeniero" />
    <g:set var="entityName" value="${message(code: 'egresoMov.label', default: 'EgresoMov')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <asset:stylesheet src="compite/autocomplete.css"/>
</head>
<body>
<div id="list-egresoMov" class="content scaffold-list" role="main">
    <h1>Crea un egreso de Movilizacion</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:form controller="egresoIng" action="admovs">
        <!-- Modal -->
        <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                    </div>
                    <div class="modal-body">
                        <table>
                            <thead>
                            <tr>
                                <g:sortableColumn property="egreso" defaultOrder="desc" title="Egreso"/>
                                <g:sortableColumn property="fecha" defaultOrder="desc" title="Fecha"/>
                                <g:sortableColumn property="motivoEmpresa" defaultOrder="desc" title="Motivo/Empresa"/>
                                <g:sortableColumn property="direccion" defaultOrder="desc" title="Dirección"/>
                                <g:sortableColumn property="distancia" defaultOrder="desc" title="Distancia"/>
                                <g:sortableColumn property="tipo" defaultOrder="desc" title="Tipo"/>
                                <g:sortableColumn property="precio" defaultOrder="desc" title="Precio"/>
                                <g:sortableColumn property="aprobar" defaultOrder="desc" title="Aprobar"/>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each var="movilizacion" status="i" in="${movsList}">
                                <g:if test="${movilizacion.egreso==null}">
                                <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                                    <td>${movilizacion.egreso}</td>
                                    <td>${formatDate(format:"dd/MM/yyyy", date: movilizacion.fechaCreacion)}</td>
                                    <td>${movilizacion.motivoEmpresa}</td>
                                    <td>${movilizacion.direccion}</td>
                                    <td>${movilizacion.distancia}</td>
                                    <td>${movilizacion.tipo}</td>
                                    <td>${movilizacion.precio}</td>
                                    <td><g:checkBox name="in" value="${movilizacion.id}" /></td>

                                </tr>
                                </g:if>
                            </g:each>
                            </tbody>
                        </table>

                    </div>
                    <div class="modal-footer">
                        <fieldset class="buttons">
                            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>

        <fieldset class="form">
            <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
            <input type="hidden" name="usuario" value="${session.usuarioLogueado.id}" id="nombreUsuario">
            <input type="hidden" name="programa" value="${programaId}" id="idPrograma">
            <input type="hidden" name="proyecto" value="${params.id}" id="idProyecto">
            <input type="hidden" name="aprobacion" value="NO" id="aprobacion">
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="fechaCreacion">Fecha Documento
                            <span class="required-indicator">*</span>
                        </label>
                        <input name="fechaCreacion" value="date.struct" type="hidden" required="">
                        <select name="fechaCreacion_day" id="fechaCreacion_day" aria-labelledby="fechaCreacion" required="">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9" selected="selected">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                        </select>
                        <select name="fechaCreacion_month" id="fechaCreacion_month" aria-labelledby="fechaCreacion" required="">
                            <option value="1">enero</option>
                            <option value="2">febrero</option>
                            <option value="3">marzo</option>
                            <option value="4">abril</option>
                            <option value="5">mayo</option>
                            <option value="6">junio</option>
                            <option value="7">julio</option>
                            <option value="8">agosto</option>
                            <option value="9" selected="selected">septiembre</option>
                            <option value="10">octubre</option>
                            <option value="11">noviembre</option>
                            <option value="12">diciembre</option>
                        </select>
                        <select name="fechaCreacion_year" id="fechaCreacion_year" aria-labelledby="fechaCreacion" required="">
                            <option value="2018">2018</option>
                            <option value="2017">2017</option>
                            <option value="2016" selected="selected">2016</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="tipoDocumento">Tipo Documento
                            <span class="required-indicator">*</span>
                        </label>
                        <select name="tipoDocumento" value="" required="" id="tipoDocumento">
                            <option value="" disabled selected>Seleccione Documento</option>
                            <option value="BOLETA">BOLETA</option>
                            <option value="FACTURA">FACTURA</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="rut">Rut a Pagar
                            <span class="required-indicator">*</span>
                        </label>
                        <input name="rutEmpresa" type="text" id="rut" name="rut" required oninput="checkRut(this)" placeholder="Ingrese RUT Empresa" size="10">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for='pagadoA'>Pagado a
                            <span class='required-indicator'>*</span>
                        </label>
                        <input type="text" name="pagadoA" value="" required="" id="pagadoA"/>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required" id="iteminputdiv">
                        <label for='nombreItem'>Item
                            <span class='required-indicator'>*</span>
                        </label>
                        <input id="nombreItem" class="typeahead" name="nombreItem" type="text" required="" placeholder="Busca un item">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for='numeroDocumento'>N° documento
                            <span class='required-indicator'>*</span>
                        </label>
                        <input type="text" name="nDocumento" value="" required="" id="numeroDocumento"/>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="tipoMoneda">Tipo Moneda
                            <span class="required-indicator">*</span>
                        </label>
                        <select name="tipoMoneda" required="" id="tipoMoneda">
                            <option value="" disabled selected>Seleccione Moneda</option>
                            <option value="CLP">Peso Chileno</option>
                            <option value="USD">Dolar Americano</option>
                            <option value="EUR">Euro</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="monto">Monto
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="monto" value="" required="" id="monto" onkeypress="return isNumber(event)"/>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for='concepto'>Concepto
                            <span class='required-indicator'>*</span>
                        </label>
                        <input type="text" name="concepto" value="" required="" id="concepto"/>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <br>
            </div>
            <div class="col-md-12">
                <div class="col-sm-1">
                </div>
                <div class="col-sm-6">
                    <!-- Button trigger modal -->
                    <button type="button" class="save" data-toggle="modal" data-target="#myModal">
                        Cargar Movilizaciones
                    </button>
                </div>
            </div>
        </fieldset>

    </g:form>
    <div class="pagination">
        <g:paginate total="${egresoMovCount ?: 0}" />
    </div>
</div>
<asset:javascript src="compite/jquery-2.1.1.min.js"/>
<asset:javascript src="compite/typeahead.bundle.js"/>
<script>
    $(document).ready(function() {
        var substringMatcher = function(strs) {
            return function findMatches(q, cb) {
                var matches, substringRegex;
                matches = [];
                substrRegex = new RegExp(q, 'i');
                $.each(strs, function(i, str) {
                    if (substrRegex.test(str)) {
                        matches.push(str);
                    }
                });
                cb(matches);
            };
        };
        var items = [
            <g:each in="${items}">
            '${it.codigo} ${it.nombre} - ${it.id}',
            </g:each>
        ];
        $('#iteminputdiv .typeahead').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        }, {
            name: 'items',
            source: substringMatcher(items)
        });
    });
</script>
</body>
</html>
