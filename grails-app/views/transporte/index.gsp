<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'transporte.label', default: 'Transporte')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="create-transporte" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form action="save">
                <fieldset class="form">
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="usuarioinputdiv">
                                <label>Usuario
                                    <span class="required-indicator">*</span>
                                </label>
                                <input class="typeahead" name="nombreUsuario" type="text" required="" placeholder="Busca un usuario">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="tipo">Tipo Vehículo
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="tipo" value="" required="" id="tipo">
                                    <option value="" disabled selected>Seleccione Tipo</option>
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
                                <input name="descripcion" required="" placeholder="Descripcion del vehiculo Ej: Automovil estandar" maxlength="30" id="descripcion" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="marca">Marca
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="marca" required="" placeholder="Ej: Toyota" maxlength="10" id="marca" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="kmPorLitro">Kms. Por Litro
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="kmPorLitro" required="" placeholder="Ingrese valor rendimiento en kilometros" maxlength="6" id="kmPorLitro" type="text" onkeypress="return isNumber(event)">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="modelo">Modelo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="modelo" required="" placeholder="Ej: Yaris XLS" maxlength="35" id="modelo" type="text">
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
                                    <option value="" disabled selected>Seleccione Combustible</option>
                                    <option value="BENCINA93">GAS. 93</option>
                                    <option value="BENCINA95">GAS. 95</option>
                                    <option value="BENCINA97">GAS. 97</option>
                                    <option value="DIESEL">Petróleo</option>
                                    <option value="GAS">Gas Licuado</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="modelo">Patente
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="patente" required="" placeholder="Ej: xx-xx-12" minlength="8" maxlength="8" id="patente" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <br>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-1">
                        </div>
                        <div class="col-sm-6">
                            <g:submitButton name="create" class="save btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </div>
                    </div>
                </fieldset>
            </g:form>
        </div>

        <div id="list-transporte" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>ver</th>
                        <g:sortableColumn property="patente" defaultOrder="desc" title="Patente"/>
                        <g:sortableColumn property="tipo" defaultOrder="desc" title="Tipo"/>
                        <g:sortableColumn property="marca" defaultOrder="desc" title="Marca"/>
                        <g:sortableColumn property="modelo" defaultOrder="desc" title="Modelo"/>
                        <g:sortableColumn property="combustible" defaultOrder="desc" title="Combustible"/>
                        <g:sortableColumn property="kmPorLitro" defaultOrder="desc" title="Km Por Litro"/>
                        <g:sortableColumn property="descripcion" defaultOrder="desc" title="Descripcion"/>
                        <th>Asignado a</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="transporte" status="i" in="${transporteList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="edit/${transporte.id}">ver</a></td>
                            <td>${transporte.patente}</td>
                            <td>${transporte.tipo}</td>
                            <td>${transporte.marca}</td>
                            <td>${transporte.modelo}</td>
                            <td>${transporte.combustible}</td>
                            <td>${transporte.kmPorLitro}</td>
                            <td>${transporte.descripcion}</td>
                            <td>
                                <g:link target="_blank" controller="usuario" action="show" id="${transporte.usuario.id}">
                                    ${transporte.usuario.nombres} ${transporte.usuario.paterno} ${transporte.usuario.materno}
                                </g:link>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${transporteCount ?: 0}" />
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
