<meta name="layout" content="administrador"/>

        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index">Lista Rendiciones</g:link></li>
                <li><g:link class="create" action="create">Nueva Rendicion</g:link></li>
            </ul>
        </div>

        <div id="edit-rendicion" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="${rendicion}" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.rendicion}">
            <ul class="errors" role="alert">
            <g:eachError bean="${this.rendicion}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
            </ul>
            </g:hasErrors>

            <div class="row">
                <g:form resource="${this.rendicion}" method="PUT" >
                    <g:hiddenField name="version" value="${this.rendicion?.version}" />
                    <div class="row">
                        <div class="col s4 input-field">
                            <g:textField type="text" name="Proyecto" id="proyecto" readonly="true" value="${this.rendicion.proyecto}" />
                        </div>
                        <div class="col s4 input-field">
                            <g:textField type="text" name="Usuario" id="usuario" readonly="true" value="${this.rendicion.usuario}" />
                        </div>
                        <div class="col s4 input-field">
                            <g:textField type="text" name="Item" id="item" readonly="true" value="${this.rendicion.item}" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s6 input-field">
                            <g:textField type="text" name="tipo" id="tipo" value="${this.rendicion.tipo}"/>
                            <label for="tipo">Tipo Rendición</label>
                        </div>
                        <div class="col s6 input-field">
                            <g:textField type="text" name="nombre" id="nombre" value="${this.rendicion.nombre}"/>
                            <label for="nombre">Nombre Rendición</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s6 input-field">
                            <g:textField type="text" name="fecha" id="fecha" value="${this.rendicion.fecha}"/>
                            <label for="fecha">Fecha Rendición</label>
                        </div>
                        <div class="col s6 input-field">
                            <g:textField type="text" name="motivo" id="motivo" value="${this.rendicion.motivo}"/>
                            <label for="motivo">Motivo Rendición</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 input-field">
                            <g:textField type="text" name="recorrido" id="recorrido" value="${this.rendicion.distancia}"/>
                            <label for="recorrido">Recorrido</label>
                        </div>
                     </div>
                    <div class="row">
                        <div class="col s4 input-field">
                            <g:textField type="text" name="desde" id="desde" value="${this.rendicion.desde}" />
                            <label for="desde">Desde</label>
                        </div>
                        <div class="col s4 input-field">
                            <g:textField type="text" name="hasta" id="hasta" value="${this.rendicion.hasta}"/>
                            <label for="hasta">Hasta</label>
                        </div>
                        <div class="col s4 input-field">
                            <g:textField type="text" name="tiempo" id="tiempo" value="${this.rendicion.tiempo}"/>
                            <label for="tiempo">Tiempo</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s6 input-field">
                            <g:textField type="number" name="total" id="total" value="${this.rendicion.total}"/>
                            <label for="total">Total</label>
                        </div>
                        <div class="col s6 input-field">
                            <g:textField type="number" name="boletas" id="boletas" value="${this.rendicion.nBoleta}"/>
                            <label for="boletas">Boletas Emitidas</label>
                        </div>
                    </div>
                        <input class="save waves-effect waves-light btn col l4 offset-l4" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </g:form>
            </div>
        </div>


%{--<!DOCTYPE html>--}%
%{--<html>--}%
    %{--<head>--}%
        %{--<meta name="layout" content="main" />--}%
        %{--<g:set var="entityName" value="${message(code: 'rendicion.label', default: 'Rendicion')}" />--}%
        %{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
    %{--</head>--}%
    %{--<body>--}%
        %{--<a href="#edit-rendicion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
        %{--<div class="nav" role="navigation">--}%
            %{--<ul>--}%
                %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
                %{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
                %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
            %{--</ul>--}%
        %{--</div>--}%
        %{--<div id="edit-rendicion" class="content scaffold-edit" role="main">--}%
            %{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
            %{--<g:if test="${flash.message}">--}%
            %{--<div class="message" role="status">${flash.message}</div>--}%
            %{--</g:if>--}%
            %{--<g:hasErrors bean="${this.rendicion}">--}%
            %{--<ul class="errors" role="alert">--}%
                %{--<g:eachError bean="${this.rendicion}" var="error">--}%
                %{--<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>--}%
                %{--</g:eachError>--}%
            %{--</ul>--}%
            %{--</g:hasErrors>--}%
            %{--<g:form resource="${this.rendicion}" method="PUT">--}%
                %{--<g:hiddenField name="version" value="${this.rendicion?.version}" />--}%
                %{--<fieldset class="form">--}%
                    %{--<f:all bean="rendicion"/>--}%
                %{--</fieldset>--}%
                %{--<fieldset class="buttons">--}%
                    %{--<input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />--}%
                %{--</fieldset>--}%
            %{--</g:form>--}%
        %{--</div>--}%
    %{--</body>--}%
%{--</html>--}%
