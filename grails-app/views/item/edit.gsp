<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#edit-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
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
                    <div class="fieldcontain required" id="itempreinputdiv">
                        <label for="tipo">Item Presupuestario<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="itemPresupuestario" value="${item.itemPresupuestario}" type="text" required="" placeholder="Busca un item">
                    </div>
                    <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
                    <div class='fieldcontain required'>
                        <label for='centroCosto'>Centro Costo
                            <span class='required-indicator'>*</span>
                        </label>
                        <input type="number" name="centroCosto" value="${item.centroCosto}" required="" id="centroCosto"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='valor'>Valor
                            <span class='required-indicator'>*</span>
                        </label>
                        <input type="number" name="valor" value="${item.valor}" required="" id="valor"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for="tipo">Descripcion<span class="required-indicator">*</span></label>
                        <textarea  name="descripcion" required="" rows="4" cols="50">${item.descripcion}</textarea>
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
