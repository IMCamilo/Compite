<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainadministrador" />
    <g:set var="entityName" value="${message(code: 'movilizacion.label', default: 'Movilizacion')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <asset:stylesheet src="compite/autocomplete.css"/>
</head>
<body>
<a href="#edit-movilizacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="edit-movilizacion" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
    <g:form action="editguardar" resource="${this.movilizacion}" method="PUT">
        <g:hiddenField name="version" value="${this.movilizacion?.version}" />
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
                <label for='motivoEmpresa'>Motivo Empresa
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="motivoEmpresa" value="${movilizacion.motivoEmpresa}" required="" id="motivoEmpresa" maxlength="40" />
            </div>
            <div class='fieldcontain required'>
                <label for='distancia'>Distancia (kmtrs)/Tiempo (Hrs)
                    <span class='required-indicator'>*</span>
                </label><input type="number" name="distancia" value="${movilizacion.distancia}" required="" id="distancia" max="100000" onkeypress="return isNumber(event)" />
            </div>
            <div class='fieldcontain required'>
                <label for='direccion'>Direccion
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="direccion" value="${movilizacion.direccion}" maxlength="60" required="" id="direccion" />
            </div>
            <div class='fieldcontain required'>
                <label for='concepto'>Concepto
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="concepto" value="${movilizacion.concepto}" maxlength="20" required="" id="concepto" />
            </div>
            <div class='fieldcontain required'>
                <label for='concepto'>Total
                    <span class='required-indicator'>*</span>
                </label><input type="number" name="precio" value="${movilizacion.precio}" max="100000" onkeypress="return isNumber(event)" required="" id="precio" />
            </div>
        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'editguardar')}" />
        </fieldset>
    </g:form>
</div>
<asset:javascript src="compite/jquery-2.1.1.min.js"/>
<asset:javascript src="compite/typeahead.bundle.js"/>
</body>
</html>