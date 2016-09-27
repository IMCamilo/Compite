<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainingeniero" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="list-egreso" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
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
                    </tr>
                </thead>
                <tbody>
                    <g:each var="egreso" status="i" in="${egresoList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="edit/${egreso.id}">ver</a></td>
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
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${egresoCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
