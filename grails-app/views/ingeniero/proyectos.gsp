<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainingeniero" />
    <g:set var="entityName" value="${message(code: 'rendicion.label', default: 'Rendicion')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <asset:stylesheet src="compite/autocomplete.css"/>
</head>
<body>
<a href="#list-rendicion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="list-rendicion" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <th>Seleccionar</th>
            <g:sortableColumn property="tipoRendicion" defaultOrder="desc" title="Codigo"/>
            <g:sortableColumn property="sedeEnvio" defaultOrder="desc" title="Nombre"/>
            <g:sortableColumn property="total" defaultOrder="desc" title="Esado"/>
        </tr>
        </thead>
        <tbody>
        <g:each var="proyectos" status="i" in="${proyectosPublicos}">
            <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                <td><g:link controller="movilizacion" action="nuevamovilizacion" params="${proyectos.id}" value="Ver"/></td>
                <td>${proyectos.codigo}</td>
                <td>${proyectos.nombre}</td>
                <td>${proyectos.estado}</td>
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

</script>
</body>
</html>