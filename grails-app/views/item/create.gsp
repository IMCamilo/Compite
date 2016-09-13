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
                    <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
                </div>
                <div class='fieldcontain required'>
                    <label for="tipo">Descripcion<span class="required-indicator">*</span></label>
                    <textarea  name="descripcion" required="" rows="4" cols="50"></textarea>
                </div>
                <div class='fieldcontain required'>
                    <label for='centroCosto'>Centro Costo
                        <span class='required-indicator'>*</span>
                    </label>
                    <input type="number" name="centroCosto" value="" required="" id="centroCosto"/>
                </div>
                <div class='fieldcontain required'>
                    <label for='tipo'>Tipo
                        <span class='required-indicator'>*</span>
                    </label>
                    <input type="text" name="tipo" value="" required="" id="tipo"/>
                </div>
                <div class='fieldcontain required'>
                    <label for='valor'>Valor
                        <span class='required-indicator'>*</span>
                    </label>
                    <input type="number" name="valor" value="" required="" id="valor"/>
                </div>
                <div class='fieldcontain required'>
                    <label for='itemPresupuetario'>Item Presupuetario
                        <span class='required-indicator'>*</span>
                    </label>
                    <input type="text" name="itemPresupuetario" value="" required="" id="itemPresupuetario"/>
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
