<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
    <form action="" id="formid">
        <div>
            <a id="enviar" href="#">Crear Rendición</a>
        </div>
        <div id="dialog" style="display: none;">
            <p><br>Debe Seleccionar al menos un Egreso</p>
        </div>
        <div id="list-egreso" class="content scaffold-list" role="main">
            <h1>Listado de Egresos</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <tr>
                    <th>Ver detalles</th>
                    <g:sortableColumn property="programa" defaultOrder="desc" title="Programa"/>
                    <g:sortableColumn property="concepto" defaultOrder="desc" title="Concepto"/>
                    <g:sortableColumn property="aprobacion" defaultOrder="desc" title="Aprobación"/>
                    <g:sortableColumn property="tipoMoneda" defaultOrder="desc" title="Tipo Moneda"/>
                    <g:sortableColumn property="monto" defaultOrder="desc" title="Monto"/>
                    <g:sortableColumn property="tipoDocumento" defaultOrder="desc" title="Tipo Documento"/>
                    <g:sortableColumn property="pagadoA" defaultOrder="desc" title="Pagado a"/>
                    <th>Seleccionar</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="egreso" status="i" in="${egresoList}">
                    <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                        <td><a href="show/${egreso.id}">ver</a></td>
                        <td>${egreso.programa.nombre}</td>
                        <td>${egreso.concepto}</td>
                        <td>${egreso.aprobacion}</td>
                        <td>
                            <g:if test="${egreso.tipoMoneda == 'CLP'}">
                                Pesos Chilenos
                            </g:if>
                            <g:elseif test="${egreso.tipoMoneda == 'USD'}">
                                Dolar Américano
                            </g:elseif>
                            <g:else>
                                Euro
                            </g:else>
                        </td>
                        <td>$ ${egreso.monto}</td>
                        <td>${egreso.tipoDocumento}</td>
                        <td>${egreso.pagadoA}</td>
                        <td>
                            <g:if test="${egreso.aprobacion == "SI"}">
                                <input type="checkbox" id="egresoId" name="egresoIds[]" value="${egreso.id}"/>
                            </g:if>
                            <g:else>
                                <input type="checkbox" disabled/>
                            </g:else>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${egresoCount ?: 0}" />
            </div>
        </div>
    </form>
    <asset:javascript src="compite/jquery-2.1.1.min.js"/>
    <asset:javascript src="compite/validarut.js"/>
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
            var usuarios = [
                <g:each in="${usuarios}">
                    '${it.nombres} ${it.paterno} ・ ${it.rut}',
                </g:each>
            ];
            var programas = [
                <g:each in="${programas}">
                    '${it.nombre} ・ ${it.codigo}',
                </g:each>
            ];
            var rendiciones = [
                <g:each in="${rendiciones}">
                    '${it.tipoRendicion} - ${formatDate(format:"yyyy/MM/dd", date: it.fecha)} ・ ${it.id}',
                </g:each>
            ];
            var items = [
                <g:each in="${items}">
                '${it.nombre} ・ ${it.id}'
                </g:each>
            ];
            $('#usuarioinputdiv .typeahead').typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            }, {
                name: 'usuarios',
                source: substringMatcher(usuarios)
            });
            $('#programainputdiv .typeahead').typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            }, {
                name: 'programas',
                source: substringMatcher(programas)
            });
            $('#rendicioninputdiv .typeahead').typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            }, {
                name: 'rendiciones',
                source: substringMatcher(rendiciones)
            });
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
    <script type="application/javascript">
        $(document).ready(function() {
            $('#enviar').click(function(){
                var selected = '';
                $('#formid input[type=checkbox]').each(function(){
                    if (this.checked) {
                        selected += $(this).val()+',';
                    }
                });

                if (selected != '') {
                    var egresos = selected.substring(0, selected.length - 1);
                    console.log("Egresos seleccionados: "+egresos)
                    window.location = "crearRendicion?egresos="+egresos;
                } else {
                    console.log("Nada seleccionado")
                    /*$(function () {
                        $("#dialog").dialog({
                            title: "Compite - Rendición",
                            width: 280,
                        });
                    });*/
                    alert("Debe seleccionar al menos un Egreso");
                }
                return false;
            });
        });
    </script>
    </body>
</html>
