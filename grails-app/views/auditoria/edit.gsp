<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'auditoria.label', default: 'Auditoria')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="edit-auditoria" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status"><p>${flash.message}</p></div>
            </g:if>
            <g:hasErrors bean="${this.auditoria}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.auditoria}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.auditoria}" method="PUT">
                <fieldset class="form">
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="nombre">Nombre
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${auditoria.nombre}" id="nombre" name="nombre" value="" required="" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="programainputdiv">
                                <label for="nombrePrograma">Programa
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${programa.codigo} - ${programa.nombre}" id="nombrePrograma" class="typeahead" name="nombrePrograma" type="text" required="" placeholder="Busca un programa">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="estado">Estado
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="estado" value="" required="" id="estado">
                                    <g:if test="${auditoria.estado == "APROBADA"}">
                                        <option value="APROBADA" selected>Aprobada</option>
                                    </g:if>
                                    <g:else>
                                        <option value="RECHAZADA" selected>Rechazada</option>
                                    </g:else>
                                    <option value="${auditoria.estado}">---</option>
                                    <option value="APROBADA">Aprobada</option>
                                    <option value="RECHAZADA">Rechazada</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="motivo">Motivo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${auditoria.motivo}" id="motivo" name="motivo" type="text" required="" placeholder="Motivo de la auditoria">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="descripcion">Descripción
                                    <span class="required-indicator">*</span>
                                </label>
                                <textarea id="descripcion" name="descripcion" required="" rows="4" cols="50" placeholder="Ingrese el resumen de la auditoría realizada">${auditoria.descripcion}</textarea>
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
                            <g:link class="list" action="index">Volver al Listado</g:link>
                        </div>
                    </div>
                </fieldset>
            </g:form>
        </div>
        <div class="content scaffold-edit">
            <h1>Cargar archivos para auditoria ${auditoria.nombre}</h1>
            <g:uploadForm controller="auditoria" action="upload">
                <fieldset class="form">
                    <input type="file" name="archivo" />
                </fieldset>
                <input type="hidden" name="idAuditoria" value="${auditoria.id}">
                <fieldset class="buttons">
                    <input class="save" type="submit" value="Cargar" />
                </fieldset>
            </g:uploadForm>
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
