<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainadministrador" />
    <title>Reportes de Rendicion de Gastos</title>
    <asset:stylesheet src="compite/autocomplete.css"/>
</head>
<body>

<g:form action="reportes" method="PUT">
    <div class="fieldcontain required" id="programainputdiv">
        <label for="nombrePrograma">Programa
            <span class="required-indicator">*</span>
        </label>
        <input id="nombrePrograma" class="typeahead" name="nombrePrograma" type="text" required="" placeholder="Busca un programa">
    </div>
    <div class="button col-md-offset-3 fieldcontain">
        <button>Buscar</button>
    </div>
</g:form>


    <table>
        <thead>
            <tr>
                <g:sortableColumn property="id" defaultOrder="desc" title="Referencia"/>
                <g:sortableColumn property="tipoDocumento" defaultOrder="desc" title="Tipo"/>
                <g:sortableColumn property="nDocumento" defaultOrder="desc" title="Numero Documento"/>
                <g:sortableColumn property="fechaCreacion" defaultOrder="desc" title="Fecha Creación"/>
                <g:sortableColumn property="rutEmpresa" defaultOrder="desc" title="RUT Empresa"/>
                <g:sortableColumn property="pagadoA" defaultOrder="desc" title="Pagado A"/>
                <g:sortableColumn property="item.centroCosto" defaultOrder="desc" title="Centro de Costos"/>
                <g:sortableColumn property="item.itemPresupuestario" defaultOrder="desc" title="Item Presupuestario"/>
                <g:sortableColumn property="concepto" defaultOrder="desc" title="Descripcion del Gasto"/>
                <g:sortableColumn property="monto" defaultOrder="desc" title="Valor"/>
            </tr>
        </thead>
        <tbody>
            <g:each var="reporte" in="${egresoList}">
                <tr>
                    <td><g:link controller="egreso" action="show" id="${reporte.id}">${reporte.id}</g:link></td>
                    <td>${reporte.tipoDocumento}</td>
                    <td>${reporte.nDocumento}</td>
                    <td>${reporte.fechaCreacion}</td>
                    <td>${reporte.rutEmpresa}</td>
                    <td>${reporte.pagadoA}</td>
                    <td>${reporte.item.centroCosto}</td>
                    <td>${reporte.item.itemPresupuestario}</td>
                    <td>${reporte.concepto}</td>
                    <td>${reporte.monto}</td>
                </tr>
            </g:each>
        </tbody>
    </table>

<div>
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
</div>
</body>
</html>