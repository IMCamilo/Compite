<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-item" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.item}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.item}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.item}" method="PUT">
                <g:hiddenField name="version" value="${this.item?.version}" />
                <fieldset class="form">
                    <fieldset class="form">
                        <div class="fieldcontain required">
                        <label for="tipo">Tipo
                            <span class="required-indicator">*</span>
                        </label>
                        <input name="tipo" value="${item.tipo}" required="" maxlength="15" id="rut" type="text"></div>
                        <div class="fieldcontain required">
                        <label for="descripcion">Descripción
                            <span class="required-indicator">*</span>
                        </label>
                        <input name="descripcion" value="${item.descripcion}" required="" maxlength="50" id="nombres" type="text"></div>
                        <div class="fieldcontain required">
                        <label for="valor">Valor
                            <span class="required-indicator">*</span>
                        </label>
                        <input name="valor" value="${item.valor}" required="" maxlength="50" id="paterno" type="text"></div>
                        <div class="fieldcontain required">
                        <label for="nombre">Nombre
                            <span class="required-indicator">*</span>
                        </label>
                        <input name="nombre" value="${item.nombre}" required="" maxlength="50" id="materno" type="text"></div>
                    </fieldset>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
