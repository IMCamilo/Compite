<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'auditoria.label', default: 'Auditoria')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#list-auditoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
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
            <g:form action="save">
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label>Nombre<span class="required-indicator">*</span></label>
                        <input name="nombre" value="" required="" type="text">
                    </div>
                    <div class="fieldcontain required" id="proyectoinputdiv">
                        <label>Proyecto<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreProyecto" type="text" required="" placeholder="Busca un proyecto">
                    </div>
                    <div class="fieldcontain required" id="usuarioinputdiv">
                        <label>Usuario<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreUsuario" type="text" required="" placeholder="Busca un usuario">
                    </div>
                    <div class="fieldcontain required">
                        <label>Archivo de auditoría<span class="required-indicator">*</span></label>
                        <input name="motivo" value="" required="" type="text" placeholder="Aqui es necesario cargar un archivo">
                    </div>
                    <div class="fieldcontain required">
                        <label>Descripción<span class="required-indicator">*</span></label>
                        <textarea  name="descripcion" required="" rows="4" cols="50" placeholder="Ingrese el resumen de la auditoría realizada"></textarea>
                    </div>
                    <div class="fieldcontain required">
                        <label for="estado">Estado
                            <span class="required-indicator">*</span>
                        </label>
                        <select name="estado" value="" required="" id="estado">
                            <option value="" disabled selected>Seleccione Estado</option>
                            <option value="APROBADA">Aprobada</option>
                            <option value="RECHAZADA">Rechazada</option>
                        </select>
                    </div>
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
        <div id="list-auditoria" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>ver</th>
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
                            <td><a href="show/${auditoria.id}">ver</a></td>
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
                var usuarios = [
                    <g:each in="${usuarios}">
                        '${it.nombres} ${it.paterno} ・ ${it.rut}',
                    </g:each>
                ];
                var proyectos = [
                    <g:each in="${proyectos}">
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
                $('#proyectoinputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'proyectos',
                    source: substringMatcher(proyectos)
                });
            });
        </script>
    </body>
</html>
