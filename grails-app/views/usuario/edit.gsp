<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-usuario" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.usuario}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.usuario}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.usuario}" method="PUT">
                <g:hiddenField name="version" value="${this.usuario?.version}" />
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='rut'>Rut
                            <span class='required-indicator'>*</span>
                        </label>
                        <input type="text" id="rut" value="${usuario.rut}" name="rut" required oninput="checkRut(this)" placeholder="Ingrese RUT">
                    </div>
                    <div class='fieldcontain required'>
                        <label for='nombres'>Nombres
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="nombres" value="${usuario.nombres}" required="" maxlength="15" id="nombres"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='paterno'>Paterno
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="paterno" value="${usuario.paterno}" required="" maxlength="15" id="paterno"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='materno'>Materno
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="materno" value="${usuario.materno}" required="" maxlength="15" id="materno"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='direccion'>Direccion
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="direccion" value="${usuario.direccion}" required="" maxlength="100" id="direccion"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='correo'>Correo
                            <span class='required-indicator'>*</span>
                        </label><input type="email" name="correo" value="${usuario.correo}" required="" maxlength="30" id="correo"/>
                    </div>
                    <div class='fieldcontain'>
                        <label for='telefono'>Telefono</label><input type="text" name="telefono" value="${usuario.telefono}" maxlength="15" id="telefono"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='clave'>Clave
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="clave" value="${usuario.clave}" required="" maxlength="15" id="clave"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='tipo'>Tipo
                            <span class='required-indicator'>*</span>
                        </label><input type="number" name="tipo" value="${usuario.tipo}" required="" id="tipo"/>
                    </div>
                    <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    <asset:javascript src="compite/validarut.js"/>
    </body>
</html>
