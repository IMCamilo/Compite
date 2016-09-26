<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainaingeniero" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="create-egreso" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.egreso}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.egreso}" var="error"><li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="fechaCreacion">Fecha Documento
                                    <span class="required-indicator">*</span>
                                </label>
                                <input id="fechaCreacion" type="date" name="fechaCreacion" required="" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="tipoDocumento">Tipo Documento
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="tipoDocumento" value="" required="" id="tipoDocumento">
                                    <option value="" disabled selected>Seleccione Documento</option>
                                    <option value="B0LETA">B0LETA</option>
                                    <option value="FACTURA">FACTURA</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="usuarioinputdiv">
                                <label for='nombreUsuario'>Usuario
                                    <span class='required-indicator'>*</span>
                                </label>
                                <input id="nombreUsuario" class="typeahead" name="nombreUsuario" type="text" required="" placeholder="Busca un usuario">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="programainputdiv">
                                <label for="nombrePrograma">Programa
                                    <span class="required-indicator">*</span>
                                </label>
                                <input id="nombrePrograma" class="typeahead" name="nombrePrograma" type="text" required="" placeholder="Busca un programa">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="rendicioninputdiv">
                                <label for="nombreRendicion">Rendición
                                    <span class="required-indicator">*</span>
                                </label>
                                <input id="nombreRendicion" class="typeahead" name="nombreRendicion" type="text" required="" placeholder="Busca una rendicion">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="iteminputdiv">
                                <label for='nombreItem'>Item
                                    <span class='required-indicator'>*</span>
                                </label>
                                <input id="nombreItem" class="typeahead" name="nombreItem" type="text" required="" placeholder="Busca un item">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="rutEmpresa">Rut Empresa
                                    <span class="required-indicator">*</span>
                                </label>
                                <input type="text" id="rutEmpresa" name="rutEmpresa" required oninput="checkRut(this)" placeholder="Ingrese RUT">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for='numeroDocumento'>N° documento
                                    <span class='required-indicator'>*</span>
                                </label>
                                <input type="number" name="numeroDocumento" value="" required="" id="numeroDocumento"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="tipoMoneda">Tipo Moneda
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="tipoMoneda" required="" id="tipoMoneda">
                                    <option value="" disabled selected>Seleccione Moneda</option>
                                    <option value="clp">Peso Chileno</option>
                                    <option value="usd">Dolar Americano</option>
                                    <option value="eur">Euro</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for='pagadoA'>Pagado a
                                    <span class='required-indicator'>*</span>
                                </label>
                                <input type="text" name="pagadoA" value="" required="" id="pagadoA"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="monto">Monto
                                    <span class="required-indicator">*</span>
                                </label>
                                <input type="number" name="monto" value="" required="" id="monto"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for='concepto'>Concepto
                                    <span class='required-indicator'>*</span>
                                </label>
                                <input type="text" name="concepto" value="" required="" id="concepto"/>
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
                            <g:submitButton name="create" class="save btn btn-info" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </div>
                    </div>
                </fieldset>
            </g:form>
        </div>
        <div id="list-egreso" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>Ver detalles</th>
                        <g:sortableColumn property="programa" defaultOrder="desc" title="Programa"/>
                        <g:sortableColumn property="concepto" defaultOrder="desc" title="Concepto"/>
                        <g:sortableColumn property="aprobacion" defaultOrder="desc" title="Aprobación"/>
                        <g:sortableColumn property="tipoMoneda" defaultOrder="desc" title="Tipo Moneda"/>
                        <g:sortableColumn property="monto" defaultOrder="desc" title="Monto"/>
                        <g:sortableColumn property="tipoDocumento" defaultOrder="desc" title="Tipo Documento"/>
                        <g:sortableColumn property="pagadoA" defaultOrder="desc" title="Pagado a"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="egreso" status="i" in="${egresoList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="edit/${egreso.id}">ver</a></td>
                             <td>${egreso.programa.nombre}</td>
                            <td>${egreso.concepto}</td>
                            <td>${egreso.aprobacion}</td>
                            <td>
                                <g:if test="${egreso.tipoMoneda == 'CLP'}">
                                    Pesos Chilenos
                                </g:if>
                                <g:elseif test="${egreso.tipoMoneda == 'USD'}">
                                    Dolar Américano
                                </g:elseif>
                                <g:else>
                                    Euro
                                </g:else>
                            </td>
                            <td>$ ${egreso.monto}</td>
                            <td>${egreso.tipoDocumento}</td>
                            <td>${egreso.pagadoA}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${egresoCount ?: 0}" />
            </div>
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
                var usuarios = [
                    <g:each in="${usuarios}">
                        '${it.nombres} ${it.paterno} ・ ${it.rut}',
                    </g:each>
                ];
                var programas = [
                    <g:each in="${programas}">
                        '${it.nombre} ・ ${it.codigo}',
                    </g:each>
                ];
                var rendiciones = [
                    <g:each in="${rendiciones}">
                        '${it.tipoRendicion} - ${formatDate(format:"yyyy/MM/dd", date: it.fecha)} ・ ${it.id}',
                    </g:each>
                ];
                var items = [
                    <g:each in="${items}">
                    '${it.nombre} ・ ${it.id}'
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
                $('#programainputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'programas',
                    source: substringMatcher(programas)
                });
                $('#rendicioninputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'rendiciones',
                    source: substringMatcher(rendiciones)
                });
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
