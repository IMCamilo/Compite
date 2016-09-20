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
    <form method="POST" action="reportes">
        <fieldset class="form">
            <div class="fieldcontain required" id="proyectoinputdiv">
                <label for="proyectoinputdiv">Proyecto<span class="required-indicator">*</span></label>
                <input class="typeahead" name="proyecto" type="text" required="" placeholder="Busca un proyecto">
            </div>
        </fieldset>
        <fieldset class="buttons">
            <button>Buscar</button>
        </fieldset>
    </form>

<g:form action="save" controller="rendicion" >
    <div>
        <h1>Reporte de Rendicion de Gastos</h1>
        <div id="idproyecto" class="fieldcontain">
            <label for="idProyecto">ID Proyecto</label>
            <input type="text" name="proyecto" value="${compite.Proyecto.executeQuery("SELECT id from Proyecto where nombre = '${params.proyecto}'")}"
                   placeholder="Proyecto">
        </div>
        <div id="nombreProyecto" class="fieldcontain">
            <label for="nombreProyecto">Nombre Proyecto</label>
            <input type="text" name="nombreProyecto" value="${params.proyecto}" placeholder="Proyecto">
        </div>
        <div id="fecha" class="fieldcontain">
            <label for="fecha">FECHA RENDICION<span class="required-indicator">*</span></label>
            <input type="text" placeholder="Fecha Rendicion" name="fecha" value="${}" >
        </div>
        <div id="sedeEnvio" class="fieldcontain">
            <label for="sedeEnvio">SEDE ENVIO</label>
            <input type="text" placeholder="Sede Envio" name="sedeEnvio">
        </div>
        <div id="nombreUsuario" class="fieldcontain">
            <label for="nombreUsuario">NOMBRE RESPONSABLE - RUT<span class="required-indicator">*</span></label>
            <input type="text" placeholder="Nombre Responsable" name="nombreUsuario">
        </div>
        <div id="tipoRendicion" class="fieldcontain">
            <label for="tipoRendicion">TIPO RENDICION<span class="required-indicator">*</span></label>
            <input type="text" placeholder="Tipo Rendicion" name="tipoRendicion">
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
                    "(SELECT id from Proyecto where nombre = '${params.proyecto}')")}" >
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
        <div id="totalRendido" class="fieldcontain">
            <label for="totalRendido">TOTAL RENDIDO</label>
            <input type="text" placeholder="TOTAL RENDIDO" name="totalRendido" value="${compite.Egreso.executeQuery("Select sum (monto) from Egreso where proyecto IN" +
                    "(SELECT id from Proyecto where nombre = '${params.proyecto}')")}" >
        </div>
        <div id="totalAnticipado" class="fieldcontain">
            <label for="totalAnticipado">TOTAL ANTICIPADO</label>
            <input type="text" placeholder="" name="totalAnticipado" value="">
        </div>
        <div id="total" class="fieldcontain">
            <label for="total">TOTAL</label>
            <input type="text" placeholder="" name="total" value="">
        </div>
        <div id="aprobacion" class="fieldcontain">
            <label for="aprobacion">APROBACION</label>
        </div>
        <input type="radio" name="aprobacion" value="SI">SI
        <input type="radio" name="aprobacion" value="NO">NO
    </div>
        <div id="creadopor" class="fieldcontain">
            <label for="creadopor">CREADO POR</label>
            <input type="text" placeholder="CREADO POR" name="creadoPor" value="">
        </div>
    <button>Guardar Reporte Rendicion</button>
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
        var usuarios = [
            <g:each in="${usuarios}">
            '${it.nombres} ${it.paterno} ・ ${it.rut}',
            </g:each>
        ];
        var proyectos = [
            <g:each in="${proyectos}">
            '${it.nombre}',
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


