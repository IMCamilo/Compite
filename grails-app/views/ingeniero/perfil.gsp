<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>COMPITE - Crear Rendición</title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <asset:stylesheet src="compite/materialize.css" media="screen,projection"/>
    <asset:stylesheet src="compite/style.css" media="screen,projection"/>
    <asset:stylesheet src="compite/googlefonts.css"/>
    <asset:stylesheet src="compite/formularios.css"/>
    <script>
        $(document).ready(function() {
            $('.tooltipped').tooltip({
                delay: 50
            });
        });
    </script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
</head>
<body style="font-size:75%">
<div class="row" style="width:80%">
    <div class="section">
        <div id="tabs">
            <div id="formulario2" class="col s12">
                <!--aca va el formulario para crear rendiciones-->
                <ul class="collapsible" data-collapsible="expandable" style="width:100%">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">person_pip</i>MIS DATOS</div>
                        <div class="collapsible-body">
                            <div class="row">
                                <div class="col s12 m12">
                                        <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
                                        <g:form resource="${this.usuario}" method="PUT">
                                            <g:hiddenField name="version" value="${this.usuario?.version}" />
                                            <fieldset class="form">
                                                <div class="fieldcontain required col s6">
                                                    <label for="rut">Rut
                                                        <span class="required-indicator">*</span>
                                                    </label>
                                                    <input name="rut" value="${usuario.rut}" required="" maxlength="13" id="rut" type="text">
                                                </div>
                                                <div class="fieldcontain required col s6">
                                                    <label for="nombres">Nombres
                                                        <span class="required-indicator">*</span>
                                                    </label>
                                                    <input name="nombres" value="${usuario.nombres}" required="" maxlength="15" id="nombres" type="text">
                                                </div>
                                                <div class="fieldcontain required col s6">
                                                    <label for="paterno">Paterno
                                                        <span class="required-indicator">*</span>
                                                    </label>
                                                    <input name="paterno" value="${usuario.paterno}" required="" maxlength="10" id="paterno" type="text">
                                                </div>
                                                <div class="fieldcontain required col s6">
                                                    <label for="materno">Materno
                                                        <span class="required-indicator">*</span>
                                                    </label>
                                                    <input name="materno" value="${usuario.materno}" required="" maxlength="10" id="materno" type="text">
                                                </div>
                                                <div class="fieldcontain required col s6">
                                                    <label for="direccion">Direccion
                                                        <span class="required-indicator">*</span>
                                                    </label>
                                                    <input name="direccion" value="${usuario.direccion}" required="" maxlength="35" id="direccion" type="text">
                                                </div>
                                                <div class="fieldcontain required col s6">
                                                    <label for="correo">Correo
                                                        <span class="required-indicator">*</span>
                                                    </label>
                                                    <input name="correo" value="${usuario.correo}" required="" maxlength="30" id="correo" type="email">
                                                </div>
                                                <div class="fieldcontain col s6">
                                                    <label for="telefono">Telefono</label>
                                                    <input name="telefono" value="${usuario.telefono}" maxlength="15" id="telefono" type="text">
                                                </div>
                                                <div class="fieldcontain required col s6">
                                                    <label for="clave">Clave
                                                        <span class="required-indicator">*</span>
                                                    </label>
                                                    <input name="clave" value="${usuario.clave}" required="" maxlength="15" id="clave" type="text">
                                                </div>
                                                <div class="fieldcontain required col s6">
                                                    <label for="tipo">Tipo
                                                        <span class="required-indicator">*</span>
                                                    </label>
                                                    <input name="tipo" value="${usuario.tipo}" required="" id="tipo" type="number">
                                                </div>
                                            </fieldset>
                                            <fieldset class="buttons">
                                                <input class="save btn" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                            </fieldset>
                                        </g:form>

                                </div>

                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">work</i>TANSPORTE</div>
                        <div class="collapsible-body">
                            <div class="row">
                                <div class="col s6 m6">
                                    <input id="fecha" type="text" value="04/08/2016"> ITEM :

                                </div>
                                <!--LADO 2-->
                                <div class="col s12 m12">
                                    <div id="list-transporte" class="content scaffold-list" role="main">
                                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                                        <g:if test="${flash.message}">
                                            <div class="message" role="status">${flash.message}</div>
                                        </g:if>
                                        <f:table collection="${transporteList}" />
                                        <div class="pagination">
                                            <g:paginate total="${transporteCount ?: 0}" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col s12 m12">
                                    <a class="btn" onclick="Materialize.toast('RENDICIÓN DE COLACIÓN CREADA CORRECTAMENTE', 4000)">CREAR</a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <!--aca va el formulario para crear rendiciones-->
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<asset:javascript src="compite/materialize.js"/>
<asset:javascript src="compite/init.js"/>
<script>
    $(function() {
        $("#tabs").tabs();
    });
</script>
</body>
</html>