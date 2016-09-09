<meta name="layout" content="auditoria/auditoria.main"/>
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
            <input name="usuario" value="" required="" type="text" id="autocomplete-input1" class="autocomplete">
            <label for="autocomplete-input1">Usuario</label>
        </div>
        <div class="input-field col s4">
            <input name="proyecto" value="" required="" type="text" id="autocomplete-input2" class="autocomplete">
            <label for="autocomplete-input2">Proyecto</label>
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
    <g:submitButton name="create" class="save btn waves-effect waves-light" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </g:form>
    </div>
    <f:table collection="${auditoriaList}" />
    <div class="pagination">
        <g:paginate total="${auditoriaCount ?: 0}" />
    </div>
