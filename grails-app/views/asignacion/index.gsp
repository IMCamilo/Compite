<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'asignacion.label', default: 'Asignacion')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="create-asignacion" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:hasErrors bean="${this.asignacion}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.asignacion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="proyectoinputdiv">
                                <label for="nombrePrograma">Programa
                                    <span class="required-indicator">*</span>
                                </label>
                                <input id="nombrePrograma" class="typeahead" name="nombrePrograma" type="text" required="" placeholder="Busca un proyecto">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="usuarioinputdiv">
                                <label for="nombreUsuario">Usuario
                                    <span class="required-indicator">*</span>
                                </label>
                                <input id="nombreUsuario" class="typeahead" name="nombreUsuario" type="text" required="" placeholder="Busca un usuario">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="detalle">Detalle
                                    <span class="required-indicator">*</span>
                                </label>
                                <textarea id="detalle" name="detalle" required="" rows="4" cols="50" placeholder="Ingrese motivo de asignacion"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <br>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-1">
                        </div>
                        <div class="col-sm-6">
                            <g:submitButton name="create" class="save btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </div>
                    </div>
                </fieldset>
            </g:form>
        </div>
        <div id="list-asignacion" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>ver</th>
                        <g:sortableColumn property="id" defaultOrder="desc" title="Codigo"/>
                        <g:sortableColumn property="creadoPor" defaultOrder="desc" title="Creado por"/>
                        <g:sortableColumn property="detalle" defaultOrder="desc" title="Detalle"/>
                        <g:sortableColumn property="fechaCreacion" defaultOrder="desc" title="Fecha Creacion"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="asignacion" status="i" in="${asignacionList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="edit/${asignacion.id}">ver</a></td>
                            <td>${asignacion.id}</td>
                            <td>${asignacion.creadoPor}</td>
                            <td>${asignacion.detalle}</td>
                            <td>${formatDate(format:"yyyy/MM/dd HH:mm:ss", date: asignacion.fechaCreacion)}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${asignacionCount ?: 0}" />
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
                        '${it.nombres} ${it.paterno} - ${it.rut}',
                    </g:each>
                ];
                var programas = [
                    <g:each in="${programas}">
                        '${it.nombre} ${it.codigo} - ${it.id}',
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
                $('#proyectoinputdiv .typeahead').typeahead({
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
