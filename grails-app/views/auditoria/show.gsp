<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'auditoria.label', default: 'Auditoria')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-auditoria" class="content scaffold-show" role="main">
            <h1>Ver Auditoría</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--  Proyecto Usuario  Creado Por  Descripcion  Estado  Motivo  Fecha Creacion  Nombre  -->
            <g:each in="${auditoria}">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Nombre :</label>
                        <label style="color: dimgray">${it.nombre}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Programa :</label>
                        <label style="color: dimgray">${it.programa.nombre}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Usuario :</label>
                        <label style="color: dimgray">${it.usuario}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Creado Por :</label>
                        <label style="color: dimgray">${it.creadoPor}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Descripción :</label>
                        <label style="color: dimgray">${it.descripcion}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Estado :</label>
                        <label style="color: dimgray">${it.estado}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Motivo :</label>
                        <label style="color: dimgray">${it.motivo}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Fecha de Auditoria :</label>
                        <label style="color: dimgray">${it.fechaCreacion}</label>
                    </div>
                </div>
            </g:each>
            <div style="width:50%">
                <p>Archivos</p>
                <table>
                    <thead>
                        <tr>
                            <th>Creado Por</th>
                            <th>Nombre Archivo</th>
                            <th>Subido</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="archivo" status="i" in="${archivos}">
                             <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                                <td>${archivo.creadoPor}</td>
                                <td>${archivo.nombre}</td>
                                <td><prettytime:display date="${archivo.date}"/></td>
                                <td>
                                    <g:form action="download">
                                        <g:hiddenField name="rutaAbsoluta" value="${archivo.ruta}"/>
                                        <g:hiddenField name="nombreArchivo" value="${archivo.nombre}"/>
                                        <g:submitButton name="name" style="width:100%" value="Descargar"/>
                                    </g:form>
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <g:form resource="${this.auditoria}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="list" action="index">Volver al Listado</g:link>
                    <g:link class="edit" action="edit" resource="${this.auditoria}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <g:if test="${auditoria.estado != "APROBADA"}">
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:if>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
