<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="administrador.base" />
        <g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-proyecto" class="content scaffold-edit" role="main">
            <h3><g:message code="default.edit.label" args="[entityName]" /></h3>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.proyecto}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.proyecto}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <div class="row">
                <g:form resource="${this.proyecto}" method="PUT">
                <g:hiddenField name="version" value="${this.proyecto?.version}" />
                <g:hiddenField name="creadoPor" value="${this.proyecto?.creadoPor}" />
                    <div class="col s12">
                        <div class="input-field col s6">
                            <label class="" for="presupuesto">Presupuesto</label>
                            <input name="presupuesto" id="presupuesto" value="${proyecto.presupuesto}" type="text" class="validate" required="" onKeyPress="return soloNumeros(event)">
                        </div>
                        <div class="input-field col s6">
                            <label for="codigo">Codigo
                                <span class="required-indicator">*</span>
                            </label>
                            <input name="codigo" value="${proyecto.codigo}" required="" id="codigo" type="text" class="validate">
                        </div>
                    </div>
                    <div class="col s12">
                        <div class="input-field col s6">
                            <select name="estado" required="" id="estado" class="validate">
                                <g:if test="${proyecto.estado == 'ACTIVO'}">
                                    <option value="${proyecto.estado}" selected>Activo</option>
                                    <option value="${proyecto.estado}">--</option>
                                </g:if>
                                <g:elseif test="${proyecto.estado == 'INACTIVO'}">
                                    <option value="${proyecto.estado}" selected>Inactivo</option>
                                    <option value="${proyecto.estado}">--</option>
                                </g:elseif>
                                <option value="ACTIVO">Activo</option>
                                <option value="INACTIVO">Inactivo</option>
                            </select>
                        </div>
                        <div class="input-field col s6">
                            <select name="tipo" required="" id="tipo" class="validate">
                                <g:if test="${proyecto.tipo == 'PUBLICO'}">
                                    <option value="${proyecto.tipo}" selected>Publico</option>
                                    <option value="${proyecto.tipo}">--</option>
                                </g:if>
                                <g:elseif test="${proyecto.tipo == 'PRIVADO'}">
                                    <option value="${proyecto.tipo}" selected>Privado</option>
                                    <option value="${proyecto.tipo}">--</option>
                                </g:elseif>
                                <option value="PUBLICO">Publico</option>
                                <option value="PRIVADO">Privado</option>
                            </select>
                        </div>
                    </div>
                    <div class="col s12">
                        <div class="input-field col s6">
                            <select name="empresa" required="" id="empresa">
                                <option value="${proyecto.empresaId}" disabled selected>${nombreEmpresa}</option>
                                <option value="${proyecto.empresaId}">--</option>
                                <g:each in="${empresas}">
                                    <option value="${it.id}">${it.nombre}</option>
                                </g:each>
                            </select>
                        </div>
                        <div class="input-field col s6">
                            <label for="nombre">Nombre
                                <span class="required-indicator">*</span>
                            </label>
                            <input name="nombre" value="${proyecto.nombre}" required="" id="nombre" type="text" class="validate">
                        </div>
                    </div>
                    <div class="col s12">
                        <div class="input-field col s6">
                            <input id="fechaCreacion" value="${proyecto.fechaCreacion}" name="fechaCreacion" type="date" class="datepicker" required/>
                            <!--<label for="fechaCreacion">Fecha Creación</label>-->
                        </div>
                        <div class="input-field col s6">
                            <input type="date" value="${proyecto.fechaFin}" name="fechaFin" class="datepicker" id="fechaFin">
                            <!--<label for="fechaFin">Fecha Fin</label>-->
                        </div>
                    </div>
                    <div class="col s12 m12">
                        <input class="save btn" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </div>
                    <div class="col s12 m12">
                        <br>
                        <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
                    </div>
                </g:form>
            </div>
        </div>
    </body>
</html>
