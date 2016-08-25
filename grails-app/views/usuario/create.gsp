<meta name="layout" content="auditoria/auditoria.main"/>
<div class="row">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.usuario}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.usuario}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

    <g:form class="col s12 validate" action="save">
        <div class="row">
            <div class="input-field col s2">
                <f:input property="rut" bean="usuario"/>
                <label for="rut">RUT</label>
            </div>
            <div class="input-field col s3">
                <f:input property="nombres" bean="usuario"/>
                <label for="nombres">Nombre</label>
            </div>
            <div class="input-field col s3">
                <f:input property="paterno" bean="usuario"/>
                <label for="paterno">Paterno</label>
            </div>
            <div class="input-field col s3">
                <f:input property="materno" bean="usuario"/>
                <label for="materno">Materno</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <f:input property="direccion" bean="usuario"/>
                <label for="direccion">Dirección</label>
            </div>
            <div class="input-field col s5">
                <f:input property="correo" bean="usuario"/>
                <label for="email">Correo electrónico</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s2">
                <f:input property="tipo" bean="usuario" type="password"/>
                <label for="tipo">Tipo</label>
            </div>
            <div class="input-field col s3">
                <f:input property="telefono" bean="usuario"/>
                <label for="telefono">Teléfono</label>
            </div>
            <div class="input-field col s3">
                <f:input property="clave" bean="usuario" type="password"/>
                <label for="password">Contraseña</label>
            </div>
            <div class="input-field col s3">
                <input id="password" type="password" class="validate">
                <label for="password">Repita Contraseña</label>
            </div>
        </div>
        <g:submitButton name="create" class="save btn waves-effect waves-light" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </g:form>
</div>