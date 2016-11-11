<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainingeniero" />
    <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
    <title>Lista de Auditorías</title>
</head>
<body>
<g:if test="${listaAuditorias.isEmpty()}">
    <h1>Sin Auditorías</h1>
</g:if>
<g:else>
    <div id="list-egreso" class="content scaffold-list" role="main">
        <h1>Listado de Egresos en Auditoría</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr>
                <th>Ver Detalles</th>
                <g:sortableColumn property="programa" defaultOrder="desc" title="Programa"/>
                <g:sortableColumn property="concepto" defaultOrder="desc" title="Concepto"/>
                <g:sortableColumn property="aprobacion" defaultOrder="desc" title="Aprobación"/>
                <g:sortableColumn property="monto" defaultOrder="desc" title="Monto"/>
                <g:sortableColumn property="tipoDocumento" defaultOrder="desc" title="Tipo Documento"/>
                <g:sortableColumn property="pagadoA" defaultOrder="desc" title="Pagado a"/>
                <g:sortableColumn property="observacion" defaultOrder="desc" title="Motivo"/>
            </tr>
            </thead>
            <tbody>
                <g:each var="egreso" status="i" in="${listaAuditorias}">
                    <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                        <td><a href="show/${egreso.id}">Ver</a></td>
                        <td>${egreso.programa.nombre}</td>
                        <td>${egreso.concepto}</td>
                        <td>${egreso.aprobacion}</td>
                        <td>$ ${egreso.monto}</td>
                        <td>${egreso.tipoDocumento}</td>
                        <td>${egreso.pagadoA}</td>
                        <td>${egreso.observacion}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${egresoCount ?: 0}" />
        </div>
    </div>
</g:else>
</body>
</html>
