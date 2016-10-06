<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainingeniero" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
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
            <g:form controller="egresoIng" action="update" resource="${this.egreso}" method="PUT">
                <input type="hidden" name="egreso" value="${params.id}" id="egreso">
                <input type="hidden" name="aprobacion" value="${egreso.aprobacion}">
                <fieldset class="form">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="fechaCreacion">Fecha Documento
                                    <span class="required-indicator">*</span>
                                </label>
                                <g:datePicker id="fechaCreacion" name="fechaCreacion" value="${egreso.fechaCreacion}" precision="day" years="${2016..2018}"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="tipoDocumento">Tipo Documento
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="tipoDocumento" value="" required="" id="tipoDocumento">
                                    <g:if test="${egreso.tipoDocumento == "BOLETA"}">
                                        <option value="BOLETA" selected>BOLETA</option>
                                    </g:if>
                                    <g:else>
                                        <option value="FACTURA" selected>FACTURA</option>
                                    </g:else>
                                    <option value="${egreso.tipoDocumento}">---</option>
                                    <option value="BOLETA">BOLETA</option>
                                    <option value="FACTURA">FACTURA</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="rutEmpresa">Rut a Pagar
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${egreso.rutEmpresa}" name="rutEmpresa" type="text" id="rutEmpresa" required oninput="checkRut(this)" placeholder="Ingrese RUT Empresa" size="10">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for='pagadoA'>Pagado a
                                    <span class='required-indicator'>*</span>
                                </label>
                                <input value="${egreso.pagadoA}" type="text" name="pagadoA" required="" id="pagadoA"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="iteminputdiv">
                                <label for='nombreItem'>Item
                                    <span class='required-indicator'>*</span>
                                </label>
                                <input value="${item.nombre} - ${item.id}" id="nombreItem" class="typeahead" name="nombreItem" type="text" required="" placeholder="Busca un item">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for='numeroDocumento'>N° documento
                                    <span class='required-indicator'>*</span>
                                </label>
                                <input value="${egreso.nDocumento}" type="text" name="nDocumento" value="" required="" id="numeroDocumento"/>
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
                                    <g:if test="${egreso.tipoMoneda == "CLP"}">
                                        <option value="CLP" selected>Peso Chileno</option>
                                    </g:if>
                                    <g:elseif test="${egreso.tipoMoneda == "USD"}">
                                        <option value="USD" selected>Dolar Americano</option>
                                    </g:elseif>
                                    <g:else>
                                        <option value="EUR" selected>Euro</option>
                                    </g:else>
                                    <option value="${egreso.tipoMoneda}">---</option>
                                    <option value="CLP">Peso Chileno</option>
                                    <option value="USD">Dolar Americano</option>
                                    <option value="EUR">Euro</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="monto">Monto
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${egreso.monto}" type="text" name="monto" required="" id="monto" onkeypress="return isNumber(event)"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for='concepto'>Concepto
                                    <span class='required-indicator'>*</span>
                                </label>
                                <input value="${egreso.concepto}" type="text" name="concepto" required="" id="concepto"/>
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
                </fieldset>
            </g:form>
        </div>
        <div class="content scaffold-edit">
            <h1>Cargar archivos para Egreso nº ${egreso.id}</h1>
            <g:uploadForm controller="egreso" action="upload">
                <fieldset class="form">
                    <input type="file" name="archivo" />
                </fieldset>
                <input type="hidden" name="idEgreso" value="${egreso.id}">
                <fieldset class="buttons">
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
