<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
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
    <g:form action="save">
        <fieldset class="form">
            <div class='fieldcontain required'>
                <label for='rut'>Rut
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="rut" value="" required="" maxlength="13" id="rut"/>
            </div>
            <div class='fieldcontain required'>
                <label for='nombres'>Nombres
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="nombres" value="" required="" maxlength="15" id="nombres"/>
            </div>
            <div class='fieldcontain required'>
                <label for='paterno'>Paterno
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="paterno" value="" required="" maxlength="15" id="paterno"/>
            </div>
            <div class='fieldcontain required'>
                <label for='materno'>Materno
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="materno" value="" required="" maxlength="15" id="materno"/>
            </div>
            <div class='fieldcontain required'>
                <label for='direccion'>Direccion
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="direccion" value="" required="" maxlength="100" id="direccion"/>
            </div>
            <div class='fieldcontain required'>
                <label for='correo'>Correo
                    <span class='required-indicator'>*</span>
                </label><input type="email" name="correo" value="" required="" maxlength="30" id="correo"/>
            </div>
            <div class='fieldcontain'>
                <label for='telefono'>Telefono</label><input type="text" name="telefono" value="" maxlength="15" id="telefono"/>
            </div>
            <div class='fieldcontain required'>
                <label for='clave'>Clave
                    <span class='required-indicator'>*</span>
                </label><input type="text" name="clave" value="" required="" maxlength="15" id="clave"/>
            </div>
            <div class='fieldcontain required'>
                <label for='tipo'>Tipo
                    <span class='required-indicator'>*</span>
                </label><input type="number" name="tipo" value="" required="" id="tipo"/>
            </div>
            <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
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
    </body>
</html>
