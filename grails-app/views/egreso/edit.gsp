<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-egreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-egreso" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.egreso}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.egreso}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.egreso}" method="PUT">
                <g:hiddenField name="version" value="${this.egreso?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain required">
                    <label for="nombres">Sede Envío
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="sedeEnvio" value="${egreso.sedeEnvio}" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Concepto
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="concepto" value="${egreso.concepto}" required="" type="text"></div>

                    <div class="fieldcontain required">
                    <label for="nombres">Monto
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="monto" value="${egreso.monto}" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Proyecto
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="proyecto" value="${egreso.proyectoId}" placeholder="Desplegable Proyecto" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Usuario
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="usuario" value="${egreso.usuarioId}" placeholder="Desplegable Usuario" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Tipo Rendición
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="tipoRendicion" value="${egreso.tipoRendicion}" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Aprobación
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="aprobacion" value="${egreso.aprobacion}" required="" type="text"></div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
