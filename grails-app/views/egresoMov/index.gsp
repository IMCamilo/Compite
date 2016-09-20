<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainingeniero" />
        <g:set var="entityName" value="${message(code: 'egresoMov.label', default: 'EgresoMov')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#list-egresoMov" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="create-egresoMov" class="content scaffold-create" role="main">
            <h1>Asigna una Movilizacion a un Egreso</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.egresoMov}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.egresoMov}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                    <div class="fieldcontain required" id="movilizacioninputdiv">
                        <label for="tipo">Movilizacion<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreMovilizacion" type="text" required="" placeholder="Busca una Movilizacion">
                    </div>
                    <div class="fieldcontain required" id="egresoinputdiv">
                        <label for="tipo">Egreso<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreEgreso" type="text" required="" placeholder="Busca un Egreso">
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
        <div id="list-egresoMov" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>Ver detalles</th>
                        <g:sortableColumn property="creadoPor" defaultOrder="desc" title="Creado por"/>
                        <g:sortableColumn property="fecha" defaultOrder="desc" title="Fecha"/>
                        <g:sortableColumn property="egreso" defaultOrder="desc" title="Egreso"/>
                        <g:sortableColumn property="movilizacion" defaultOrder="desc" title="Movilización"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="egresomov" status="i" in="${egresoMovList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${egresomov.id}">ver</a></td>
                            <td>${egresomov.creadoPor}</td>
                            <td>${egresomov.fecha}</td>
                            <td>${egresomov.egreso}</td>
                            <td>${egresomov.movilizacion}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${egresoMovCount ?: 0}" />
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
                var movilizaciones = [
                    <g:each in="${movilizaciones}">
                        '${it.concepto} ・ ${it.id}',
                    </g:each>
                ];
                var egresos = [
                    <g:each in="${egresos}">
                        '${it.concepto} ・ ${it.id}',
                    </g:each>
                ];
                $('#movilizacioninputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'movilizaciones',
                    source: substringMatcher(movilizaciones)
                });
                $('#egresoinputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'egresos',
                    source: substringMatcher(egresos)
                });
            });
        </script>
    </body>
</html>
