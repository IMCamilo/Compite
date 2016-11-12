<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'region.label', default: 'Region')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-region" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.region}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.region}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.region}" method="PUT">
                <g:hiddenField name="version" value="${this.region?.version}" />
                <fieldset class="form">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="codigo">Codigo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input id="codigo" value="${region.codigo}" name="codigo" type="number" max="10" min="1" required="" placeholder="Ingrese un codigo">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="proyectoinputdiv">
                                <label for="nombre">Nombre
                                    <span class="required-indicator">*</span>
                                </label>
                                <input type="text"value="${region.nombre}" name="nombre" required="" id="nombre"/>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:link class="volver" action="index">Volver al Listado</g:link>
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
