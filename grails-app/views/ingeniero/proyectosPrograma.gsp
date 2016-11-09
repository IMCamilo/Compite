<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainingeniero" />
    <g:set var="entityName" value="${message(code: 'rendicion.label', default: 'Rendicion')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <asset:stylesheet src="compite/autocomplete.css"/>
</head>
<body>
    <div id="find-programa" class="content" role="main">
        <g:if test="${flash.error}">
            <div class="errors" role="status">${flash.error}</div>
        </g:if>
        <h1>Buscar Proyecto</h1>
        <g:form method="GET" action="proyectosPrograma">
            <fieldset class="form">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <div class="fieldcontain required" id="proyectoinputdiv">
                            <label for="nombreProyecto">Nombre del Proyecto</label>
                            <g:if test="${proyectoBusqueda == null}">
                                <input id="nombreProyecto" class="typeahead" name="nombreProyecto" type="text" placeholder="Busca un Proyecto">
                            </g:if>
                            <g:else>
                                <input id="nombreProyecto" value="${proyectoBusqueda}" class="typeahead" name="nombreProyecto" type="text" placeholder="Busca un Proyecto">
                            </g:else>
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
                        <g:submitButton name="find" class="save btn btn-success" value="Buscar" />
                    </div>
                </div>
            </fieldset>
        </g:form>
    </div>
    <div id="list-proyectos" class="content scaffold-list" role="main">
        <h1>Listado de Proyectos para Programa: ${nombrePrograma}</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
                <tr>
                    <g:sortableColumn property="codigo" defaultOrder="desc" title="Codigo"/>
                    <g:sortableColumn property="nombre" defaultOrder="desc" title="Nombre"/>
                    <th>Empresa</th>
                    <g:sortableColumn property="estado" defaultOrder="desc" title="Estado"/>
                    <th>Crear Egreso</th>
                </tr>
            </thead>
            <tbody>
                <g:each var="proyecto" status="i" in="${proyectos}">
                    <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                        <td>${proyecto.codigo}</td>
                        <td>${proyecto.nombre}</td>
                        <td>${proyecto.empresa.nombre}</td>
                        <td>${proyecto.estado}</td>
                        <td>
                            <g:link class="btn btn-primary btn-xs" controller="egresoIng" action="crear" id="${proyecto.id}">Egreso</g:link>
                            <g:link class="btn btn-success btn-xs" controller="egresoIng" action="egresomovilizacion" id="${proyecto.id}">Egreso de Movilizacion</g:link>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${rendicionCount ?: 0}" />
        </div>
    </div>
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
                '${it.codigo} - ${it.nombre} - ${it.id}',
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