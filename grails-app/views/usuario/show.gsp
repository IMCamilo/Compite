<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-usuario" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <label for="tipo">Rut:
                ${usuario.rut}
            </label></br>
            <label for="tipo">Nombres
                ${usuario.nombres}
            </label></br>
            <label for="tipo">Paterno
                ${usuario.paterno}
            </label></br>
            <label for="tipo">Materno
                ${usuario.materno}
            </label></br>
            <label for="tipo">Dirección
                ${usuario.direccion}
            </label></br>
            <label for="tipo">Correo
                ${usuario.correo}
            </label></br>
            <label for="tipo">Telefono
                ${usuario.telefono}
            </label></br>
            <label for="tipo">Clave
                ${usuario.clave}
            </label></br>
            <label for="tipo">Tipo
                ${usuario.tipo}
            </label></br>
            <g:form resource="${this.usuario}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.usuario}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
