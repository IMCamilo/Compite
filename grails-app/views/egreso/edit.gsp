<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#edit-egreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-egreso" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.egreso}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.egreso}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.egreso}" method="PUT">
                <g:hiddenField name="version" value="${this.egreso?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain required">
                    <label for="nombres">Sede Envío
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="sedeEnvio" value="${egreso.sedeEnvio}" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Concepto
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="concepto" value="${egreso.concepto}" required="" type="text"></div>

                    <div class="fieldcontain required">
                    <label for="nombres">Monto
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="monto" value="${egreso.monto}" required="" type="text"></div>
                    <div class="fieldcontain required" id="proyectoinputdiv">
                        <label for="tipo">Proyecto<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreProyecto" value="${proyecto.codigo} , ${proyecto.nombre}" type="text" required="" placeholder="Busca un proyecto">
                    </div>
                    <div class="fieldcontain required" id="usuarioinputdiv">
                        <label for="tipo">Usuario<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreUsuario" value="${usuario.nombres} ${usuario.paterno} , ${usuario.rut}" type="text" required="" placeholder="Busca un usuario">
                    </div>
                    <div class="fieldcontain required">
                    <label for="nombres">Tipo Rendición
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="tipoRendicion" value="${egreso.tipoRendicion}" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Aprobación
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="aprobacion" value="${egreso.aprobacion}" required="" type="text"></div>
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
                        '${it.nombres} ${it.paterno} , ${it.rut}',
                    </g:each>
                ];
                var proyectos = [
                    <g:each in="${proyectos}">
                        '${it.codigo} , ${it.nombre}',
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
