<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainingeniero" />
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
            <input type="hidden" name="usuario" value="${session.usuarioLogueado.id}" id="nombreUsuario">
            <input type="hidden" name="programa" value="${programaId}" id="idPrograma">
            <input type="hidden" name="proyecto" value="${params.id}" id="idProyecto">
            <input type="hidden" name="aprobacion" value="NO" id="aprobacion">
            <input type="hidden" name="tipoMoneda" value="CLP" id="tipoMoneda">
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="fechaCreacion">Fecha Documento
                            <span class="required-indicator">*</span>
                        </label>
                        <g:datePicker id="fechaCreacion" name="fechaCreacion" value="${new Date()}" precision="day" years="${2016..2018}"/>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="tipoDocumento">Tipo Documento
                            <span class="required-indicator">*</span>
                        </label>
                        <select name="tipoDocumento" value="" required="" id="tipoDocumento">
                            <option value="" disabled selected>Seleccione Documento</option>
                            <option value="BOLETA">BOLETA</option>
                            <option value="FACTURA">FACTURA</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="rut">Rut a Pagar
                            <span class="required-indicator">*</span>
                        </label>
                        <input name="rutEmpresa" type="text" id="rut" required oninput="checkRut(this)" placeholder="Ingrese RUT Empresa" size="10">
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
                    <div class="fieldcontain required" id="iteminputdiv">
                        <label for='nombreItem'>Item
                            <span class='required-indicator'>*</span>
                        </label>
                        <input id="nombreItem" class="typeahead" name="nombreItem" type="text" required="" placeholder="Busca un item">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for='numeroDocumento'>N° documento
                            <span class='required-indicator'>*</span>
                        </label>
                        <input type="text" name="nDocumento" value="" required="" id="numeroDocumento"/>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="monto">Monto
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="monto" value="" required="" id="monto" onkeypress="return isNumber(event)"/>
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
