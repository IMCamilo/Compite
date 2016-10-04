<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'rendicion.label', default: 'Rendicion')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="list-rendicion" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>
                            <div align="center">Detalles</div>
                        </th>
                        <g:sortableColumn property="id" defaultOrder="desc" title="Número"/>
                        <g:sortableColumn property="tipoRendicion" defaultOrder="desc" title="Tipo Rendicion"/>
                        <g:sortableColumn property="sedeEnvio" defaultOrder="desc" title="Sede de Envío"/>
                        <g:sortableColumn property="total" defaultOrder="desc" title="Total"/>
                        <g:sortableColumn property="totalAnticipado" defaultOrder="desc" title="Total Anticipado"/>
                        <g:sortableColumn property="totalRendido" defaultOrder="desc" title="Total Rendido"/>
                        <g:sortableColumn property="estado" defaultOrder="desc" title="Estado"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="rendicion" status="i" in="${rendicionList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                             <td>
                                 <div align="center"><a href="show/${rendicion.id}">Ver</a></div>
                             </td>
                             <td>Nº ${rendicion.id}</td>
                             <td>${rendicion.tipoRendicion}</td>
                             <td>${rendicion.sedeEnvio}</td>
                             <td>$ ${rendicion.total}</td>
                             <td>$ ${rendicion.totalAnticipado}</td>
                             <td>$ ${rendicion.totalRendido}</td>
                             <g:if test="${rendicion.estado == "APROBADA"}">
                                 <td>Aprobada</td>
                             </g:if>
                             <g:elseif test="${rendicion.estado == "ENVIADA_POR_VALIJA"}">
                                 <td>Enviada por Valija</td>
                             </g:elseif>
                             <g:elseif test="${rendicion.estado == "RECEPCIONADA_SANTIAGO"}">
                                 <td>Recepcionada en Santiago (valija)</td>
                             </g:elseif>
                             <g:elseif test="${rendicion.estado == "APROBADA_FIRMADA_SANTIAGO"}">
                                 <td>Aprobada y firmada</td>
                             </g:elseif>
                             <g:elseif test="${rendicion.estado == "TRANSFERENCIA_OK"}">
                                 <td>Transferencia de fondos realizada</td>
                             </g:elseif>
                             <g:elseif test="${rendicion.estado == "FINALIZADA"}">
                                 <td>Finalizada</td>
                             </g:elseif>
                             <g:elseif test="${rendicion.estado == "NO_APROBADA"}">
                                 <td>No aprobada</td>
                             </g:elseif>
                             <g:elseif test="${rendicion.estado == "RECHAZADA"}">
                                 <td>Rechazada (por Santiago)</td>
                             </g:elseif>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${rendicionCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
