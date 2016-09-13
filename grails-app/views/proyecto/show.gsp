<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-proyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-proyecto" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <label for="tipo">Presupuesto:
                ${proyecto.presupuesto}
            </label></br>
            <label for="tipo">Código:
                ${proyecto.codigo}
            </label></br>
            <label for="tipo">Estado:
                ${proyecto.estado}
            </label></br>
            <label for="tipo">Tipo:
                ${proyecto.tipo}
            </label></br>
            <label for="tipo">Fecha Creación:
                ${proyecto.fechaCreacion}
            </label></br>
            <label for="tipo">Empresa:
                ${proyecto.empresaId} (mostrar nombre en base a este id, hace consulta.)
            </label></br>
            <label for="tipo">Nombre:
                ${proyecto.nombre}
            </label></br>
            <label for="tipo">Fecha Finalización:
                ${proyecto.fechaFin}
            </label></br>
            <g:form resource="${this.proyecto}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.proyecto}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
