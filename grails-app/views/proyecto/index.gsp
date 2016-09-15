<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <div id="create-proyecto" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
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
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="nombre">Nombre
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="nombre" value="" required="" id="nombre" type="text">
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
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="codigo">Codigo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="codigo" value="" required="" id="codigo" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="estado">Estado
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="estado" value="" required="" id="estado">
                                    <option value="" disabled selected>Seleccione Estado</option>
                                    <option value="ACTIVO">Activo</option>
                                    <option value="INACTIVO">Inactivo</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="tipo">Tipo
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="tipo" value="" required="" id="tipo">
                                    <option value="" disabled selected>Seleccione Tipo</option>
                                    <option value="PUBLICO">Publico</option>
                                    <option value="PRIVADO">Privado</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain">
                                <label class="" for="presupuesto">Presupuesto</label>
                                <input name="presupuesto" value="" id="presupuesto" type="number">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="fechaCreacion">Fecha Inicio
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="fechaCreacion" value="date.struct" type="hidden">
                                <select name="fechaCreacion_day" id="fechaCreacion_day" aria-labelledby="fechaCreacion">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9" selected="selected">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                                <select name="fechaCreacion_month" id="fechaCreacion_month" aria-labelledby="fechaCreacion">
                                    <option value="1">enero</option>
                                    <option value="2">febrero</option>
                                    <option value="3">marzo</option>
                                    <option value="4">abril</option>
                                    <option value="5">mayo</option>
                                    <option value="6">junio</option>
                                    <option value="7">julio</option>
                                    <option value="8">agosto</option>
                                    <option value="9" selected="selected">septiembre</option>
                                    <option value="10">octubre</option>
                                    <option value="11">noviembre</option>
                                    <option value="12">diciembre</option>
                                </select>
                                <select name="fechaCreacion_year" id="fechaCreacion_year" aria-labelledby="fechaCreacion">
                                    <option value="2018">2018</option>
                                    <option value="2017">2017</option>
                                    <option value="2016" selected="selected">2016</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="fechaFin">Fecha Fin
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="fechaFin" value="date.struct" type="hidden">
                                <select name="fechaFin_day" id="fechaFin_day" aria-labelledby="fechaFin">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9" selected="selected">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                                <select name="fechaFin_month" id="fechaFin_month" aria-labelledby="fechaFin">
                                    <option value="1">enero</option>
                                    <option value="2">febrero</option>
                                    <option value="3">marzo</option>
                                    <option value="4">abril</option>
                                    <option value="5">mayo</option>
                                    <option value="6">junio</option>
                                    <option value="7">julio</option>
                                    <option value="8">agosto</option>
                                    <option value="9" selected="selected">septiembre</option>
                                    <option value="10">octubre</option>
                                    <option value="11">noviembre</option>
                                    <option value="12">diciembre</option>
                                </select>
                                <select name="fechaFin_year" id="fechaFin_year" aria-labelledby="fechaFin">
                                    <option value="2018">2018</option>
                                    <option value="2017">2017</option>
                                    <option value="2016" selected="selected">2016</option>
                                </select>
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
        <div id="find-proyecto" class="content" role="main">
            <h1>Buscar</h1>
            <g:form method="GET" action="index">
                <fieldset class="form">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain">
                                <label for="tipoBusqueda">Tipo de Proyecto
                                </label>
                                <select name="tipoBusqueda" id="tipoBusqueda">
                                    <option value="" disabled selected>Seleccione Tipo</option>
                                    <option value="PUBLICO">Publico</option>
                                    <option value="PRIVADO">Privado</option>
                                </select>
                            </div>
                        </div>
                        <!--<div class="col-sm-6">
                            <div class="fieldcontain">
                                <label for="estadoBusqueda">Estado de Proyecto
                                </label>
                                <select name="estadoBusqueda" id="estadoBusqueda">
                                    <option value="" disabled selected>Seleccione Estado</option>
                                    <option value="ACTIVO">Activo</option>
                                    <option value="INACTIVO">Inactivo</option>
                                </select>
                            </div>
                        </div>-->
                    </div>
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
                        <th>ver</th>
                        <g:sortableColumn property="codigo" defaultOrder="desc" title="Codigo"/>
                        <g:sortableColumn property="nombre" defaultOrder="desc" title="Nombre"/>
                        <g:sortableColumn property="estado" defaultOrder="desc" title="Estado"/>
                        <g:sortableColumn property="fechaCreacion" defaultOrder="desc" title="Fecha Creacion"/>
                        <g:sortableColumn property="fechaFin" defaultOrder="desc" title="Fecha Finalizacion"/>
                        <g:sortableColumn property="tipo" defaultOrder="desc" title="Tipo"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="proyecto" status="i" in="${proyectoList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${proyecto.id}">ver</a></td>
                            <td>${proyecto.codigo}</td>
                            <td>${proyecto.nombre}</td>
                            <td>${proyecto.estado}</td>
                            <td>${formatDate(format:"dd/MM/yyyy", date: proyecto.fechaCreacion)}</td>
                            <td>${formatDate(format:"dd/MM/yyyy", date: proyecto.fechaFin)}</td>
                            <td>${proyecto.tipo}</td>
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
    </body>
</html>
