<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-item" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:each in="${item}">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Item Presupuestario :</label>
                        <label style="color: dimgray">${it.itemPresupuestario}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Nombre :</label>
                        <label style="color: dimgray">${it.nombre}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Descripción :</label>
                        <label style="color: dimgray">${it.descripcion}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Centro de Costos :</label>
                        <label style="color: dimgray">${it.centroCosto}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Valor :</label>
                        <label style="color: dimgray">${it.valor}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Creado Por :</label>
                        <label style="color: dimgray">${it.creadoPor}</label>
                    </div>
                </div>
            </g:each>
            <g:form resource="${this.item}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.item}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
