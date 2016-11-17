<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainingeniero" />
    <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <script>
        function comprobarClave(){
            clave1 = document.f1.clave.value;
            clave2 = document.f1.clave2.value;
            if (clave1 == clave2) {
                console.log("las claves son iguales")
            } else {
                alert("Las dos claves son distintas...\nFavor revisar")
            }
        }
    </script>
</head>
<body>
<a href="#edit-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div id="edit-usuario" class="content scaffold-edit" role="main">
    <h1>Editar Perfil de Usuario</h1>
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
    <g:form action="update" resource="${this.usuario}" method="PUT" name="f1">
        <g:hiddenField name="version" value="${this.usuario?.version}" />
        <fieldset class="form">
            <h3>RUT</h3>
            <label>${usuario.rut}</label>
            <br>
            <h3>Nombres</h3>
            <input type="text" name="nombres" value="${usuario.nombres}" required="" maxlength="30" id="nombres"/>
            <br>
            <h3>Paterno</h3>
            <input type="text" name="paterno" value="${usuario.paterno}" required="" maxlength="20" id="paterno"/>
            <br>
            <h3>Materno</h3>
            <input type="text" name="materno" value="${usuario.materno}" required="" maxlength="20" id="materno"/>
            <br>
            <h3>Dirección</h3>
            <input type="text" name="direccion" value="${usuario.direccion}" required="" maxlength="70" id="direccion"/>
            <br>
            <h3>Correo</h3>
            <input type="email" name="correo" value="${usuario.correo}" required="" maxlength="30" id="correo"/>
            <br>
            <h3>Telefono</h3>
            <input type="text" name="telefono" value="${usuario.telefono}" maxlength="15" id="telefono"/>
            <br>
            <input type="hidden" name="creadoPor" value="${session.usuarioLogueado.rut}" id="creadoPor"/>
        </fieldset>
        <fieldset class="buttons">
            <g:link class="volver" action="index">Volver al Inicio</g:link>
            <input class="save" onClick="comprobarClave()" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
</div>
<asset:javascript src="compite/validarut.js"/>
</body>
</html>
