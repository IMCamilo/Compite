<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'detalleAudRen.label', default: 'DetalleAudRen')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#edit-detalleAudRen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-detalleAudRen" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.detalleAudRen}" method="PUT">
                <g:hiddenField name="version" value="${this.detalleAudRen?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain required" id="auditoriainputdiv">
                        <label for="tipo">Auditoria<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreAuditoria" value="${rendicion.nombre} ${rendicion.motivo} , ${auditoria.id}" type="text" required="" placeholder="Busca una auditoria">
                    </div>
                    <div class="fieldcontain required" id="rendicioninputdiv">
                        <label for="tipo">Rendicion<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreRendicion" value="${rendicion.nombre} ${rendicion.motivo} , ${rendicion.id}" type="text" required="" placeholder="Busca una rendicion">
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Detalle<span class="required-indicator">*</span></label>
                        <textarea  name="detalle" required="" rows="4" cols="50"></textarea>
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
                var auditorias = [
                    <g:each in="${auditorias}">
                        '${it.nombre} ${it.motivo} , ${it.id}',
                    </g:each>
                ];
                var rendiciones = [
                    <g:each in="${rendiciones}">
                        '${it.nombre} ${it.motivo} , ${it.id}',
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
