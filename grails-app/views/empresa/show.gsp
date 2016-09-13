<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-empresa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-empresa" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <label for="tipo">Rut:
                ${empresa.rut}
            </label></br>
            <label for="tipo">Nombre
                ${empresa.nombre}
            </label></br>
            <label for="tipo">Giro
                ${empresa.giro}
            </label></br>
            <label for="tipo">Gerente
                ${empresa.gerente}
            </label></br>
            <label for="tipo">Tipo
                ${empresa.tipo}
            </label></br>
            <label for="tipo">Fecha Creación
                ${empresa.fechaCreacion}
            </label></br>
            <label for="tipo">Telefono
                ${empresa.telefono}
            </label></br>
            <label for="tipo">Direccion
                ${empresa.direccion}
            </label></br>
            <label for="tipo">Correo
                ${empresa.correo}
            </label></br>
            <g:form resource="${this.empresa}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.empresa}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
