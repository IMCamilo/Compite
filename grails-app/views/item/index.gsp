<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#list-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="create-item" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.item}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.item}" var="error"><li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <fieldset class="form">
                        <div class="fieldcontain required" id="itempreinputdiv">
                            <label for="tipo">Item Presupuestario<span class="required-indicator">*</span></label>
                            <input class="typeahead" name="itemPresupuestario" type="text" required="" placeholder="Busca un item">
                        </div>
                        <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
                        <div class='fieldcontain required'>
                            <label for='centroCosto'>Centro Costo
                                <span class='required-indicator'>*</span>
                            </label>
                            <input type="number" name="centroCosto" value="" required="" id="centroCosto"/>
                        </div>
                        <div class='fieldcontain required'>
                            <label for='valor'>Valor
                                <span class='required-indicator'>*</span>
                            </label>
                            <input type="number" name="valor" value="" required="" id="valor"/>
                        </div>
                        <div class='fieldcontain required'>
                            <label for="tipo">Descripcion<span class="required-indicator">*</span></label>
                            <textarea  name="descripcion" required="" rows="4" cols="50"></textarea>
                        </div>
                    </fieldset>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                </fieldset>
            </g:form>
        </div>
        <div id="list-item" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${itemList}" />

            <div class="pagination">
                <g:paginate total="${itemCount ?: 0}" />
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
