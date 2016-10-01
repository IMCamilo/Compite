<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainadministrador" />
    <title>Reportes de Rendicion de Gastos</title>
    <asset:stylesheet src="compite/autocomplete.css"/>
</head>
<body>

<g:form action="reportes" method="POST" >
    <div class="fieldcontain required" id="programainputdiv">
        <label for="nombrePrograma">Programa
            <span class="required-indicator">*</span>
        </label>
        <input id="nombrePrograma" class="typeahead" name="nombrePrograma" type="text" required="" placeholder="Busca un programa">
    </div>
    <div class="fieldcontain required" id="rendicioninputdiv">
        <label for="codRendicion">Rendicion
            <span class="required-indicator">*</span>
        </label>
        <input id="codRendicion" class="typeahead" name="codrendicion" type="text" required="" placeholder="Busca una Rendicion">
    </div>
    <div class="button col-md-offset-3 fieldcontain">
        <button>Buscar</button>
    </div>
</g:form >



    <table>
        <thead>
            <tr>
                <th>Referencia</th>
                <th>Tipo</th>
                <th>Numero Documento</th>
                <th>Fecha Creacion</th>
                <th>Rut Empresa</th>
                <th>Pagado A</th>
                <th>Centro de Costos</th>
                <th>Item Presupuestario</th>
                <th>Descripcion del Gasto</th>
                <th>$ Valor</th>

            </tr>
        </thead>
        <tbody>
            <g:each var="reporte" in="${rendicionesEnEgreso}" >
                <tr>
                    <td><g:link controller="egreso" action="show" id="${reporte.id}">${reporte.id}</g:link></td>
                    <td>${reporte.tipoDocumento}</td>
                    <td>${reporte.nDocumento}</td>
                    <td>${reporte.fechaCreacion}</td>
                    <td>${reporte.rutEmpresa}</td>
                    <td>${reporte.pagadoA}</td>
                    <td>${reporte.item.codigo}</td>
                    <td>${reporte.item.nombre}</td>
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
        });
    </script>
</div>
</body>
</html>
