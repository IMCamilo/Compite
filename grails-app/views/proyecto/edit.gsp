<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#edit-proyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-proyecto" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.proyecto}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.proyecto}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.proyecto}" method="PUT">
                <g:hiddenField name="version" value="${this.proyecto?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label for="nombre">Nombre
                            <span class="required-indicator">*</span>
                        </label>
                        <input name="nombre" value="${proyecto.nombre}" required="" id="nombre" type="text">
                    </div>
                    <div class="fieldcontain required" id="empresainputdiv">
                        <label for="tipo">Empresa<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="nombreEmpresa" value="${empresa.nombre} ${empresa.rut} , ${empresa.id}" type="text" required="" placeholder="Busca una empresa">
                    </div>
                    <div class="fieldcontain required">
                        <label for="codigo">Codigo
                            <span class="required-indicator">*</span>
                        </label>
                        <input name="codigo" value="${proyecto.codigo}" required="" id="codigo" type="text">
                    </div>
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
                    <div class="fieldcontain">
                        <label class="" for="presupuesto">Presupuesto</label>
                        <input name="presupuesto" value="${proyecto.presupuesto}" id="presupuesto" type="number">
                    </div>
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
                var empresas = [
                    <g:each in="${empresas}">
                        '${it.nombre} ${it.rut} , ${it.id}',
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
