<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'auditoria.label', default: 'Auditoria')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-auditoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-auditoria" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--  Proyecto Usuario  Creado Por  Descripcion  Estado  Motivo  Fecha Creacion  Nombre  -->

            <p>Nombre : ${auditoria.nombre}</p>
            <p>Proyecto : ${auditoria.proyectoId}</p>
            <p>Usuario : ${auditoria.usuarioId}</p>
            <p>Creado Por : ${auditoria.creadoPor}</p>
            <p>Descripción : ${auditoria.descripcion}</p>
            <p>Estado : ${auditoria.estado}</p>
            <p>Motivo : ${auditoria.motivo}</p>
            <p>Fecha de Auditoria : ${auditoria.fechaCreacion}</p>
            <p>Archivos</p>
            <g:each var="archivo" in="${archivos}">
                <p style='text-indent: 3em'>Fecha : ${formatDate(format:"dd/MM/yyyy", date: archivos.date)}</p>
                <p style='text-indent: 3em'>Nombre : ${archivos.nombre}</p>
            </g:each>
            <g:form resource="${this.auditoria}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.auditoria}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
