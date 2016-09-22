<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-usuario" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:each in="${usuario}">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Tipo :</label>
                        <label style="color: dimgray">
                            <g:if test="${it.tipo == 2}">
                                Ingeniero
                            </g:if>
                            <g:else>
                                Administrador
                            </g:else>
                        </label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Rut :</label>
                        <label style="color: dimgray">${it.rut}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Nombre :</label>
                        <label style="color: dimgray">${it.nombres}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Paterno :</label>
                        <label style="color: dimgray">${it.paterno}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Materno :</label>
                        <label style="color: dimgray">${it.materno}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Dirección :</label>
                        <label style="color: dimgray">${it.direccion}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Correo :</label>
                        <label style="color: dimgray">${it.correo}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Teléfono :</label>
                        <label style="color: dimgray">${it.telefono}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Transporte :</label>
                        <label style="color: dimgray">
                            <g:if test="${it.transporte.isEmpty()}">
                                Sin transporte
                            </g:if>
                            <g:else>
                                ${it.transporte.patente}
                            </g:else>
                        </label>
                    </div>
                </div>
            </g:each>
            <g:form resource="${this.usuario}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.usuario}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
