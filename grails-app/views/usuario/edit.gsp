<meta name="layout" content="administrador.base"/>
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

<!--empieza el formulario-->
<g:form resource="${this.usuario}" method="PUT">
    <g:hiddenField name="version" value="${this.usuario?.version}" />
    <div class="row">
        <div class="row">
            <div class="input-field col s2">
                <input name="rut" maxlength="12" value="${usuario.rut}" required="" id="rut" type="text"  onkeypress="return isNumber(event)">
                <label>RUT</label>
            </div>
            <div class="input-field col s4">
                <input name="nombres" maxlength="35" value="${usuario.nombres}" required="" id="nombres" type="text">
                <label>Nombres</label>
            </div>
            <div class="input-field col s3">
                <input name="paterno" maxlength="20" value="${usuario.paterno}" required="" id="paterno" type="text">
                <label>Apellido Paterno</label>
            </div>
            <div class="input-field col s3">
                <input name="materno" maxlength="20" value="${usuario.materno}" required="" id="materno" type="text">
                <label>Apellido Materno</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <input name="direccion" maxlength="40" value="${usuario.direccion}" required="" id="direccion" type="text">
                <label>Direccion</label>
            </div>
            <div class="input-field col s6">
                <input name="correo" maxlength="40" value="${usuario.correo}" required="" id="correo" type="email">
                <label>Correo Electronico</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s4">
                <input name="telefono" maxlength="10" value="${usuario.telefono}" id="telefono" type="text" onkeypress="return isNumber(event)">
                <label>Telefono</label>
            </div>
            <div class="input-field col s4">
                <input name="claver" maxlength="15" value="${usuario.clave}" required="" type="password">
                <label>Contraseña</label>
            </div>
            <div class="input-field col s4">
                <input name="clave" maxlength="15" value="${usuario.clave}" required="" type="text">
                <label>Repita Contraseña</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s4">
                <select name="tipo" value="${usuario.tipo}" required="" id="tipo" type="number">
                    <option value="" disabled>Seleccione Privilegio</option>
                    <option value="1">Administrador</option>
                    <option value="2">Ingeniero</option>
                </select>
                <label>Tipo</label>
            </div>
        </div>
    </div>
    <g:submitButton name="create" type="submit" class="save btn waves-effect waves-light" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
</g:form>