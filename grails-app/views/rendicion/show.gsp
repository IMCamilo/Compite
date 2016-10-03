<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'rendicion.label', default: 'Rendicion')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
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
                        <label style="color: dimgray">
                            ${it.egreso.id}
                        </label>
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
                            <g:elseif test="${it.estado == "TRANSFERENCIA_OK"}">Transferencia de fondos realizada</g:elseif>
                            <g:elseif test="${it.estado == "FINALIZADA"}">Finalizada</g:elseif>
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
                    <g:link class="list" action="index">Volver al Listado</g:link>
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
                    </g:elseif>
                    <g:elseif test="${rendicion.estado == "APROBADA_FIRMADA_SANTIAGO"}">
                        <g:link action="transferencia" resource="${this.rendicion}">Estado a: Transferencia de fondos Realizada</g:link>
                    </g:elseif>
                    <g:elseif test="${rendicion.estado == "TRANSFERENCIA_OK"}">
                        <g:link action="finalizada" resource="${this.rendicion}">Estado a: Rendición finalizada</g:link>
                    </g:elseif>
                    <g:link class="edit" action="edit" resource="${this.rendicion}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
