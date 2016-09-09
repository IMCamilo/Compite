<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'transporte.label', default: 'Transporte')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-transporte" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-transporte" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.transporte}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.transporte}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.transporte}" method="PUT">
                <g:hiddenField name="version" value="${this.transporte?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain required">
                    <label for="rut">Tipo
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="tipo" value="${transporte.tipo}" required="" maxlength="13" id="rut" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Descripción
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="descripcion" value="${transporte.descripcion}" required="" maxlength="15" id="nombres" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="paterno">Marca
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="marca" value="${transporte.marca}" required="" maxlength="10" id="paterno" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="materno">Km Por Litro
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="kmPorLitro" value="${transporte.kmPorLitro}" required="" maxlength="10" id="materno" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="direccion">Modelo
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="modelo" value="${transporte.modelo}" required="" maxlength="35" id="direccion" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="correo">Combustible
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="combustible" value="${transporte.combustible}" required="" maxlength="30" id="correo" type="text"></div>
                    <div class="fieldcontain">
                    <label for="telefono">Usuario</label>
                    <input name="usuario" value="${transporte.usuarioId}" placeholder="aca un autocompletar" maxlength="15" id="telefono" type="text"></div>
                    <div class="fieldcontain required">

                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
