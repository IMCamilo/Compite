<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'transporte.label', default: 'Transporte')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="edit-transporte" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.transporte}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.transporte}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.transporte}" method="PUT">
                <g:hiddenField name="version" value="${this.transporte?.version}" />
                <fieldset class="form">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="usuarioinputdiv">
                                <label>Usuario
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${usuario.nombres} ${usuario.paterno} ・ ${usuario.rut}" class="typeahead" name="nombreUsuario" type="text" required="" placeholder="Busca un usuario">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="tipo">Tipo Vehículo
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="tipo" value="" required="" id="tipo">
                                    <g:if test="${transporte.tipo} == 'SEDAN'">
                                        <option value="SEDAN" selected>Sedán</option>
                                    </g:if>
                                    <g:elseif test="${transporte.tipo} == 'JEEP'">
                                        <option value="JEEP" selected>Jeep</option>
                                    </g:elseif>
                                    <g:elseif test="${transporte.tipo} == 'VAN'">
                                        <option value="VAN" selected>Van</option>
                                    </g:elseif>
                                    <g:elseif test="${transporte.tipo} == 'CAMIONETA'">
                                        <option value="CAMIONETA" selected>Camioneta</option>
                                    </g:elseif>
                                    <g:else>
                                        <option value="4X4" selected>4x4</option>
                                    </g:else>
                                    <option value="${transporte.tipo}">---</option>
                                    <option value="SEDAN">Sedán</option>
                                    <option value="JEEP">Jeep</option>
                                    <option value="VAN">Van</option>
                                    <option value="CAMIONETA">Camioneta</option>
                                    <option value="4X4">4x4</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="descripcion">Descripción
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${transporte.descripcion}" name="descripcion" required="" placeholder="Descripcion del vehiculo Ej: Automovil estandar" maxlength="30" id="descripcion" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="marca">Marca
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${transporte.marca}" name="marca" required="" placeholder="Ej: Toyota" maxlength="10" id="marca" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="kmPorLitro">Kms. Por Litro
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${transporte.kmPorLitro}" name="kmPorLitro" required="" placeholder="Ingrese valor rendimiento en kilometros" maxlength="6" id="kmPorLitro" type="text" onkeypress="return isNumber(event)">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="modelo">Modelo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${transporte.modelo}" name="modelo" required="" placeholder="Ej: Yaris XLS" maxlength="35" id="modelo" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="combustible">Combustible
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="combustible" required="" id="combustible">
                                    <g:if test="${transporte.combustible} == 'BENCINA93'">
                                        <option value="BENCINA93" selected>GAS. 93</option>
                                    </g:if>
                                    <g:elseif test="${transporte.combustible} == 'BENCINA95'">
                                        <option value="BENCINA95" selected>GAS. 95</option>
                                    </g:elseif>
                                    <g:elseif test="${transporte.combustible} == 'BENCINA97'">
                                        <option value="BENCINA97" selected>GAS. 97</option>
                                    </g:elseif>
                                    <g:elseif test="${transporte.combustible} == 'DIESEL'">
                                        <option value="DIESEL" selected>Petróleo</option>
                                    </g:elseif>
                                    <g:else>
                                        <option value="GAS" selected>Gas Licuado</option>
                                    </g:else>
                                    <option value="${transporte.combustible}">---</option>
                                    <option value="BENCINA93">GAS. 93</option>
                                    <option value="BENCINA95">GAS. 95</option>
                                    <option value="BENCINA97">GAS. 97</option>
                                    <option value="DIESEL">Petróleo</option>
                                    <option value="GAS">Gas Licuado</option>
                                </select>
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
                var usuarios = [
                    <g:each in="${usuarios}">
                        '${it.nombres} ${it.paterno} ・ ${it.rut}',
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
            });
        </script>
    </body>
</html>
