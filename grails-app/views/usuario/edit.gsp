<meta name="layout" content="auditoria/auditoria.main"/>
<g:hasErrors bean="${this.autor}">
    <ul class="errors" role="alert">
        <g:eachError bean="${this.autor}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<g:form resource="${this.usuario}" method="PUT">
    <g:hiddenField name="version" value="${this.usuario?.version}" />
    rut: <f:input property="rut" bean="usuario"/><br />
    nombres: <f:input property="nombre" bean="usuario"/><br />
    paterno: <f:input property="paterno" bean="usuario"/><br />
    materno: <f:input property="materno" bean="usuario"/><br />
    direccion: <f:input property="direccion" bean="usuario"/><br />
    correo: <f:input property="correo" bean="usuario"/><br />
    telefono: <f:input property="telefono" bean="usuario"/><br />
    clave: <f:input property="clave" bean="usuario"/><br />
    tipo: <f:input property="tipo" bean="usuario"/><br />
    <fieldset class="buttons">
        <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
    </fieldset>
</g:form>

