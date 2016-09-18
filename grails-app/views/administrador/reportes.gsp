<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainadministrador" />
    <g:set var="entityName" value="${message(code: 'asignacion.label', default: 'Asignacion')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <asset:stylesheet src="compite/autocomplete.css"/>
</head>
<body>
<%@ page import="org.apache.tools.ant.property.GetProperty; org.apache.tools.ant.taskdefs.Get" %>
<title>COMPITE - Reportes de Rendiciones</title>
<meta name="layout" content="mainadministrador"/>
    <form method="GET" action="reportes">
        <fieldset class="form">

            <div class="fieldcontain required" id="proyectoinputdiv">
                <label for="tipo">Proyecto<span class="required-indicator">*</span></label>
                <input class="typeahead" name="nombreProyecto" type="text" required="" placeholder="Busca un proyecto">
            </div>

        </fieldset>
        <fieldset class="buttons">
            <button>Buscar</button>
        </fieldset>
    </form>

<g:form action="save" controller="rendicion">
    <div>
        <h1>Reporte de Rendicion de Gastos</h1>
        <div id="fecha" class="fieldcontain">
            <label for="fecha">FECHA RENDICION</label>
            <input type="text" placeholder="Fecha Rendicion">
        </div>
        <div id="sede" class="fieldcontain">
            <label for="sede">SEDE ENVIO</label>
            <input type="text" placeholder="Sede Envio">
        </div>
        <div id="nombre" class="fieldcontain">
            <label for="nombre">NOMBRE RESPONSABLE</label>
            <input type="text" placeholder="Nombre Responsable">
        </div>
        <div id="rut" class="fieldcontain">
            <label for="rut">RUT</label>
            <input type="text" placeholder="RUT">
        </div>
        <div id="tipo" class="fieldcontain">
            <label for="nombre">TIPO RENDICION</label>
            <input type="text" placeholder="Tipo Rendicion">
        </div>
    </div>
    <div>
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
            <g:each var="reporte" in="${compite.Egreso.executeQuery("from Egreso where proyecto IN " +
                    "(SELECT id from Proyecto where nombre = '${params.nombreProyecto}')")}" >
                <tr>
                    <td><g:link controller="egreso" action="show" id="${reporte.id}">${reporte.id}</g:link></td>
                    <td>${reporte.tipoDocumento}</td>
                    <td>${reporte.nDocumento}</td>
                    <td>${reporte.fechaCreacion.dateString}</td>
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
        <div id="totalrendido" class="fieldcontain">
            <label for="totalrendido">TOTAL RENDIDO</label>
            <input type="text" placeholder="">
        </div>
        <div id="totalanticipado" class="fieldcontain">
            <label for="totalanticipado">TOTAL ANTICIPADO</label>
            <input type="text" placeholder="">
        </div>
        <div id="total" class="fieldcontain">
            <label for="total">TOTAL</label>
            <input type="text" placeholder="">
        </div>
    </div>
    <button>Guardar Reporte Rendicion</button>
    <button>Imprimir Reporte Rendicion</button>
</g:form>
<asset:javascript src="compite/jquery-2.1.1.min.js"/>
<asset:javascript src="compite/typeahead.bundle.js"/>
<script>
    $(document).ready(function() {
        var substringMatcher = function(strs) {
            return function findMatches(q, cb) {
                var matches, substringRegex;
                // an array that will be populated with substring matches
                matches = [];
                // regex used to determine if a string contains the substring `q`
                substrRegex = new RegExp(q, 'i');
                // iterate through the pool of strings and for any string that
                // contains the substring `q`, add it to the `matches` array
                $.each(strs, function(i, str) {
                    if (substrRegex.test(str)) {
                        matches.push(str);
                    }
                });
                cb(matches);
            };
        };

        var proyectos = [
            <g:each in="${proyectos}">
            '${it.nombre}',
            </g:each>
        ];

        $('#proyectoinputdiv .typeahead').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        }, {
            name: 'proyectos',
            source: substringMatcher(proyectos)
        });
    });
</script>

</body>
</html>


