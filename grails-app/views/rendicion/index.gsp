<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'rendicion.label', default: 'Rendicion')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="create-rendicion" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.rendicion}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.rendicion}" var="error"><li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='tipo'>Tipo
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="tipo" value="" required="" id="tipo"/>
                    </div>
                    <div class="fieldcontain required" id="programainputdiv">
                        <label for="tipo">Programa<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombrePrograma" type="text" required="" placeholder="Busca un programa">
                    </div>
                    <div class="fieldcontain required" id="usuarioinputdiv">
                        <label for="tipo">Usuario<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreUsuario" type="text" required="" placeholder="Busca un usuario">
                    </div>
                    <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                </fieldset>
            </g:form>
        </div>
        <div id="list-rendicion" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>Ver detalles</th>
                        <g:sortableColumn property="tipoRendicion" defaultOrder="desc" title="Tipo Rendicion"/>
                        <g:sortableColumn property="sedeEnvio" defaultOrder="desc" title="Sede de Envío"/>
                        <g:sortableColumn property="total" defaultOrder="desc" title="Total"/>
                        <g:sortableColumn property="totalAnticipado" defaultOrder="desc" title="Total Anticipado"/>
                        <g:sortableColumn property="totalRendido" defaultOrder="desc" title="Total Rendido"/>
                        <g:sortableColumn property="aprobacion" defaultOrder="desc" title="Aprobación"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="rendicion" status="i" in="${rendicionList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${rendicion.id}">ver</a></td>
                            <td>${rendicion.tipoRendicion}</td>
                            <td>${rendicion.sedeEnvio}</td>
                            <td>$ ${rendicion.total}</td>
                            <td>$ ${rendicion.totalAnticipado}</td>
                            <td>$ ${rendicion.totalRendido}</td>
                            <td>${rendicion.aprobacion}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${rendicionCount ?: 0}" />
            </div>
        </div>
        <asset:javascript src="compite/jquery-2.1.1.min.js"/>
        <asset:javascript src="compite/typeahead.bundle.js"/>
        <script>
            $(document).ready(function() {
                var substringMatcher = function(strs) {
                    return function findMatches(q, cb) {
                        var matches, substringRegex;
                        // an array that will be populated with substring matches
                        matches = [];
                        // regex used to determine if a string contains the substring `q`
                        substrRegex = new RegExp(q, 'i');
                        // iterate through the pool of strings and for any string that
                        // contains the substring `q`, add it to the `matches` array
                        $.each(strs, function(i, str) {
                            if (substrRegex.test(str)) {
                                matches.push(str);
                            }
                        });
                        cb(matches);
                    };
                };
                var usuarios = [
                    <g:each in="${usuarios}">
                        '${it.nombres} ${it.paterno} ・ ${it.rut}',
                    </g:each>
                ];
                var programas = [
                    <g:each in="${programas}">
                        '${it.codigo} ・ ${it.nombre}',
                    </g:each>
                ];
                $('#usuarioinputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'usuarios',
                    source: substringMatcher(usuarios)
                });
                $('#programainputdiv .typeahead').typeahead({
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
