<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'asignacion.label', default: 'Asignacion')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-asignacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="list-asignacion" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div id="create-asignacion" class="content scaffold-create" role="main">
                <h1><g:message code="default.create.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.asignacion}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.asignacion}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
                </g:hasErrors>
                <g:form action="save">
                    <fieldset class="form">
                        <div class="fieldcontain required">
                            <label for="tipo">Proyecto<span class="required-indicator">*</span></label>
                            <input name="proyecto" placeholder="Desplegable proyecto" value="" required="" type="text">
                        </div>
                        <div class="fieldcontain required">
                            <label for="tipo">Usuario<span class="required-indicator">*</span></label>
                            <input name="usuario" placeholder="Desplegable usuario" value="" required="" maxlength="13" type="text">
                        </div>
                        <div class="fieldcontain required">
                            <label for="tipo">Detalle<span class="required-indicator">*</span></label>
                            <textarea  name="detalle" required="" rows="4" cols="50"></textarea>
                        </div>
                        <div class="fieldcontain required">
                        <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden"></div>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </fieldset>
                </g:form>
            </div>
            <f:table collection="${asignacionList}" />

            <div class="pagination">
                <g:paginate total="${asignacionCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
