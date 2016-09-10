<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-egreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="create-egreso" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form action="save">
                <fieldset class="form">
                    <div class="fieldcontain required">
                    <label for="nombres">Sede Envío
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="sedeEnvio" value="" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Concepto
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="concepto" value="" required="" type="text"></div>

                    <div class="fieldcontain required">
                    <label for="nombres">Monto
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="monto" value="" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Proyecto
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="proyecto" value="" placeholder="Desplegable Proyecto" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Usuario
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="usuario" value="" placeholder="Desplegable Usuario" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Tipo Rendición
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="tipoRendicion" value="" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Aprobación
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="aprobacion" value="" required="" type="text"></div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
        <div id="list-egreso" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${egresoList}" />

            <div class="pagination">
                <g:paginate total="${egresoCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
