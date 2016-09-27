<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainadministrador" />
    <g:set var="entityName" value="${message(code: 'programa.label', default: 'Programa')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <asset:stylesheet src="compite/autocomplete.css"/>
</head>
<body>
<div id="find-programa" class="content" role="main">
    <h1>Buscar</h1>
    <g:form method="GET" action="index">
        <fieldset class="form">
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain">
                        <label for="tipoBusqueda">Tipo de Programa</label>
                        <g:if test="${tipoContext != null}">
                            <g:if test="${tipoContext == "PUBLICO"}">
                                <select name="tipoBusqueda" id="tipoBusqueda">
                                    <option value="" disabled>Seleccione Tipo</option>
                                    <option value="PUBLICO" selected>Publico</option>
                                    <option value="PRIVADO">Privado</option>
                                </select>
                            </g:if>
                            <g:else>
                                <select name="tipoBusqueda" id="tipoBusqueda">
                                    <option value="" disabled>Seleccione Tipo</option>
                                    <option value="PUBLICO">Publico</option>
                                    <option value="PRIVADO" selected>Privado</option>
                                </select>
                            </g:else>
                        </g:if>
                        <g:else>
                            <select name="tipoBusqueda" id="tipoBusqueda">
                                <option value="" disabled selected>Seleccione Tipo</option>
                                <option value="PUBLICO">Publico</option>
                                <option value="PRIVADO">Privado</option>
                            </select>
                        </g:else>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain">
                        <label for="estadoBusqueda">Estado de Programa</label>
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
<div id="list-programa" class="content scaffold-list" role="main" style="border-top: 1px solid #009688">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <th>ver</th>
            <g:sortableColumn property="codigo" defaultOrder="desc" title="Codigo"/>
            <g:sortableColumn property="nombre" defaultOrder="desc" title="Nombre"/>
            <g:sortableColumn property="estado" defaultOrder="desc" title="Estado"/>
            <g:sortableColumn property="fechaCreacion" defaultOrder="desc" title="Fecha Creacion"/>
            <g:sortableColumn property="fechaFin" defaultOrder="desc" title="Fecha Finalizacion"/>
            <g:sortableColumn property="tipo" defaultOrder="desc" title="Tipo"/>
            <g:sortableColumn property="rut" defaultOrder="desc" title="Usuario"/>
        </tr>
        </thead>
        <tbody>
        <g:each var="programa" status="i" in="${programaList}">
            <g:if test="${programa.rendicion.isEmpty()}">
                <tr style="background-color: #DF6664">
                    <td><a href="edit/${programa.id}">ver/editar</a></td>
                    <td>${programa.codigo}</td>
                    <td>${programa.nombre}</td>
                    <td>${programa.estado}</td>
                    <td>${formatDate(format:"dd/MM/yyyy", date: programa.fechaInicio)}</td>
                    <td>${formatDate(format:"dd/MM/yyyy", date: programa.fechaFin)}</td>
                    <td>${programa.tipo}</td>
                    <td>${programa.asignacion.usuario.rut}</td>
                </tr>
            </g:if>
            <g:else>
                <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                    <td><a href="edit/${programa.id}">ver/editar</a></td>
                    <td>${programa.codigo}</td>
                    <td>${programa.nombre}</td>
                    <td>${programa.estado}</td>
                    <td>${formatDate(format:"dd/MM/yyyy", date: programa.fechaInicio)}</td>
                    <td>${formatDate(format:"dd/MM/yyyy", date: programa.fechaFin)}</td>
                    <td>${programa.tipo}</td>
                    <td>${programa.asignacion.usuario.rut}</td>
                </tr>
            </g:else>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${programaCount ?: 0}" />
    </div>
</div>
    <div id="list-programa" class="content scaffold-list" role="main" style="border-top: 1px solid #009688">


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
            '${it.nombre} ${it.rut} ・ ${it.id}',
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
