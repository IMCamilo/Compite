<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainingeniero" />
    <g:set var="entityName" value="${message(code: 'movilizacion.label', default: 'Movilizacion')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <asset:stylesheet src="compite/autocomplete.css"/>
</head>
<body>
<a href="#list-movilizacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<div id="create-movilizacion" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.movilizacion}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.movilizacion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="verificar">
        <fieldset class="form">
            <div class='fieldcontain required'>
                <label for='motivoEmpresa'>Fecha Documento
                    <span class='required-indicator'>*</span>
                </label><input type="date" name="fechain" value="" required="" id="fecha" />
            </div>
            <div class='fieldcontain required'>
                <label for='motivoEmpresa'>Item de movilización
                    <span class='required-indicator'>*</span>
                </label>
                <select name="tipo" class="fieldcontain required">
                    <option value="combustible">Combustible</option>
                    <option value="peaje">Peaje</option>
                    <option value="tag">Tag</option>
                    <option value="estacionamiento">Estacionamiento</option>
                </select>
            </div>
            <div class='fieldcontain required'>
                <label for='motivoEmpresa'>Motivo/Empresa
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="motivoEmpresa" maxlength="40" value="" required="" id="motivoEmpresa" placeholder="Describa motivo de la movilización"/>
            </div>
            <div class='fieldcontain required'>
                <label for='distancia'>Distancia(kmtrs)/Tiempo(hrs)
                    <span class='required-indicator'>*</span>
                </label><input type="number" name="distancia" value="" required="" id="distancia" max="100000" onkeypress="return isNumber(event)" placeholder="Ingrese la distancia total"/>
            </div>
            <div class='fieldcontain required'>
                <label for='direccion'>Direccion
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="direccion" value="" required="" id="direccion" maxlength="60" placeholder="Ingrese la dirección"/>
            </div>
            <div class='fieldcontain required'>
                <label for='concepto'>Empresa
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="concepto" value="" required="" id="concepto" maxlength="20" placeholder="Empresa a la que se cancela la boleta" />
            </div>
            <div class='fieldcontain required'>
                <label for='concepto'>Total
                    <span class='required-indicator'>*</span>
                </label><input type="number" name="precio" value="" required="" id="precio" max="100000" onkeypress="return isNumber(event)" placeholder="Total de boleta"/>
            </div>
            <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>
</div>
<div id="list-movilizacion" class="content scaffold-list" role="main">
    <h1>Lista de movilizacion para proyecto: ${proyecto.nombre}</h1>
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
                <td><a href="../editarmov/${movilizacion.id}">Editar</a></td>
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
<script>

</script>
</body>
</html>
