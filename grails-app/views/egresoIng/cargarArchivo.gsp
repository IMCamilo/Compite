<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainingeniero" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div class="content scaffold-edit">
            <h1>Cargar archivos para Egreso nº ${egreso.id}</h1>
            <g:uploadForm controller="egreso" action="upload">
                <fieldset class="form">
                    <input type="file" name="archivo" />
                </fieldset>
                <input type="hidden" name="idEgreso" value="${egreso.id}">
                <fieldset class="buttons">
                    <g:link class="volver" action="show" id="${egreso.id}">Volver</g:link>
                    <input class="save" type="submit" value="Cargar" />
                </fieldset>
            </g:uploadForm>
        </div>
        <asset:javascript src="compite/jquery-2.1.1.min.js"/>
        <asset:javascript src="compite/validarut.js"/>
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
                var items = [
                    <g:each in="${items}">
                    '${it.codigo} ${it.nombre} - ${it.id}',
                    </g:each>
                ];
                $('#iteminputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'items',
                    source: substringMatcher(items)
                });
            });
        </script>
    </body>
</html>
