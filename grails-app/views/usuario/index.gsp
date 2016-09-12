<meta name="layout" content="administrador.base"/>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<g:hasErrors bean="${this.usuario}">
    <ul class="errors" role="alert">
        <g:eachError bean="${this.usuario}" var="error"><li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>


<ul class="collapsible" data-collapsible="accordion">
    <li>
        <div class="collapsible-header"><i class="material-icons">filter_drama</i>First</div>
        <div class="collapsible-body">
        <!--empieza el formulario-->
            <g:form class="col s12" action="save">
                <div class="row">
                    <div class="row">
                        <div class="input-field col s2">
                            <input name="rut" maxlength="12" value="" required="" id="rut" type="text"  onkeypress="return isNumber(event)">
                            <label>RUT</label>
                        </div>
                        <div class="input-field col s4">
                            <input name="nombres" maxlength="35" value="" required="" id="nombres" type="text">
                            <label>Nombres</label>
                        </div>
                        <div class="input-field col s3">
                            <input name="paterno" maxlength="20" value="" required="" id="paterno" type="text">
                            <label>Apellido Paterno</label>
                        </div>
                        <div class="input-field col s3">
                            <input name="materno" maxlength="20" value="" required="" id="materno" type="text">
                            <label>Apellido Materno</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input name="direccion" maxlength="40" value="" required="" id="direccion" type="text">
                            <label>Direccion</label>
                        </div>
                        <div class="input-field col s6">
                            <input name="correo" maxlength="40" value="" required="" id="correo" type="email">
                            <label>Correo Electronico</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s4">
                            <input name="telefono" maxlength="10" value="" id="telefono" type="text" onkeypress="return isNumber(event)">
                            <label>Telefono</label>
                        </div>
                        <div class="input-field col s4">
                            <input name="claver" maxlength="15" value="" required="" type="password">
                            <label>Contraseña</label>
                        </div>
                        <div class="input-field col s4">
                            <input name="clave" maxlength="15" value="" required="" type="text">
                            <label>Repita Contraseña</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s4">
                            <select name="tipo" required="" id="tipo" type="number">
                                <option value="" disabled selected>Seleccione Privilegio</option>
                                <option value="1">Administrador</option>
                                <option value="2">Ingeniero</option>
                            </select>
                            <label>Tipo</label>
                        </div>
                        <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                    </div>
                </div>
                <g:submitButton name="create" class="save btn waves-effect waves-light" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </g:form>
        </div>
    </li>
</ul>

<f:table collection="${usuarioList}"/>
<div class="pagination">
    <g:paginate total="${usuarioCount ?: 0}"/>
</div>
