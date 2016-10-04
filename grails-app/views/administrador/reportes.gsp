<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'reportes.label', default: 'Reportes')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="create-reportes" class="content scaffold-create" role="main">
            <h1>Reportes</h1>
            <g:hasErrors bean="${this.reportes}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.reportes}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                            <g:message error="${error}" />
                        </li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="reportes">
                <fieldset class="form">
                    <div class="col-md-12">
                        <div class="col-sm-4">
                            <div class="fieldcontain" id="rendicionesinput">
                                <input style="width:500px" class="typeahead form-control" name="nombreRendicion"
                                type="text" placeholder="Busca una rendición" value="${params.nombreRendicion?:""}">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="fieldcontain" id="programasinput">
                                <input style="width:500px" class="typeahead form-control" name="nombrePrograma"
                                type="text" placeholder="Busca un programa" value="${params.nombrePrograma?:""}">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="fieldcontain">
                                <g:submitButton style="width:500px" name="create" class="save btn btn-info" value="Buscar" />
                            </div>
                        </div>
                    </div>
                </fieldset>
            </g:form>
            <div id="list-reportes" class="content scaffold-list" role="main" style="width:100%; padding-top: 50px; padding: 0px 0px 0px 0px;">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <table>
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Aprobación</th>
                            <th>Creado Por</th>
                            <th>Fecha</th>
                            <th>Sede</th>
                            <th>Tipo Rendición</th>
                            <th>Programa</th>
                            <th>Total</th>
                            <th>Total Anticipado</th>
                            <th>Total Rendido</th>
                            <th>Usuario Id</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="reporte" status="i" in="${listaReportes}">
                             <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                                <td>${reporte.id}</td>
                                <td>${reporte.estado}</td>
                                <td>${reporte.creadoPor}</td>
                                <td>${reporte.fecha}</td>
                                <!--<td><prettytime:display date="${reporte.fecha}"/></td>-->
                                <td>${reporte.sedeEnvio}</td>
                                <td>${reporte.tipoRendicion}</td>
                                <td>
                                    <g:if test="${reporte.programaId == 1}">
                                         Compite +1000
                                    </g:if>
                                    <g:elseif test="${reporte.programaId == 2}">
                                        Compite Innova
                                    </g:elseif>
                                    <g:else>
                                        Consultoría
                                    </g:else>
                                </td>
                                <td>${reporte.total}</td>
                                <td>${reporte.totalAnticipado}</td>
                                <td>${reporte.totalRendido}</td>
                                <td>${reporte.usuarioId}</td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </div>
        <asset:javascript src="compite/jquery-2.1.1.min.js"/>
        <asset:javascript src="compite/typeahead.bundle.js"/>
        <script>
            $(document).ready(function() {
                var substringMatcher = function(strs) {
                    return function findMatches(q, cb) {
                        var matches, substringRegex;
                        matches = [];
                        substrRegex = new RegExp(q, 'i');
                        $.each(strs, function(i, str) {
                            if (substrRegex.test(str)) {
                                matches.push(str);
                            }
                        });
                        cb(matches);
                    };
                };
                var rendiciones = [
                    <g:each in="${rendiciones}">
                        '${it.tipoRendicion} ・ ${it.id}',
                    </g:each>
                ];
                var programas = [
                    <g:each in="${programas}">
                        '${it.nombre} ・ ${it.id}',
                    </g:each>
                ];
                $('#rendicionesinput .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'rendiciones',
                    source: substringMatcher(rendiciones)
                });
                $('#programasinput .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'programas',
                    source: substringMatcher(programas)
                });
            });
        </script>
    </body>
</html>
