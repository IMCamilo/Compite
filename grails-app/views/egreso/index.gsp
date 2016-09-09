<meta name="layout" content="administrador" />

<div class="card-panel">
    <div class="col lg 12">
        <table class="table highlight responsive-table">
            <thead class="teal white text">
                <tr>
                    <th>Usuario</th>
                    <th>Aprobación</th>
                    <th>Concepto</th>
                    <th>Fecha Creación</th>
                    <th>Monto</th>
                    <th>Sede Envio</th>
                    <th>Tipo Rendicion</th>
                </tr>
            </thead>
            <tbody class="black-text table-bordered responsive-table">
                <g:each var="egreso" in="${compite.Egreso.list()}" >
                    <tr>
                        <td>${egreso.usuario}</td>
                        <td>${egreso.aprobacion}</td>
                        <td>${egreso.concepto}</td>
                        <td>${egreso.fechaCreacion}</td>
                        <td>${egreso.monto}</td>
                        <td>${egreso.sedeEnvio}</td>
                        <td>${egreso.tipoRendicion}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="button">
            <a href="create">Crear Egreso</a>
        </div>
    </div>
</div>

%{--<!DOCTYPE html>--}%
%{--<html>--}%
    %{--<head>--}%
        %{--<meta name="layout" content="main" />--}%
        %{--<g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />--}%
        %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
    %{--</head>--}%
    %{--<body>--}%
        %{--<a href="#list-egreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
        %{--<div class="nav" role="navigation">--}%
            %{--<ul>--}%
                %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
                %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
            %{--</ul>--}%
        %{--</div>--}%
        %{--<div id="list-egreso" class="content scaffold-list" role="main">--}%
            %{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
            %{--<g:if test="${flash.message}">--}%
                %{--<div class="message" role="status">${flash.message}</div>--}%
            %{--</g:if>--}%
            %{--<f:table collection="${egresoList}" />--}%

            %{--<div class="pagination">--}%
                %{--<g:paginate total="${egresoCount ?: 0}" />--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</body>--}%
%{--</html>--}%