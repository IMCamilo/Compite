<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'rendicion.label', default: 'Rendicion')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <style>
            #mdialTamanio, #mdialTamanio2 {
                width: 95%;
            }
        </style>
    </head>
    <body>
        <div class="modal fade" id="elIDdelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" id="mdialTamanio">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Egresos de la Rendición</h4>
                    </div>
                    <div class="modal-body">
                        <table>
                            <thead>
                            <tr>
                                <g:sortableColumn property="fechaCreacion" defaultOrder="desc" title="Fecha Creación"/>
                                <g:sortableColumn property="item" defaultOrder="desc" title="Item"/>
                                <g:sortableColumn property="monto" defaultOrder="desc" title="Monto"/>
                                <g:sortableColumn property="nDocumento" defaultOrder="desc" title="N° Documento"/>
                                <g:sortableColumn property="tipoDocumento" defaultOrder="desc" title="Tipo de Documento"/>
                                <g:sortableColumn property="rutEmpresa" defaultOrder="desc" title="Rut Empresa"/>
                                <g:sortableColumn property="pagadoA" defaultOrder="desc" title="Pagado A"/>
                                <g:sortableColumn property="programa" defaultOrder="desc" title="Programa"/>
                                <g:sortableColumn property="proyecto" defaultOrder="desc" title="Proyecto"/>
                                <g:sortableColumn property="concepto" defaultOrder="desc" title="Concepto"/>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each var="egreso" status="i" in="${listaEgresos}">
                                <tr>
                                    <td>${formatDate(format:"dd/MM/yyyy", date: egreso.fechaCreacion)}</td>
                                    <td>${egreso.item.nombre}</td>
                                    <td>${egreso.monto}</td>
                                    <td>${egreso.nDocumento}</td>
                                    <td>${egreso.tipoDocumento}</td>
                                    <td>${egreso.rutEmpresa}</td>
                                    <td>${egreso.pagadoA}</td>
                                    <td>${egreso.programa.nombre}</td>
                                    <td>${egreso.proyecto.nombre}</td>
                                    <td>${egreso.concepto}</td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="elIDdelModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" id="mdialTamanio2">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel2">Egresos de la Rendición</h4>
                    </div>
                    <g:form controller="rendicion" action="rechazarEgresosRendicion">
                    <div class="modal-body">
                        <input type="hidden" name="rendicion" value="${params.id}" id="idRendicion">
                        <div class="row">
                            <div class="fieldcontain required">
                                <label for="observacion">Motivo de rechazo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input type="textarea" name="observacionin" id="observacion" required="" maxlength="200" placeholder="Escriba motivo del rechazo (maximo 200 caracteres)">
                            </div>
                        </div>
                        <div style="margin: 1em"></div>

                        <table>
                            <thead>
                            <tr>
                                <g:sortableColumn property="fechaCreacion" defaultOrder="desc" title="Fecha Creación"/>
                                <g:sortableColumn property="item" defaultOrder="desc" title="Item"/>
                                <g:sortableColumn property="monto" defaultOrder="desc" title="Monto"/>
                                <g:sortableColumn property="nDocumento" defaultOrder="desc" title="N° Documento"/>
                                <g:sortableColumn property="tipoDocumento" defaultOrder="desc" title="Tipo de Documento"/>
                                <g:sortableColumn property="concepto" defaultOrder="desc" title="Concepto"/>
                                <th>Observación</th>
                                <th>Rechazar</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each var="egreso" status="i" in="${listaEgresos}">
                                <tr>
                                    <td>${formatDate(format:"dd/MM/yyyy", date: egreso.fechaCreacion)}</td>
                                    <td>${egreso.item.nombre}</td>
                                    <td>${egreso.monto}</td>
                                    <td>${egreso.nDocumento}</td>
                                    <td>${egreso.tipoDocumento}</td>
                                    <td>${egreso.concepto}</td>
                                    <td><input type="text" name="observacion" placeholder="Digite la Observación" style="width: 100%"> </td>

                                    <td><g:checkBox name="in" value="${egreso.id}" /></td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                        <g:submitButton name="Rechazar" event="noaprobada" class="update">Rechazar</g:submitButton>
                    </div>
                    </g:form>
                <div style="margin: 1em"></div>
                </div>
            </div>
        </div>
        <div id="show-rendicion" class="content scaffold-show" role="main">
            <h1>Ver Rendición</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:each in="${rendicion}">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Nº Rendición :</label>
                        <label style="color: dimgray">${it.id}</label>
                    </div>
                    <div class="col-sm-6">
                        <g:link controller="rendicion" action="reporte" id="${params.id}"> Generar Reporte</g:link>
                    </div>

                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Total Anticipado :</label>
                        <label style="color: dimgray">${it.totalAnticipado}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Total Rendido :</label>
                        <label style="color: dimgray">${it.totalRendido}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Total :</label>
                        <label style="color: dimgray">${it.total}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Programa :</label>
                        <label style="color: dimgray">${it.programa.nombre}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Usuario :</label>
                        <label style="color: dimgray">${it.usuario.nombres} ${it.usuario.paterno} ${it.usuario.materno}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Fecha Ingreso :</label>
                        <label style="color: dimgray">${formatDate(format:"dd/MM/yyyy", date: it.fecha)}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Creado Por :</label>
                        <label style="color: dimgray">${it.creadoPor}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Egreso/s :</label>
                        <g:if test="${it.egreso.isEmpty()}">
                            <label style="color: dimgray">
                                Sin Egresos
                            </label>
                        </g:if>
                        <g:else>
                            <a type="button" class="save" data-toggle="modal" data-target="#elIDdelModal">Ver Egresos</a>
                        </g:else>
                    </div>
                    <div class="col-sm-6">
                        <label>Sede Envío :</label>
                        <label style="color: dimgray">${it.sedeEnvio}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Tipo de Rendición :</label>
                        <label style="color: dimgray">${it.tipoRendicion}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Estado :</label>
                        <label style="color: dimgray">
                            <g:if test="${it.estado == "APROBADA"}">Aprobada</g:if>
                            <g:elseif test="${it.estado == "ENVIADA_POR_VALIJA"}">Enviada por Valija</g:elseif>
                            <g:elseif test="${it.estado == "RECEPCIONADA_SANTIAGO"}">Recepcionada en Santiago (valija)</g:elseif>
                            <g:elseif test="${it.estado == "APROBADA_FIRMADA_SANTIAGO"}">Aprobada y firmada</g:elseif>
                            <g:elseif test="${it.estado == "RECHAZADA"}"><div style="color:red">Rechazada (por Santiago)</div></g:elseif>
                            <g:elseif test="${it.estado == "TRANSFERENCIA_OK"}">Transferencia de fondos realizada</g:elseif>
                            <g:elseif test="${it.estado == "FINALIZADA"}"><div style="color:green">Finalizada</div></g:elseif>
                            <g:elseif test="${it.estado == "NO_APROBADA"}">No aprobada</g:elseif>
                        </label>
                    </div>
                </div>
                <%--<div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Detalle Aud Ren :</label>
                        <label style="color: dimgray">${it.detalleAudRen}</label>
                    </div>
                </div>--%>
            </g:each>
            <g:form resource="${this.rendicion}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="volver" action="index">Volver al Listado</g:link>
                    <g:if test="${rendicion.estado == "NO_APROBADA"}">
                        <g:link action="aprobar" resource="${this.rendicion}"><g:message code="default.button.aprobar.label" default="Aprobar" /></g:link>
                    </g:if>
                    <g:elseif test="${rendicion.estado == "APROBADA"}">
                        <g:link action="enviadaPorValija" resource="${this.rendicion}">Estado a: Enviada por Valija</g:link>
                    </g:elseif>
                    <g:elseif test="${rendicion.estado == "ENVIADA_POR_VALIJA"}">
                        <g:link action="recepcionadaSantiago" resource="${this.rendicion}">Estado a: Recepcionada en Santiago</g:link>
                    </g:elseif>
                    <g:elseif test="${rendicion.estado == "RECEPCIONADA_SANTIAGO"}">
                        <g:link action="aprobadaFirmada" resource="${this.rendicion}">Estado a: Aprobada y firmada en Santiago</g:link>
                        <g:link action="rechazar" resource="${this.rendicion}" data-toggle="modal" data-target="#elIDdelModal2">Rechazar Rendición</g:link>
                    </g:elseif>
                    <g:elseif test="${rendicion.estado == "APROBADA_FIRMADA_SANTIAGO"}">
                        <g:link action="transferencia" resource="${this.rendicion}">Estado a: Transferencia de fondos Realizada</g:link>
                    </g:elseif>
                    <g:elseif test="${rendicion.estado == "TRANSFERENCIA_OK"}">
                        <g:link action="finalizada" resource="${this.rendicion}">Estado a: Rendición finalizada</g:link>
                    </g:elseif>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
