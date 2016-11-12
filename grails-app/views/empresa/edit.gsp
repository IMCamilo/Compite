<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-empresa" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.empresa}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.empresa}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.empresa}" method="PUT">
                <g:hiddenField name="version" value="${this.empresa?.version}" />
                <fieldset class="form">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="rut">Rut
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${empresa.rut}" type="text" id="rut" name="rut" required oninput="checkRut(this)" placeholder="Ingrese RUT">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="tipo">Tipo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${empresa.tipo}" name="tipo" required="" placeholder="Nombre tipo empresa Ej: Software" maxlength="15" id="tipo" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="nombre">Nombre
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${empresa.nombre}" name="nombre" required="" placeholder="Nombre ficticio empresa" minlength="10" maxlength="100" id="nombre" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="razonSocial">Razón Social
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${empresa.razonSocial}" name="razonSocial" required="" placeholder="Razon Social" maxlength="100" id="razonSocial" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="giro">Giro
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${empresa.giro}" name="giro" required="" placeholder="Giro de la empresa Ej: Consultores de Software" maxlength="100" id="giro" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="gerente">Gerente
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${empresa.gerente}" name="gerente" required="" placeholder="Nombre del representante legal" maxlength="50" id="gerente" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="direccion">Dirección
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${empresa.direccion}" name="direccion" required="" placeholder="Region/Comuna/Area/Calle/Numero" maxlength="100" id="direccion" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="correo">Correo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${empresa.correo}" name="correo" required="" placeholder="Ej: correo@dominio.cl" maxlength="100" id="correo" type="email">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="telefono">Teléfono
                                    <span class="required-indicator">*</span>
                                </label>
                                <input value="${empresa.telefono}" name="telefono" required="" placeholder="(Cod. Area)+numero Ej: 56 2 123456" maxlength="11" id="telefono" type="text" onkeypress="return isNumber(event)">
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
                            <g:link class="list" action="show" id="${empresa.id}">Volver</g:link>
                        </div>
                    </div>
                </fieldset>
            </g:form>
        </div>
    <asset:javascript src="compite/validarut.js"/>
    </body>
</html>
