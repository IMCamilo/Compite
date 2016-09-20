<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <script>
            function comprobarClave(){
                clave1 = document.f1.clave.value
                clave2 = document.f1.clave2.value
                if (clave1 == clave2) {
                    console.log("las claves son iguales")
                } else {
                    alert("Las dos claves son distintas...\nFavor revisar")
                }
            }
        </script>
    </head>
    <body>
        <div id="create-usuario" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.usuario}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.usuario}" var="error"><li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save" name="f1">
        <fieldset class="form">
            <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
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
                        <label for="nombres">Nombres
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="nombres" required="" maxlength="50" id="nombres" onkeypress="return soloLetras(event)"/>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="paterno">Apellido Paterno
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="paterno" required="" maxlength="100" id="paterno" onkeypress="return soloLetras(event)"/>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="materno">Apellido Materno
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="materno" required="" maxlength="100" id="materno" onkeypress="return soloLetras(event)"/>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="direccion">Dirección
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="direccion" required="" placeholder="Region/Comuna/Area/Calle/Numero" maxlength="100" id="direccion"/>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="correo">Correo
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="email" name="correo" required="" placeholder="Ej: correo@dominio.cl" maxlength="50" id="correo" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"/>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="telefono">Teléfono
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="telefono" maxlength="15" id="telefono" onkeypress="return isNumber(event)"/>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="tipo">Tipo
                            <span class="required-indicator">*</span>
                        </label>
                        <select name="tipo" required="" id="tipo" type="number">
                            <option value="" disabled selected>Seleccione Tipo de Usuario</option>
                            <option value="1">Administrador</option>
                            <option value="2">Ingeniero</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="clave">Contraseña
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="password" name="clave" required="" maxlength="15" id="clave"/>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="fieldcontain required">
                        <label for="clave2">Repita Contraseña
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="password" name="clave2" required="" maxlength="15" id="clave2"/>
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
                    <g:submitButton name="create" class="save btn btn-success" onClick="comprobarClave()" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </div>
            </div>
        </fieldset>
    </g:form>
</div>
        <div id="list-usuario" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>ver</th>
                        <g:sortableColumn property="rut" defaultOrder="desc" title="Rut"/>
                        <g:sortableColumn property="nombres" defaultOrder="desc" title="Nombres"/>
                        <g:sortableColumn property="paterno" defaultOrder="desc" title="Apellido Paterno"/>
                        <g:sortableColumn property="materno" defaultOrder="desc" title="Apellido Materno"/>
                        <g:sortableColumn property="telefono" defaultOrder="desc" title="Telefono"/>
                        <g:sortableColumn property="correo" defaultOrder="desc" title="Correo"/>
                        <g:sortableColumn property="direccion" defaultOrder="desc" title="Dirección"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="usuario" status="i" in="${usuarioList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${usuario.id}">ver</a></td>
                            <td>${usuario.rut}</td>
                            <td>${usuario.nombres}</td>
                            <td>${usuario.paterno}</td>
                            <td>${usuario.materno}</td>
                            <td>${usuario.telefono}</td>
                            <td>${usuario.correo}</td>
                            <td>${usuario.direccion}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${usuarioCount ?: 0}" />
            </div>
        </div>
    <asset:javascript src="compite/validarut.js"/>

    </body>
</html>
