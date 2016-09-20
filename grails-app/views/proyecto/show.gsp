<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
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
            <h1>Ver Proyecto</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:each in="${proyecto}">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Código :</label>
                        <label style="color: dimgray">${it.codigo}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Nombre :</label>
                        <label style="color: dimgray">${it.nombre}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Presupuesto :</label>
                        <label style="color: dimgray">${it.presupuesto}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Empresa :</label>
                        <label style="color: dimgray">${it.empresa}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Estado :</label>
                        <label style="color: dimgray">${it.estado}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Tipo :</label>
                        <label style="color: dimgray">${it.tipo}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Fecha creación :</label>
                        <label style="color: dimgray">${it.fechaCreacion}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Fecha Fin :</label>
                        <label style="color: dimgray">${it.fechaFin}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Asignación :</label>
                        <label style="color: dimgray">${it.asignacion}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Egreso :</label>
                        <label style="color: dimgray">${it.egreso}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Auditoría :</label>
                        <label style="color: dimgray">${it.auditoria}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Creado por :</label>
                        <label style="color: dimgray">${it.creadoPor}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Rendición :</label>
                        <label style="color: dimgray">${it.rendicion}</label>
                    </div>
                </div>
            </g:each>
            <g:form resource="${this.proyecto}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.proyecto}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
