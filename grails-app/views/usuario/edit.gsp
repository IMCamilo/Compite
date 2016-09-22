<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-usuario" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.usuario}" method="PUT">
                <g:hiddenField name="version" value="${this.usuario?.version}" />
                <fieldset class="form">

                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="rut">Rut
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${usuario.rut}" type="text" id="rut" name="rut" required oninput="checkRut(this)" placeholder="Ingrese RUT">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="nombres">Nombres
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${usuario.nombres}" type="text" name="nombres" required="" maxlength="50" id="nombres" onkeypress="return soloLetras(event)"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="paterno">Apellido Paterno
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${usuario.paterno}" type="text" name="paterno" required="" maxlength="100" id="paterno" onkeypress="return soloLetras(event)"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="materno">Apellido Materno
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${usuario.materno}" type="text" name="materno" required="" maxlength="100" id="materno" onkeypress="return soloLetras(event)"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="direccion">Dirección
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${usuario.direccion}" type="text" name="direccion" required="" placeholder="Region/Comuna/Area/Calle/Numero" maxlength="100" id="direccion"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="correo">Correo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${usuario.correo}" type="email" name="correo" required="" placeholder="Ej: correo@dominio.cl" maxlength="50" id="correo" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="telefono">Teléfono
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${usuario.telefono}" type="text" name="telefono" maxlength="15" id="telefono" onkeypress="return isNumber(event)"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="tipo">Tipo
                                    <span class="required-indicator">*</span>
                                </label>
                                <select name="tipo" required="" id="tipo" type="number">
                                    <g:if test="${usuario.tipo == 1}">
                                        <option value="1" selected>Administrador</option>
                                    </g:if>
                                    <g:else>
                                        <option value="2" selected>Ingeniero</option>
                                    </g:else>
                                    <option value="${usuario.tipo}">---</option>
                                    <option value="1">Administrador</option>
                                    <option value="2">Ingeniero</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <br>
                    </div>
                    <div class="col-md-10">
                        <div class="col-sm-3">
                            <input class="save btn btn-info" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </div>
                    </div>
                    <div class="col-md-12">
                        <br>
                    </div>
                    <div class="col-md-10">
                        <div class="col-sm-3">
                            <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
                        </div>
                    </div>
                </fieldset>
            </g:form>
        </div>
    <asset:javascript src="compite/validarut.js"/>
    </body>
</html>
