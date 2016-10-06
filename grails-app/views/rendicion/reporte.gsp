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

<div id="show-rendicion" class="content scaffold-show" role="main">
|   <h1>Ver Rendición</h1>
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
                <label>Programa :</label>
                <label style="color: dimgray">${it.programa.nombre}</label>
            </div>
            <div class="col-sm-6">
                <label>Pagado A:</label>
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
                    <g:elseif test="${it.estado == "RECHAZADA"}">Rechazada (por Santiago)</g:elseif>
                    <g:elseif test="${it.estado == "TRANSFERENCIA_OK"}">Transferencia de fondos realizada</g:elseif>
                    <g:elseif test="${it.estado == "FINALIZADA"}">Finalizada</g:elseif>
                    <g:elseif test="${it.estado == "NO_APROBADA"}">No aprobada</g:elseif>
                </label>
            </div>
        </div>



            <table>
                <thead>
                <tr>
                    <td>N°</td>
                    <td>Fecha</td>
                    <td>Item</td>
                    <td>Monto</td>
                    <td>N° Documento</td>
                    <td>Tipo doc</td>
                    <td>Rut empresa</td>
                    <td>Pagado A</td>
                    <td>Centro costo</td>
                    <td>Proyecto</td>
                    <td>Concepto</td>
                </tr>
                </thead>
                <tbody>
                <g:each var="egreso" status="i" in="${listaEgresos}">
                    <tr>
                        <td>${egreso.id}</td>
                        <td>${formatDate(format:"dd/MM/yyyy", date: egreso.fechaCreacion)}</td>
                        <td>${egreso.item.nombre}</td>
                        <td>${egreso.monto}</td>
                        <td>${egreso.nDocumento}</td>
                        <td>${egreso.tipoDocumento}</td>
                        <td>${egreso.rutEmpresa}</td>
                        <td>${egreso.pagadoA}</td>
                        <td>${egreso.programa.centroCosto}</td>
                        <td>${egreso.proyecto.nombre}</td>
                        <td>${egreso.concepto}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <div class="col-md-12">
            <div class="col-sm-8">
            </div>
            <div class="col-sm-4">
                <label>Total Rendido :</label>
                <label style="color: dimgray">${it.totalRendido}</label>
            </div>
            <div class="col-sm-8">
            </div>
            <div class="col-sm-4">
                <label>Total Anticipado :</label>
                <label style="color: dimgray">${it.totalAnticipado}</label>
            </div>
            <div class="col-sm-8">
            </div>
            <div class="col-sm-4">
                <label>Total:</label>
                <label style="color: dimgray">${it.total}</label>
            </div>
            <div class="col-sm-8">
            </div>
            <div class="col-sm-4">
                <input type="button" value="Imprimir" onclick="javascript:window.print()" />
            </div>
        </div>
    </g:each>
</body>
</html>
