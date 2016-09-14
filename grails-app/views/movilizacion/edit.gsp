<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'movilizacion.label', default: 'Movilizacion')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#edit-movilizacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-movilizacion" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.movilizacion}" method="PUT">
                <g:hiddenField name="version" value="${this.movilizacion?.version}" />
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='tipo'>Tipo
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="tipo" value="" required="" id="tipo" />
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
                    <div class="fieldcontain required" id="proyectoinputdiv">
                        <label for="tipo">Proyecto<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreProyecto" value="${proyecto.nombre} ・ ${proyecto.codigo}" type="text" required="" placeholder="Busca un proyecto">
                    </div>
                    <div class="fieldcontain required" id="usuarioinputdiv">
                        <label for="tipo">Usuario<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreUsuario" value="${usuario.nombres} ${usuario.paterno} ・ ${usuario.rut}" type="text" required="" placeholder="Busca un usuario">
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
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
