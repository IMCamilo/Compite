<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-egreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-egreso" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <label for="tipo">Fecha Creación:
                ${egreso.fechaCreacion}
            </label></br>
            <label for="tipo">Concepto:
                ${egreso.concepto}
            </label></br>
            <label for="tipo">Monto:
                ${egreso.monto}
            </label></br>
            <label for="tipo">Proyecto:
                ${egreso.proyectoId} (mostrar nombre en vez de id)
            </label></br>
            <label for="tipo">Usuario:
                ${egreso.usuarioId} (mostrar nombre en vez de id)
            </label></br>
            <label for="tipo">Sede Envío:
                ${egreso.sedeEnvio}
            </label></br>
            <label for="tipo">Tipo Rendición:
                ${egreso.tipoRendicion}
            </label></br>
            <label for="tipo">Aprobación:
                ${egreso.aprobacion}
            </label></br>
            <g:form resource="${this.egreso}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.egreso}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
