<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="edit-item" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.item}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.item}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.item}" method="PUT">
                <g:hiddenField name="version" value="${this.item?.version}" />
                <fieldset class="form">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="itempreinputdiv">
                                <label for="itemPresupuestario">Item
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${item.itemPresupuestario}" id="itemPresupuestario" class="typeahead" name="itemPresupuestario" type="text" required="" placeholder="Busca un item">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required" id="proyectoinputdiv">
                                <label for="centroCosto">Centro Costo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${item.centroCosto}" type="text" name="centroCosto" required="" id="centroCosto" onkeypress="return isNumber(event)"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="nombre">Nombre
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${item.nombre}" type="text" name="nombre" required="" id="nombre" maxlength="100"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="valor">Valor
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${item.valor}" type="text" name="valor" required="" id="valor" onkeypress="return isNumber(event)"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="descripcion">Descripción
                                    <span class="required-indicator">*</span>
                                </label>
                                <textarea id="descripcion" name="descripcion" required="" maxlength="255" rows="4" cols="50">${item.descripcion}</textarea>
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
                var itempresupuestarios = [
                    'ALOJAMIENTO PROGRAMAS ACADEMICOS VIATICOS',
                    'ALIMENTACION PROGRAMAS',
                    'LIBROS Y TABLES',
                    'ARRIENDO EQUIPOS',
                    'ARRIENDO EQUIPOS',
                    'ARRIENDO BUSES Y TRASLADOS',
                    'HONORARIOS PROYECTOS',
                    'SERVICIOS DE ASESORIAS DE ESTUDIOS',
                    'PUBLICACIONES DE INVESTIGACION',
                    'FOTOCOPIAS E IMPRESIONES',
                    'ARTICULOS PROGRAMAS',
                    'SUSCRIPCIONES A DIARIOS Y REVISATAS ACADEMICAS',
                    'MATERIALES DE LABORATORIO',
                    'AVISAJE',
                    'IMPRESOS Y OTROS MATERIALES DE PUBLICIDAD',
                    'COMISIONES AGENCIAS Y ASESORIAS',
                    'AVISAJE DIGITAL',
                    'PAGINAS WEB',
                    'DISEÑOS',
                    'HONORARIOS PROMOCION',
                    'PASAJES',
                    'VIATICO NACIONAL',
                    'VIATICO INTERNACIONAL',
                    'ALOJAMIENTOS',
                    'ALIMENTACION',
                    'VALIJA Y CORREO',
                    'MATERIALES DE OFICINA',
                    'MOVILIZACION',
                    'IMPUESTOS Y GASTOS LEGALES',
                    'REPARACION Y MANTENCION DE EQUIPOS',
                    'MATERIALES DE MANTENCION',
                    'REMODELACION INMUEBLES',
                    'HONORARIOS DE MANTENCION',
                    'TELEFONO Y FAX',
                    'AGUA',
                    'ELECTRICIDAD',
                    'GAS',
                    'COMBUSTIBLES'
                ];
                $('#itempreinputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'itempresupuestarios',
                    source: substringMatcher(itempresupuestarios)
                });
            });
        </script>
    </body>
</html>
