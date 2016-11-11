<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-usuario" class="content scaffold-show" role="main">
            <h1>Datos del Usuario</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="errors" role="status">${flash.error}</div>
            </g:if>
            <g:each in="${usuario}">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Tipo :</label>
                        <label style="color: dimgray">
                            <g:if test="${it.tipo == 2}">
                                Ingeniero
                            </g:if>
                            <g:else>
                                Administrador
                            </g:else>
                        </label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Rut :</label>
                        <label style="color: dimgray">${it.rut}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Nombre :</label>
                        <label style="color: dimgray">${it.nombres}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Paterno :</label>
                        <label style="color: dimgray">${it.paterno}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Materno :</label>
                        <label style="color: dimgray">${it.materno}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Dirección :</label>
                        <label style="color: dimgray">${it.direccion}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Correo :</label>
                        <label style="color: dimgray">${it.correo}</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <label>Teléfono :</label>
                        <label style="color: dimgray">${it.telefono}</label>
                    </div>
                    <div class="col-sm-6">
                        <label>Transporte :</label>
                        <label style="color: dimgray">
                            <g:if test="${it.transporte.isEmpty()}">
                                Sin transporte
                            </g:if>
                            <g:else>
                                <a data-toggle="modal" data-target="#myModal">Ver Vehículo</a>
                            </g:else>
                        </label>
                    </div>
                </div>
                <g:if test="${!it.asignacion.isEmpty()}">
                    <div class="col-md-12">
                        <div class="col-sm-6">
                            <label>Asignación :</label>
                            <label style="color: dimgray">
                                <g:link controller="asignacion" action="show" id="${it.asignacion.id}">Asignación</g:link>
                            </label>
                        </div>
                    </div>
                </g:if>
            </g:each>
            <g:form resource="${this.usuario}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="list" action="index">Volver al Listado</g:link>
                    <g:link class="edit" action="edit" resource="${this.usuario}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Vehículo asignado para : ${usuario.nombres} ${usuario.paterno} ${usuario.materno}</h4>
                    </div>
                    <div class="modal-body">
                        <g:each in="${transporte}">
                            <div class="col-md-12">
                                <div class="col-sm-6">
                                    <label>Tipo :</label>
                                    <label style="color: dimgray">${it.tipo}</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Descripción :</label>
                                    <label style="color: dimgray">${it.descripcion}</label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-sm-6">
                                    <label>Marca :</label>
                                    <label style="color: dimgray">${it.marca}</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Kms Por Litro :</label>
                                    <label style="color: dimgray">${it.kmPorLitro}</label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-sm-6">
                                    <label>Modelo :</label>
                                    <label style="color: dimgray">${it.modelo}</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Combustible :</label>
                                    <label style="color: dimgray">${it.combustible}</label>
                                </div>
                            </div>
                        </g:each>
                        <g:form resource="${this.transporte}" method="DELETE">
                            <fieldset class="">

                            </fieldset>
                        </g:form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalLabel">Vehículo asignado para : ${usuario.nombres} ${usuario.paterno} ${usuario.materno}</h4>
                    </div>
                    <div class="modal-body">
                        <g:each in="${asignacion}">
                            <div class="col-md-12">
                                <div class="col-sm-6">
                                    <label>Fecha Creación :</label>
                                    <label style="color: dimgray">${formatDate(format:"dd/MM/yyyy", date: it.fechaCreacion)}</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Detalle :</label>
                                    <label style="color: dimgray">${it.detalle}</label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-sm-6">
                                    <label>Usuario :</label>
                                    <label style="color: dimgray">${nombreUsuario}</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Programa :</label>
                                    <label style="color: dimgray">${datosPrograma}</label>
                                </div>
                            </div>
                        </g:each>
                        <g:form resource="${this.transporte}" method="DELETE">
                            <fieldset class=""></fieldset>
                        </g:form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
