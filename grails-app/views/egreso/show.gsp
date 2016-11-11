<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-egreso" class="content scaffold-show" role="main">
            <h1>Ver Egreso</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:each in="${egreso}">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Creado Por :</label>
                        <label style="color: dimgray">${it.creadoPor}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Item :</label>
                        <label style="color: dimgray">${it.item.nombre}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Rut Empresa :</label>
                        <label style="color: dimgray">${it.rutEmpresa}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Programa :</label>
                        <label style="color: dimgray">${it.programa.nombre}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Proyecto :</label>
                        <label style="color: dimgray">${it.proyecto.nombre}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Aprobacion :</label>
                        <label style="color: dimgray">${it.aprobacion}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Tipo de Cambio :</label>
                        <label style="color: dimgray">${it.tipoMoneda}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Tipo de Documento :</label>
                        <label style="color: dimgray">${it.tipoDocumento}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Pagado A :</label>
                        <label style="color: dimgray">${it.pagadoA}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Monto :</label>
                        <label style="color: dimgray">$ ${it.monto}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Concepto :</label>
                        <label style="color: dimgray">${it.concepto}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Fecha Ingreso :</label>
                        <label style="color: dimgray">${formatDate(format:"dd/MM/yyyy", date: it.fechaCreacion)}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Usuario :</label>
                        <label style="color: dimgray">${it.usuario.nombres} ${it.usuario.paterno} ${it.usuario.materno}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Nº Documento :</label>
                        <label style="color: dimgray">${it.nDocumento}</label>
                    </div>
                </div>
                <g:if test="${it.rendicion != null}">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <label>Rendición :</label>
                            <label style="color: dimgray">Nº ${it.rendicion.id}</label>
                        </div>
                    </div>
                </g:if>
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
                                    <g:submitButton name="name" style="width:100%" value="Ver/Descargar"/>
                                </g:form>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:form resource="${this.egreso}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="volver" action="index">Volver al Listado</g:link>
                    <g:if test="${egreso.aprobacion == "NO"}">
                        <g:link class="aprobar" action="aprobar" resource="${this.egreso}"><g:message code="default.button.aprobar.label" default="Aprobar" /></g:link>
                        <%--<g:link class="desaprobar" resource="${this.egreso}" data-toggle="modal" data-target="#elIDdelModal">Rechazar</g:link>--%>
                        <g:link class="desaprobar"  action="rechazar" resource="${this.egreso}" data-toggle="modal" data-target="#elIDdelModal2">Rechazar</g:link>
                    </g:if>
                    <g:if test="${egreso.aprobacion == "SI" && egreso.rendicion == null}">
                        <g:link class="desaprobar" action="desaprobar" resource="${this.egreso}"><g:message code="default.button.desaprobar.label" default="Desaprobar" /></g:link>
                    </g:if>
                    <g:if test="${egreso.aprobacion == "AUDITADA"}">
                        <g:link class="aprobar" action="aprobar" resource="${this.egreso}"><g:message code="default.button.aprobarAuditoria.label" default="Aprobar Auditoría" /></g:link>
                    </g:if>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
