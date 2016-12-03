<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'auditoria.label', default: 'Auditoria')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div id="list-auditoria" class="content scaffold-list" role="main">
            <h1>Listado de Egresos en Auditoría</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>Detalles</th>
                        <g:sortableColumn property="programa" defaultOrder="desc" title="Programa"/>
                        <g:sortableColumn property="concepto" defaultOrder="desc" title="Concepto"/>
                        <g:sortableColumn property="aprobacion" defaultOrder="desc" title="Aprobación"/>
                        <g:sortableColumn property="monto" defaultOrder="desc" title="Monto"/>
                        <g:sortableColumn property="tipoDocumento" defaultOrder="desc" title="Tipo Documento"/>
                        <g:sortableColumn property="pagadoA" defaultOrder="desc" title="Pagado a"/>
                        <g:sortableColumn property="usuario" defaultOrder="desc" title="Rendido Por"/>
                        <g:sortableColumn property="egreso" defaultOrder="desc" title="Egreso"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="auditoria" status="i" in="${auditoriaList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                             <td>
                                 <div align="center"><a href="show/${auditoria.id}">Ver</a></div>
                             </td>
                             <td>${auditoria.programa.nombre}</td>
                             <td>${auditoria.concepto}</td>
                             <td>${auditoria.aprobacion}</td>
                             <td>$ ${auditoria.monto}</td>
                             <td>${auditoria.tipoDocumento}</td>
                             <td>${auditoria.pagadoA}</td>
                             <td>${auditoria.usuario.nombres} ${auditoria.usuario.paterno} ${auditoria.usuario.materno}</td>
                             <td><g:link controller="egreso" action="show" id="${auditoria.id}">N° ${auditoria.id}</g:link></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${auditoriaCount ?: 0}" />
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
                var programas = [
                    <g:each in="${programas}">
                        '${it.codigo} - ${it.nombre}',
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
            });
        </script>
    </body>
</html>
