<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="errors" role="status">${flash.error}</div>
        </g:if>
        <div id="create-proyecto" class="content scaffold-create" role="main">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Crear Proyecto</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse on">
                        <div class="panel-body">
                            <g:hasErrors bean="${this.proyecto}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.proyecto}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                                            <g:message error="${error}" />
                                        </li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form action="save">
                                <fieldset class="form">
                                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" type="hidden">
                                    <input name="estado" value="ACTIVO" type="hidden">
                                    <div class="col-md-12">
                                        <div class="col-sm-6">
                                            <div class="fieldcontain required">
                                                <label for="nombre">Nombre
                                                    <span class="required-indicator">*</span>
                                                </label>
                                                <input name="nombre" required="" id="nombre" type="text" minlength="5" maxlength="50" placeholder="Nombre del Proyecto">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="fieldcontain required">
                                                <label for="codigo">Código
                                                    <span class="required-indicator">*</span>
                                                </label>
                                                <input name="codigo" required="" id="codigo" type="text" minlength="5" maxlength="15" placeholder="Ej: PR-00">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-sm-6">
                                            <div class="fieldcontain required">
                                                <label for="tipo">Programa
                                                    <span class="required-indicator">*</span>
                                                </label>
                                                <select name="programa" required="" id="tipo">
                                                    <option value="" disabled selected>Seleccione Programa</option>
                                                    <g:each var="programa" status="i" in="${programas}">
                                                        <option value="${programa.id}">${programa.nombre}</option>
                                                    </g:each>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="fieldcontain required" id="empresainputdiv">
                                                <label for="tipo">Empresa<span class="required-indicator">*</span></label>
                                                <input class="typeahead" name="nombreEmpresa" type="text" required="" placeholder="Busca una empresa">
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
                    </div>
                </div>
            </div>
        </div>
        <div id="find-proyecto" class="content" role="main">
            <h1>Buscar</h1>
            <g:form method="GET" action="index">
                <fieldset class="form">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain">
                                <label for="tipoBusqueda">Tipo de Programa</label>
                                <g:if test="${tipoContext != null}">
                                    <select name="tipoBusqueda" id="tipoBusqueda">
                                        <option value="" disabled selected>Seleccione Programa</option>
                                        <g:each  var="programa" status="i" in="${programas}">
                                            <option value="${programa.id}" >${programa.nombre}</option>
                                        </g:each>
                                    </select>
                                </g:if>
                                <g:else>
                                    <select name="tipoBusqueda" id="tipoBusqueda">
                                        <option value="" disabled selected>Seleccione Programa</option>
                                        <g:each  var="programa" status="i" in="${programas}">
                                            <option value="${programa.id}" >${programa.nombre}</option>
                                        </g:each>
                                    </select>
                                </g:else>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain">
                                <label for="estadoBusqueda">Estado de Proyecto</label>
                                <g:if test="${estadoContext != null}">
                                    <g:if test="${estadoContext == "ACTIVO"}">
                                        <select name="estadoBusqueda" id="estadoBusqueda">
                                            <option value="" disabled>Seleccione Estado</option>
                                            <option value="ACTIVO" selected>Activo</option>
                                            <option value="INACTIVO">Inactivo</option>
                                        </select>
                                    </g:if>
                                    <g:else>
                                        <select name="estadoBusqueda" id="estadoBusqueda">
                                            <option value="" disabled>Seleccione Estado</option>
                                            <option value="ACTIVO">Activo</option>
                                            <option value="INACTIVO" selected>Inactivo</option>
                                        </select>
                                    </g:else>
                                </g:if>
                                <g:else>
                                    <select name="estadoBusqueda" id="estadoBusqueda">
                                        <option value="" disabled selected>Seleccione Estado</option>
                                        <option value="ACTIVO">Activo</option>
                                        <option value="INACTIVO">Inactivo</option>
                                    </select>
                                </g:else>
                            </div>
                        </div>
                    </div>
                    <!--<div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain">
                                <label>¿Con Rendiciones?</label>
                                <input type="radio" name="rendicionesBusqueda" value="ALL" checked> Todas
                                <input type="radio" name="rendicionesBusqueda" value="Y"> Sí
                                <input type="radio" name="rendicionesBusqueda" value="N"> No
                            </div>
                        </div>
                    </div>-->
                    <div class="col-md-12">
                        <br>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-1">
                        </div>
                        <div class="col-sm-6">
                            <g:submitButton name="find" class="save btn btn-success" value="Buscar" />
                        </div>
                    </div>
                </fieldset>
            </g:form>
        </div>
        <div id="list-proyecto" class="content scaffold-list" role="main" style="border-top: 1px solid #009688">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>Ver</th>
                        <g:sortableColumn property="codigo" defaultOrder="desc" title="Codigo"/>
                        <g:sortableColumn property="nombre" defaultOrder="desc" title="Nombre"/>
                        <g:sortableColumn property="estado" defaultOrder="desc" title="Estado"/>
                        <g:sortableColumn property="fechaCreacion" defaultOrder="desc" title="Fecha Creacion"/>
                        <g:sortableColumn property="programa" defaultOrder="desc" title="Programa"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="proyecto" status="i" in="${proyectoList}">
                        <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${proyecto.id}">Ver</a></td>
                            <td>${proyecto.codigo}</td>
                            <td>${proyecto.nombre}</td>
                            <td>${proyecto.estado}</td>
                            <td>${formatDate(format:"dd/MM/yyyy", date: proyecto.fechaCreacion)}</td>
                            <td>${proyecto.programa.nombre}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${proyectoCount ?: 0}" />
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
                var empresas = [
                    <g:each in="${empresas}">
                        '${it.id} · ${it.nombre} · ${it.rut}',
                    </g:each>
                ];
                $('#empresainputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'empresas',
                    source: substringMatcher(empresas)
                });
            });
        </script>
        <script>
            /*funcion que permite el ingreso de solo letras*/
            function soloLetras(e) {
                tecla = (document.all) ? e.keyCode : e.which;
                if (tecla==8) return true;
                patron =/[A-Za-z]/;
                te = String.fromCharCode(tecla);
                return patron.test(te);
            }

            /*funcion que permite el ingreso de solo numeros*/
            function soloNumeros (e){
                tecla = (document.all) ? e.keyCode : e.which;
                if (tecla==8){
                    return true;
                }
                patron =/[0-9]/;
                tecla_final = String.fromCharCode(tecla);
                return patron.test(tecla_final);
            }
        </script>
    </body>
</html>
