<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="administrador.base" />
        <g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<a href="#show-proyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>-->
        <div id="show-proyecto" class="content scaffold-show" role="main">
            <h3><g:message code="default.show.label" args="[entityName]" /></h3 >
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="row">
                <div class="col s12">
                    <div class="input-field col s6">
                        <label>Código:
                        ${proyecto.codigo}
                        </label>
                    </div>
                    <div class="input-field col s6">
                        <label>Presupuesto:
                        ${proyecto.presupuesto}
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <div class="input-field col s6">
                        <label>Nombre:
                        ${proyecto.nombre}
                        </label>
                    </div>
                    <div class="input-field col s6">
                        <label>Tipo:
                        ${proyecto.tipo}
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <div class="input-field col s6">
                        <label>Empresa:
                        ${nombreEmpresa}
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <div class="input-field col s6">
                        <label for="tipo">Fecha Creación:
                        ${proyecto.fechaCreacion}
                        </label>
                    </div>
                    <div class="input-field col s6">
                        <label for="tipo">Fecha Finalización:
                        ${proyecto.fechaFin}
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <div class="input-field col s6">
                        <label for="tipo">Estado:
                        ${proyecto.estado}
                        </label>
                    </div>
                </div>
            </div>
            </br></br>
            <div class="row">
                <g:form resource="${this.proyecto}" method="DELETE">
                    <div class="col s12">
                        <div class="input-field col s6">
                            <g:link class="edit" action="edit" resource="${this.proyecto}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        </div>
                        <div class="input-field col s6">
                            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </body>
</html>
