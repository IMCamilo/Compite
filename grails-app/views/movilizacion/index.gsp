<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'movilizacion.label', default: 'Movilizacion')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#list-movilizacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="create-movilizacion" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.movilizacion}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.movilizacion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <div class="fieldcontain required" id="proyectoinputdiv">
                        <label for="tipo">Proyecto<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreProyecto" type="text" required="" placeholder="Busca un proyecto">
                    </div>
                    <div class='fieldcontain required'>
                        <label for='motivoEmpresa'>Fecha Documento
                            <span class='required-indicator'>*</span>
                        </label><input type="date" name="motivoEmpresa" value="" required="" id="fecha" />
                    </div>
                    <div class='fieldcontain required'>
                        <label for='motivoEmpresa'>Item de movilización
                            <span class='required-indicator'>*</span>
                        </label>
                        <select name="tipo" class="fieldcontain required">
                            <option value="combustible">Combustible</option>
                            <option value="peaje">Peaje</option>
                            <option value="tag">Tag</option>
                            <option value="estacionamiento">Estacionamiento</option>
                        </select>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='motivoEmpresa'>Motivo Empresa
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="motivoEmpresa" value="" required="" id="motivoEmpresa" />
                    </div>
                    <div class='fieldcontain required'>
                        <label for='distancia'>Distancia
                            <span class='required-indicator'>*</span>
                        </label><input type="number" name="distancia" value="" required="" id="distancia" />
                    </div>
                    <div class='fieldcontain required'>
                        <label for='direccion'>Direccion
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="direccion" value="" required="" id="direccion" />
                    </div>
                    <div class='fieldcontain required'>
                        <label for='concepto'>Concepto
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="concepto" value="" required="" id="concepto" />
                    </div>
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
        <div id="list-movilizacion" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${movilizacionList}" />

            <div class="pagination">
                <g:paginate total="${movilizacionCount ?: 0}" />
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
                var usuarios = [
                    <g:each in="${usuarios}">
                        '${it.nombres} ${it.paterno} ・ ${it.rut}',
                    </g:each>
                ];
                var proyectos = [
                    <g:each in="${proyectos}">
                        '${it.nombre} ・ ${it.codigo}',
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
