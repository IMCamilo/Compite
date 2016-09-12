<meta name="layout" content="base"/>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.auditoria}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.auditoria}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <div class="row">
    <g:form class="col s12" action="save">
        <div class="input-field col s4">
            <select name="usuario" value="" class="browser-default" required>
                <option value="">Seleccione Usuario</option>
                <g:each var="usuario" in="${compite.Usuario.list()}">
                    <option value="${usuario.id}">${usuario}</option>
                </g:each>
            </select>
        </div>
        <div class="input-field col s4">
            <select name="proyecto" value="" class="browser-default" required>
                <option value="">Seleccione Proyecto</option>
                <g:each var="proyecto" in="${compite.Proyecto.list()}">
                    <option value="${proyecto.id}">${proyecto.nombre}</option>
                </g:each>
            </select>
        </div>
        <div class="input-field col s4">
            <select name="estado" value="" required="" required="">
                <option value="" disabled selected>Seleccione Estado</option>
                <option value="1">Estado 1</option>
                <option value="2">Estado 2</option>
            </select>
            <label>Estado</label>
        </div>
        <div class="input-field col s12">
        <textarea name="descripcion" required="" id="textarea1" class="materialize-textarea"></textarea>
        <label for="textarea1">Descripción</label>
        </div>
        <div class="fieldcontain required">
        <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden"></div>
    <g:submitButton name="create" class="save btn waves-effect waves-light" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </g:form>
    </div>
    <f:table collection="${auditoriaList}" />
    <div class="pagination">
        <g:paginate total="${auditoriaCount ?: 0}" />
    </div>
