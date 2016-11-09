<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div id="create-item" class="content scaffold-create" role="main">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Crear Item</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse on">
                        <div class="panel-body">
                            <g:hasErrors bean="${this.item}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.item}" var="error"><li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form action="save">
                                <fieldset class="form">
                                    <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
                                    <div class="col-md-12">
                                        <div class="col-sm-6">
                                            <div class="fieldcontain required" id="itempreinputdiv">
                                                <label for="codigo">Código
                                                    <span class="required-indicator">*</span>
                                                </label>
                                                <input id="codigo" name="codigo" type="number" min="1" max="10000" required="" placeholder="ingresa el código del item">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="fieldcontain required" id="proyectoinputdiv">
                                                <label for="nombre">Nombre
                                                    <span class="required-indicator">*</span>
                                                </label>
                                                <input type="text" name="nombre" required="" id="nombre" minlength="3" maxlength="30" placeholder="Ingresa el nombre del item"/>
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
                                            <g:submitButton name="create" class="save btn btn-success" onClick="comprobarClave()" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                                        </div>
                                    </div>
                                </fieldset>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="list-item" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>Editar/Ver</th>
                        <g:sortableColumn property="codigo" defaultOrder="desc" title="Codigo"/>
                        <g:sortableColumn property="nombre" defaultOrder="desc" title="nombre"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="item" status="i" in="${itemList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="edit/${item.id}">Editar/Ver</a></td>
                            <td>${item.codigo}</td>
                            <td>${item.nombre}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
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
