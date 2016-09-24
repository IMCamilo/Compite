<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="create-empresa" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form action="save">
                <fieldset class="form">
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="rut">Rut
                                    <span class="required-indicator">*</span>
                                </label>
                                <input type="text" id="rut" name="rut" required oninput="checkRut(this)" placeholder="Ingrese RUT">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="tipo">Tipo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="tipo" required="" placeholder="Nombre tipo empresa Ej: Software" maxlength="15" id="tipo" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="nombre">Nombre
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="nombre" required="" placeholder="Nombre ficticio empresa" minlength="2" maxlength="50" id="nombre" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="razonSocial">Razón Social
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="razonSocial" required="" placeholder="Razon Social" maxlength="100" id="razonSocial" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="giro">Giro
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="giro" required="" placeholder="Giro de la empresa Ej: Consultores de Software" maxlength="100" id="giro" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="gerente">Gerente
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="gerente" required="" placeholder="Nombre del representante legal" maxlength="50" id="gerente" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="direccion">Dirección
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="direccion" required="" placeholder="Region/Comuna/Area/Calle/Numero" maxlength="100" id="direccion" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="correo">Correo
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="correo" required="" placeholder="Ej: correo@dominio.cl" maxlength="100" id="correo" type="email">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fieldcontain required">
                                <label for="telefono">Teléfono
                                    <span class="required-indicator">*</span>
                                </label>
                                <input name="telefono" required="" placeholder="(Cod. Area)+numero Ej: 56 2 123456" maxlength="11" id="telefono" type="text" onkeypress="return isNumber(event)">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <br>
                    </div>
                    <div class="col-md-12">
                        <div class="col-sm-1">
                        </div>
                        <div class="col-sm-6">
                            <g:submitButton name="create" class="save btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </div>
                    </div>
                </fieldset>
            </g:form>
        </div>
        <div id="list-empresa" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>ver</th>
                        <g:sortableColumn property="rut" defaultOrder="desc" title="Rut"/>
                        <g:sortableColumn property="nombre" defaultOrder="desc" title="Nombre"/>
                        <g:sortableColumn property="razonSocial" defaultOrder="desc" title="Razon Social"/>
                        <g:sortableColumn property="giro" defaultOrder="desc" title="Giro"/>
                        <g:sortableColumn property="direccion" defaultOrder="desc" title="Direccion"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="empresa" status="i" in="${empresaList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${empresa.id}">ver</a></td>
                            <td>${empresa.rut}</td>
                            <td>${empresa.nombre}</td>
                            <td>${empresa.razonSocial}</td>
                            <td>${empresa.giro}</td>
                            <td>${empresa.direccion}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${empresaCount ?: 0}" />
            </div>
        </div>
    <asset:javascript src="compite/validarut.js"/>

    </body>
</html>
