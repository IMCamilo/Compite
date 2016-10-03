<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="edit-proyecto" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.proyecto}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.proyecto}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.proyecto}" method="PUT">
                <g:hiddenField name="version" value="${this.proyecto?.version}" />
                <fieldset class="form">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="nombre">Nombre
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="nombre" value="${proyecto.nombre}" required="" id="nombre" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="codigo">Código
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="codigo" value="${proyecto.codigo}" required="" id="codigo" type="text" minlength="5" maxlength="15" placeholder="Ej: PR-00">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="tipo">Programa
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="tipo" value="" required="" id="tipo">
                                    <option value="${proyecto.programa}">${proyecto.programa.nombre}</option>
                                    <option value="${proyecto.programa}">---</option>
                                    <g:each var="programa" status="i" in="${programas}">
                                        <option value="${programa.id}">${programa.nombre}</option>
                                    </g:each>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="empresainputdiv">
                                <label for="tipo">Empresa<span class="required-indicator">*</span></label>
                                <input class="typeahead" name="nombreEmpresa" value="${empresa.nombre} ${empresa.rut} - ${empresa.id}" type="text" required="" placeholder="Busca una empresa">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <br>
                    </div>
                    <div class="col-md-10">
                        <div class="col-sm-3">
                            <input class="save btn btn-info" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </div>
                    </div>
                    <div class="col-md-12">
                        <br>
                    </div>
                    <div class="col-md-10">
                        <div class="col-sm-3">
                            <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
                        </div>
                    </div>
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
                var empresas = [
                    <g:each in="${empresas}">
                        '${it.nombre} ${it.rut} - ${it.id}',
                    </g:each>
                ];
                $('#empresainputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'empresas',
                    source: substringMatcher(empresas)
                });
            });
        </script>
        <script>
            /*funcion que permite el ingreso de solo letras*/
            function soloLetras(e) {
                tecla = (document.all) ? e.keyCode : e.which;
                if (tecla==8) return true;
                patron =/[A-Za-z]/;
                te = String.fromCharCode(tecla);
                return patron.test(te);
            }

            /*funcion que permite el ingreso de solo numeros*/
            function soloNumeros (e){
                tecla = (document.all) ? e.keyCode : e.which;
                if (tecla==8){
                    return true;
                }
                patron =/[0-9]/;
                tecla_final = String.fromCharCode(tecla);
                return patron.test(tecla_final);
            }
        </script>
    </body>
</html>
