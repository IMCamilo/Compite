<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'auditoria.label', default: 'Auditoria')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="create-auditoria" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.auditoria}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.auditoria}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:uploadForm action="save">
                <fieldset class="form">
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                    <input name="estado" value="RECHAZADA" required="" type="hidden">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="nombre">Nombre
                                    <span class="required-indicator">*</span>
                                </label>
                                <input id="nombre" name="nombre" value="" required="" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="programainputdiv">
                                <label for="nombrePrograma">Programa
                                    <span class="required-indicator">*</span>
                                </label>
                                <input id="nombrePrograma" class="typeahead" name="nombrePrograma" type="text" required="" placeholder="Busca un programa">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <%--<div class="col-sm-6">
                            <div class="fieldcontain required" id="usuarioinputdiv">
                                <label for="nombreUsuario">Usuario
                                    <span class="required-indicator">*</span>
                                </label>
                                <input id="nombreUsuario" class="typeahead" name="nombreUsuario" type="text" required="" placeholder="Busca un usuario">
                            </div>
                        </div>--%>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="motivo">Motivo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input id="motivo" name="motivo" type="text" required="" placeholder="Motivo de la auditoria">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="descripcion">Descripción
                                    <span class="required-indicator">*</span>
                                </label>
                                <textarea id="descripcion" name="descripcion" required="" rows="4" cols="50" placeholder="Ingrese el resumen de la auditoría realizada"></textarea>
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
            </g:uploadForm>
        </div>
        <div id="list-auditoria" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>Detalles</th>
                        <g:sortableColumn property="nombre" defaultOrder="desc" title="Nombre"/>
                        <g:sortableColumn property="motivo" defaultOrder="desc" title="Motivo"/>
                        <g:sortableColumn property="estado" defaultOrder="desc" title="Estado"/>
                        <g:sortableColumn property="fechaCreacion" defaultOrder="desc" title="Fecha Creacion"/>
                        <g:sortableColumn property="descripcion" defaultOrder="desc" title="Descripcion"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="auditoria" status="i" in="${auditoriaList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${auditoria.id}">Ver</a></td>
                            <td>${auditoria.nombre}</td>
                            <td>${auditoria.motivo}</td>
                            <td>${auditoria.estado}</td>
                            <td>${formatDate(format:"yyyy/MM/dd", date: auditoria.fechaCreacion)}</td>
                            <td>${auditoria.descripcion}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${auditoriaCount ?: 0}" />
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
                var programas = [
                    <g:each in="${programas}">
                        '${it.codigo} - ${it.nombre}',
                    </g:each>
                ];
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
