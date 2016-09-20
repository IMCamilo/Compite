<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainingeniero" />
    <g:set var="entityName" value="${message(code: 'egresoMov.label', default: 'EgresoMov')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <asset:stylesheet src="compite/autocomplete.css"/>
</head>
<body>
<a href="#list-egresoMov" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<div id="create-egresoMov" class="content scaffold-create" role="main">
    <h1>Asigna una Movilizacion a un Egreso</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.egresoMov}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.egresoMov}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save">

    </g:form>
</div>
<div id="list-movilizacion" class="content scaffold-list" role="main">
    <h1>Lista de movilizacion para proyecto: ${proyecto.nombre}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <th>ver</th>
            <g:sortableColumn property="fecha" defaultOrder="desc" title="Fecha"/>
            <g:sortableColumn property="motivoEmpresa" defaultOrder="desc" title="Motivo/Empresa"/>
            <g:sortableColumn property="direccion" defaultOrder="desc" title="Dirección"/>
            <g:sortableColumn property="distancia" defaultOrder="desc" title="Distancia"/>
            <g:sortableColumn property="tipo" defaultOrder="desc" title="Tipo"/>
            <g:sortableColumn property="precio" defaultOrder="desc" title="Precio"/>
        </tr>
        </thead>
        <tbody>
        <g:each var="movilizacion" status="i" in="${movsList}">
            <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                <td><a href="../editarmov/${movilizacion.id}">Seleccionar</a></td>
                <td>${formatDate(format:"dd/MM/yyyy", date: movilizacion.fechaCreacion)}</td>
                <td>${movilizacion.motivoEmpresa}</td>
                <td>${movilizacion.direccion}</td>
                <td>${movilizacion.distancia}</td>
                <td>${movilizacion.tipo}</td>
                <td>${movilizacion.precio}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${movilizacionCount ?: 0}" />
    </div>
</div>
<asset:javascript src="compite/jquery-2.1.1.min.js"/>
<asset:javascript src="compite/typeahead.bundle.js"/>

</body>
</html>
