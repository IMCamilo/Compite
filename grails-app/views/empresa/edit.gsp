<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-empresa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-empresa" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.empresa}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.empresa}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.empresa}" method="PUT">
                <g:hiddenField name="version" value="${this.empresa?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain required">
                    <label for="tipo">Rut
                        <span class="required-indicator">*</span>
                    </label><input type="text" id="rut" name="rut" value="${empresa.rut}"  required oninput="checkRut(this)" placeholder="Ingrese RUT">
                    </div>
                    <div class="fieldcontain required">
                    <label for="descripcion">Tipo
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="tipo" value="${empresa.tipo}" required="" maxlength="15" id="nombres" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="valor">Nombre
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="nombre" value="${empresa.nombre}" required="" maxlength="10" id="paterno" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombre">Giro
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="giro" value="${empresa.giro}" required="" maxlength="10" id="materno" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombre">Gerente
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="gerente" value="${empresa.gerente}" required="" maxlength="10" id="materno" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombre">Dirección
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="direccion" value="${empresa.direccion}" required="" maxlength="10" id="materno" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombre">Correo
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="correo" value="${empresa.correo}" required="" maxlength="10" id="materno" type="email"></div>

                    <div class="fieldcontain required">
                    <label for="nombre">Telefono
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="telefono" value="${empresa.telefono}" required="" maxlength="10" id="materno" type="text"></div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    <asset:javascript src="compite/validarut.js"/>
    </body>
</html>
