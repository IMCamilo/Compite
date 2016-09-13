<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'detalleAudRen.label', default: 'DetalleAudRen')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#list-detalleAudRen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="create-detalleAudRen" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.detalleAudRen}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.detalleAudRen}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <div class="fieldcontain required" id="auditoriainputdiv">
                        <label for="tipo">Auditoria<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreAuditoria" type="text" required="" placeholder="Busca una auditoria">
                    </div>
                    <div class="fieldcontain required" id="rendicioninputdiv">
                        <label for="tipo">Rendicion<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreRendicion" type="text" required="" placeholder="Busca una rendicion">
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Detalle<span class="required-indicator">*</span></label>
                        <textarea  name="detalle" required="" rows="4" cols="50"></textarea>
                    </div>
                    <div class="fieldcontain required">
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden"></div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
        <div id="list-detalleAudRen" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${detalleAudRenList}" />

            <div class="pagination">
                <g:paginate total="${detalleAudRenCount ?: 0}" />
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
                var auditorias = [
                    <g:each in="${auditorias}">
                        '${it.descripcion} , ${it.id}',
                    </g:each>
                ];
                var rendiciones = [
                    <g:each in="${rendiciones}">
                        '${it.nombre} ${it.descripcion} , ${it.id}',
                    </g:each>
                ];
                $('#auditoriainputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'auditorias',
                    source: substringMatcher(auditorias)
                });
                $('#rendicioninputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'rendiciones',
                    source: substringMatcher(rendiciones)
                });
            });
        </script>
    </body>
</html>
