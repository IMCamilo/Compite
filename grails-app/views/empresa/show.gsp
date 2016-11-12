<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-empresa" class="content scaffold-show" role="main">
            <h1>Ver Detalles de la Empresa</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="errpr" role="status">${flash.error}</div>
            </g:if>
            <g:each in="${empresa}">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Rut :</label>
                        <label style="color: dimgray">${it.rut}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Nombre :</label>
                        <label style="color: dimgray">${it.nombre}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Giro :</label>
                        <label style="color: dimgray">${it.giro}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Gerente :</label>
                        <label style="color: dimgray">${it.gerente}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Tipo :</label>
                        <label style="color: dimgray">${it.tipo}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Fecha Creación :</label>
                        <label style="color: dimgray">${formatDate(format:"dd/MM/yyyy", date: it.fechaCreacion)}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Teléfono :</label>
                        <label style="color: dimgray">${it.telefono}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Dirección :</label>
                        <label style="color: dimgray">${it.direccion}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Correo :</label>
                        <label style="color: dimgray">${it.correo}</label>
                    </div>
                </div>
            </g:each>
            <g:form resource="${this.empresa}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="volver" action="index">Volver al Listado</g:link>
                    <g:link class="edit" action="edit" resource="${this.empresa}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
