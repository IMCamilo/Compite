<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="administrador.base" />
        <g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <script type="text/javascript">
            // Solo permite ingresar numeros.
            function soloNumeros(e){
                var key = window.Event ? e.which : e.keyCode
                return (key >= 48 && key <= 57)
            }
        </script>
    </head>
    <body>
        <!--<a href="#list-proyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>-->
        <div id="formulario1" class="col s12">
            <div id="seleccionProyecto" class="col s12">
                <ul class="collapsible" data-collapsible="expandable" style="width:100%">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">work</i>CREAR NUEVO PROYECTO</div>
                        <div class="collapsible-body">
                            <div class="row">
                                <div id="create-proyecto" class="content scaffold-create" role="main">
                                    <div class="col s12">
                                        <!--<h3><g:message code="default.create.label" args="[entityName]" /></h3>-->
                                        <g:if test="${flash.message}">
                                            <div class="message" role="status">${flash.message}</div>
                                        </g:if>
                                        <g:hasErrors bean="${this.proyecto}">
                                            <ul class="errors" role="alert">
                                                <g:eachError bean="${this.proyecto}" var="error">
                                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                                                        <g:message error="${error}" />
                                                    </li>
                                                </g:eachError>
                                            </ul>
                                        </g:hasErrors>
                                    </div>
                                    <g:form action="save">
                                        <input name="creadoPor" value="${session.usuarioLogueado.rut}" type="hidden">
                                        <div class="col s12">
                                            <div class="input-field col s6">
                                                <label class="" for="presupuesto">Presupuesto</label>
                                                <input name="presupuesto" id="presupuesto" type="text" class="validate" required="" onKeyPress="return soloNumeros(event)">
                                            </div>
                                            <div class="input-field col s6">
                                                <label for="codigo">Codigo
                                                    <span class="required-indicator">*</span>
                                                </label>
                                                <input name="codigo" value="" required="" id="codigo" type="text">
                                            </div>
                                        </div>
                                        <div class="col s12">
                                            <div class="input-field col s6">
                                                <select name="estado" value="" required="" id="estado">
                                                    <option value="" disabled selected>Seleccione Estado</option>
                                                    <option value="ACTIVO">Activo</option>
                                                    <option value="INACTIVO">Inactivo</option>
                                                </select>
                                            </div>
                                            <div class="input-field col s6">
                                                <select name="tipo" value="" required="" id="tipo">
                                                    <option value="" disabled selected>Seleccione Tipo</option>
                                                    <option value="PUBLICO">Publico</option>
                                                    <option value="PRIVADO">Privado</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col s12">
                                            <div class="input-field col s6">
                                                <select name="empresa" value="" required="" id="empresa">
                                                    <option value="" disabled selected>Seleccione Empresa</option>
                                                    <g:each in="${empresas}">
                                                        <option value="${it.id}">${it.nombre}</option>
                                                    </g:each>
                                                </select>
                                            </div>
                                            <div class="input-field col s6">
                                                <label for="nombre">Nombre
                                                    <span class="required-indicator">*</span>
                                                </label>
                                                <input name="nombre" required="" id="nombre" type="text">
                                            </div>
                                        </div>
                                        <div class="col s12">
                                            <div class="input-field col s6">
                                                <input id="fechaCreacion" name="fechaCreacion" type="date" class="datepicker" required/>
                                                <label for="fechaCreacion">Fecha Creación</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="date" name="fechaFin" class="datepicker" id="fechaFin">
                                                <label for="fechaFin">Fecha Fin</label>
                                            </div>
                                        </div>
                                        <div class="col s12 m12">
                                            <input type="submit" value="${message(code: 'default.button.create.label', default: 'Create')}" class="btn">
                                        </div>
                                    </g:form>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!--Listado de Proyectos-->
        <div id="list-proyecto" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${proyectoList}" />

            <div class="pagination">
                <g:paginate total="${proyectoCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
