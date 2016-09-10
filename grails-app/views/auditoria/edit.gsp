<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'auditoria.label', default: 'Auditoria')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-auditoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-auditoria" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.auditoria}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.auditoria}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.auditoria}" method="PUT">
                <g:hiddenField name="version" value="${this.auditoria?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label for="tipo">Descripción<span class="required-indicator">*</span></label>
                        <textarea  name="descripcion" required="" rows="4" cols="50">${auditoria.descripcion}</textarea>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Estado<span class="required-indicator">*</span></label>
                        <input name="estado" value="${auditoria.estado}" required="" type="text">
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Proyecto<span class="required-indicator">*</span></label>
                        <input name="proyecto" value="${auditoria.proyectoId}" placeholder="autocompletable con proyectos" value="" required="" type="text">
                        <label for="">generar autocompletable para proyecto</label>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Usuario<span class="required-indicator">*</span></label>
                        <input name="usuario" value="${auditoria.usuarioId}" placeholder="autocompletable con usuarios" value="" required="" type="text">
                        <label for="">generar autocompletable para usuario</label>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
