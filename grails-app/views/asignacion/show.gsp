<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="administrador.base" />
        <g:set var="entityName" value="${message(code: 'asignacion.label', default: 'Asignacion')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<a href="#show-asignacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>-->
        <div id="show-asignacion" class="content scaffold-show" role="main">
            <h3>Mostrar Asignación</h3>
            <div class="row">
                <div class="col s12">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <div class="input-field col s6">
                        <label>Proyecto:
                        ${nombreProyecto}
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <div class="input-field col s6">
                        <label>Usuario:
                        ${nombreCompletoUsuario}
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <div class="input-field col s6">
                        <label>Fecha Creación:
                        ${asignacion.fechaCreacion}
                        </label>
                    </div>
                    <div class="input-field col s6">
                        <label>Detalle:
                        ${asignacion.detalle}
                        </label>
                    </div>
                </div>
            </div>
            </br></br>
            <div class="row">
                <g:form resource="${this.asignacion}" method="DELETE">
                    <div class="col s12">
                        <div class="input-field col s6">
                            <g:link class="edit btn" action="edit" resource="${this.asignacion}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        </div>
                    </div>
                    <div class="col s12">
                        <br>
                        <div class="input-field col s6">
                            <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
                            <br>
                            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </body>
</html>
