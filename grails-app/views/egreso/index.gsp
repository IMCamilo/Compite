<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#list-egreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="create-egreso" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form action="save">
                <fieldset class="form">
                    <div class="fieldcontain required">
                    <label for="nombres">Sede Envío
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="sedeEnvio" value="" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Concepto
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="concepto" value="" required="" type="text"></div>

                    <div class="fieldcontain required">
                    <label for="nombres">Monto
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="monto" value="" required="" type="text"></div>
                    <div class="fieldcontain required" id="proyectoinputdiv">
                        <label for="tipo">Proyecto<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreProyecto" type="text" required="" placeholder="Busca un proyecto">
                    </div>
                    <div class="fieldcontain required" id="usuarioinputdiv">
                        <label for="tipo">Usuario<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreUsuario" type="text" required="" placeholder="Busca un usuario">
                    </div>
                    <div class="fieldcontain required">
                    <label for="nombres">Tipo Rendición
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="tipoRendicion" value="" required="" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Aprobación
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="aprobacion" value="" required="" type="text"></div>
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
        <div id="list-egreso" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${egresoList}" />

            <div class="pagination">
                <g:paginate total="${egresoCount ?: 0}" />
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
