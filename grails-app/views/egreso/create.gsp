
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="administrador" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-egreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>

    <div class="container">
        <div class="card-panel teal white-text row">
            <div id="create-egreso" class="content scaffold-create" role="main">
                <h1><g:message code="default.create.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.egreso}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.egreso}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
        </div>
    </div>


            <div>
            <div class="card-panel row">
                <g:form action="save">
                    <div class="col s6 input-field">
                        <select name="proyecto" class="browser-default" required>
                            <option value="">Proyecto</option>
                            <g:each var="proyecto" in="${compite.Proyecto.list()}">
                                <option value="${proyecto.id}">${proyecto.nombre}</option>
                            </g:each>
                        </select>
                    </div>
                    <div class="col s6 input-field">
                        <select name="usuario" class="browser-default" required>
                            <option value="">Usuario</option>
                            <g:each var="usuario" in="${compite.Usuario.list()}">
                                <option value="${usuario.id}">${usuario}</option>
                            </g:each>
                        </select>
                    </div>
                    <div class="col s12 input-field">
                        <g:textField name="aprobacion" id="aprobacion" />
                        <label for="aprobacion">Aprobación</label>
                    </div>
                    <div class="col s12 input-field">
                        <g:textField name="concepto" id="concepto" />
                        <label for="concepto">Concepto Egreso</label>
                    </div>
                    <div class="col s6 input-field">
                        <g:textField name="fechaCreacion" id="fecha" class="browser-default" />
                        <label for="fecha">Fecha Creación</label>
                    </div>
                    <div class="col s6 input-field">
                        <g:textField name="monto" id="monto" maxlength="10" />
                        <label for="monto">Monto</label>
                    </div>
                    <div class="input-field col s4">
                        <select name="sedeEnvio" id="sede" class="browser-default">
                            <option value="" disabled selected>Escoja una Sede ...</option>
                            <option value="1">Puerto Montt</option>
                            <option value="2">Valdivia</option>
                            <option value="3">Santiago</option>
                        </select>
                    </div>
                    <div class="col s4 input-field">
                        <g:textField name="tipoRendicion" id="tiporendicion" />
                        <label for="tiporendicion">Tipo Rendicion</label>
                    </div>
                    <div class="col s4 input-field btn waves-effect waves-light">
                        <g:submitButton name="create" style="width: 100%; height: 100%;"
                         class="save"  value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </div>
                </div>
                </g:form>
            </div>
        </div>



    </body>
</html>
