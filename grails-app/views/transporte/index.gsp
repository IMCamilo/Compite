<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'transporte.label', default: 'Transporte')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#list-transporte" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
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
                    <div class="fieldcontain required" id="usuarioinputdiv">
                        <label for="tipo">Usuario<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreUsuario" type="text" required="" placeholder="Busca un usuario">
                    </div>
                    <div class="fieldcontain required">
                    <label for="rut">Tipo
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="tipo" value="" required="" placeholder="Ingrese el tipo de vehiculo Ej: Sedan, Camioneta, Avan" maxlength="13" id="rut" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="nombres">Descripción
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="descripcion" value="" required="" placeholder="Descripcion del vehiculo Ej: Automovil estandar" maxlength="30" id="nombres" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="paterno">Marca
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="marca" value="" required="" placeholder="Ej: Toyota" maxlength="10" id="paterno" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="materno">Km Por Litro
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="kmPorLitro" value="" required="" placeholder="Ingrese valor rendimiento en kilometros" maxlength="6" id="materno" type="text" onkeypress="return isNumber(event)"></div>
                    <div class="fieldcontain required">
                    <label for="direccion">Modelo
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="modelo" value="" required="" placeholder="Ej: Yaris XLS" maxlength="35" id="direccion" type="text"></div>
                    <div class="fieldcontain required">
                    <label for="correo">Combustible
                        <span class="required-indicator">*</span>
                    </label>
                    <input name="combustible" value="" required="" placeholder="Ej: Diesel, Gas 93, Gas 95, Gas 97, Hybid" maxlength="30" id="correo" type="text"></div>
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
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
                        <g:sortableColumn property="tipo" defaultOrder="desc" title="Tipo"/>
                        <g:sortableColumn property="marca" defaultOrder="desc" title="Marca"/>
                        <g:sortableColumn property="modelo" defaultOrder="desc" title="Modelo"/>
                        <g:sortableColumn property="combustible" defaultOrder="desc" title="Combustible"/>
                        <g:sortableColumn property="kmPorLitro" defaultOrder="desc" title="Km Por Litro"/>
                        <g:sortableColumn property="descripcion" defaultOrder="desc" title="Descripcion"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="transporte" status="i" in="${transporteList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${transporte.id}">ver</a></td>
                            <td>${transporte.tipo}</td>
                            <td>${transporte.marca}</td>
                            <td>${transporte.modelo}</td>
                            <td>${transporte.combustible}</td>
                            <td>${transporte.kmPorLitro}</td>
                            <td>${transporte.descripcion}</td>
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
