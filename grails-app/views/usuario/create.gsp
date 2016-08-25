<meta name="layout" content="auditoria/auditoria.main"/>
<div class="row">


            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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