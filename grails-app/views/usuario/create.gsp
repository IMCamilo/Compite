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
                    <fieldset class="form">

                        <div class="input-field col s6">
                            <f:input property="rut" bean="usuario"/>
                            <label >RUT</label>
                        </div>

                        <div class="input-field col s6">
                            <f:input property="nombres" bean="usuario"/>
                            <label >NOMBRES</label>
                        </div>
                        <div class="input-field col s6">
                            <f:input property="paterno" bean="usuario"/>
                            <label >APELLIDO PATERNO</label>
                        </div>
                        <div class="input-field col s6">
                            <f:input property="materno" bean="usuario"/>
                            <label >APELLIDO MATERNO</label>
                        </div>
                        <div class="input-field col s6">
                            <f:input property="direccion" bean="usuario"/>
                            <label >DIRECCION</label>
                        </div>
                        <div class="input-field col s6">
                            <f:input property="correo" bean="usuario"/>
                            <label >CORREO ELECTRÓNICO</label>
                        </div>
                        <div class="input-field col s6">
                            <f:input property="telefono" bean="usuario"/>
                            <label >TELÉFONO</label>
                        </div>
                        <div class="input-field col s6">
                            <f:input property="clave" bean="usuario" type="password"/>
                            <label >CLAVE</label>
                        </div>
                        <div class="input-field col s6">

                            <f:input property="tipo" bean="usuario" type="password"/>
                            <label >TIPO USUARIO</label>
                        </div>




                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </fieldset>
                </div>
        </g:form>
        </div>

</div>
<!--
<div class="row">
    <g:form class="col s12" action="save">
        <div class="row">
            <div class="input-field col s2">
                <g:textField id="rut" type="text" class="validate" name="rut" />
                <label for="rut">RUT</label>
            </div>
            <div class="input-field col s3">
                <g:textField id="nombre" type="text" class="validate" name="nombres" />
                <label for="nombre">Nombre</label>
            </div>
            <div class="input-field col s3">
                <g:textField id="paterno" type="text" class="validate" name="paterno" />
                <label for="paterno">Paterno</label>
            </div>
            <div class="input-field col s3">
                <g:textField id="materno" type="text" class="validate" name="materno" />
                <label for="materno">Materno</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s7">
                <g:textField id="direccion" type="text" class="validate" name="direccion" />
                <label for="direccion">Dirección</label>
            </div>
            <div class="input-field col s5">
                <g:textField id="email" type="email" class="validate" name="correo" />
                <label for="email">Correo electrónico</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s2">
                <g:textField id="tipo" type="text" class="validate" name="tipo" />
                <label for="tipo">Tipo</label>
            </div>
            <div class="input-field col s3">
                <g:textField id="telefono" type="text" class="validate" name="telefono" />
                <label for="telefono">Teléfono</label>
            </div>
            <div class="input-field col s3">
                <g:passwordField id="password" name="clave" />
                <label for="password">Contraseña</label>
            </div>
            <div class="input-field col s3">
                <input id="password" type="password" class="validate">
                <label for="password">Repita Contraseña</label>
            </div>
        </div>
        <g:actionSubmit class="btn waves-effect waves-light" value="Save"/>
    </g:form>
</div>
-->