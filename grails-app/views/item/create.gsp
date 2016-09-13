<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}"/>
        <title><g:message code="default.create.label" args="[entityName]"/></title>
    </head>
    <body>
        <a href="#create-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li>
                    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                </li>
                <li>
                    <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link>
                </li>
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
                <div class='fieldcontain'>
                    <label for='creadoPor'>Creado Por</label><input type="text" name="creadoPor" value="" id="creadoPor"/>
                </div>
                <div class='fieldcontain required'>
                    <label for='descripcion'>Descripcion
                        <span class='required-indicator'>*</span>
                    </label><input type="text" name="descripcion" value="" required="" id="descripcion"/>
                </div>
                <div class='fieldcontain required'>
                    <label for='centroCosto'>Centro Costo
                        <span class='required-indicator'>*</span>
                    </label><input type="number" name="centroCosto" value="" required="" id="centroCosto"/>
                </div>
                <div class='fieldcontain required'>
                    <label for='tipo'>Tipo
                        <span class='required-indicator'>*</span>
                    </label><input type="text" name="tipo" value="" required="" id="tipo"/>
                </div>
                <div class='fieldcontain required'>
                    <label for='valor'>Valor
                        <span class='required-indicator'>*</span>
                    </label><input type="number" name="valor" value="" required="" id="valor"/>
                </div>
                <div class='fieldcontain required'>
                    <label for='fechaCreacion'>Fecha Creacion
                        <span class='required-indicator'>*</span>
                    </label><input type="hidden" name="fechaCreacion" value="date.struct"/>
                    <select name="fechaCreacion_day" id="fechaCreacion_day" aria-labelledby="fechaCreacion">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13" selected="selected">13</option>
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
                        <option value="1">January</option>
                        <option value="2">February</option>
                        <option value="3">March</option>
                        <option value="4">April</option>
                        <option value="5">May</option>
                        <option value="6">June</option>
                        <option value="7">July</option>
                        <option value="8">August</option>
                        <option value="9" selected="selected">September</option>
                        <option value="10">October</option>
                        <option value="11">November</option>
                        <option value="12">December</option>
                    </select>
                    <select name="fechaCreacion_year" id="fechaCreacion_year" aria-labelledby="fechaCreacion">
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016" selected="selected">2016</option>
                    </select>

                </div>
                <div class='fieldcontain required'>
                    <label for='itemPresupuetario'>Item Presupuetario
                        <span class='required-indicator'>*</span>
                    </label><input type="text" name="itemPresupuetario" value="" required="" id="itemPresupuetario"/>
                </div>
            </fieldset>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
