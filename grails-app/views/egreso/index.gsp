<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:form controller="egreso" action="index">
        <div class="col-sm-4">
            <div class="fieldcontain required">
            <label for="programa">Programa
                <span class="required-indicator">*</span>
            </label>
            <select name="programa" id="programa">
                <option value="" disabled selected>Seleccione un programa</option>
                <g:each var="program" in="${programas}">
                    <option value="${program.id}">${program.nombre}</option>
                </g:each>
            </select>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="fieldcontain required">
                <label for="aprobacion">Buscar Por:
                    <span class="required-indicator">*</span>
                </label>
                <select name="aprobacion" id="aprobacion">
                    <option value="" disabled selected>---Aprobación---</option>
                    <option value="SI">Si</option>
                    <option value="NO">No</option>
                    <option value="AUDITADA">Auditada</option>
                </select>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="fieldcontain required">
                <g:submitButton name="create" class="btn btn-primary" value="Buscar"></g:submitButton>
            </div>
        </div>
    </g:form>
    <form action="" id="formid">
        <div id="dialog" style="display: none;">
            <p><br>Debe Seleccionar al menos un Egreso</p>
        </div>
        <div id="list-egreso" class="content scaffold-list" role="main">
            <h1>Listado de Egresos</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>Detalles</th>
                        <th>Movilizaciones</th>
                        <g:sortableColumn property="programa" defaultOrder="desc" title="Programa"/>
                        <g:sortableColumn property="concepto" defaultOrder="desc" title="Concepto"/>
                        <g:sortableColumn property="aprobacion" defaultOrder="desc" title="Aprobación"/>
                        <g:sortableColumn property="monto" defaultOrder="desc" title="Monto"/>
                        <g:sortableColumn property="tipoDocumento" defaultOrder="desc" title="Tipo Documento"/>
                        <g:sortableColumn property="pagadoA" defaultOrder="desc" title="Pagado a"/>
                        <g:sortableColumn property="usuario" defaultOrder="desc" title="Rendido Por"/>
                        <th>Rendición</th>
                        <th>Seleccionar</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="egreso" status="i" in="${egresoList}">
                        <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <g:if test="${params.id==null}">
                                <td><a href="show/${egreso.id}">Ver</a></td>
                                <g:if test="${egreso.movilizacion.isEmpty()}">
                                    <td>No tiene movilizaciones</td>
                                </g:if>
                                <g:else>
                                    <td><a href="index/${egreso.id}">Ver movilizaciones</a></td>
                                </g:else>
                            </g:if>
                            <g:else>
                                <td><a href="../show/${egreso.id}">Ver</a></td>
                                <g:if test="${egreso.movilizacion.isEmpty()}">
                                    <td>No tiene movilizaciones</td>
                                </g:if>
                                <g:else>
                                    <td><a href="../index/${egreso.id}">Ver movilizaciones</a></td>
                                </g:else>
                            </g:else>
                            <td>${egreso.programa.nombre}</td>
                            <td>${egreso.concepto}</td>
                            <td>${egreso.aprobacion}</td>
                            <td>$ ${egreso.monto}</td>
                            <td>${egreso.tipoDocumento}</td>
                            <td>${egreso.pagadoA}</td>
                            <td>${egreso.usuario.nombres} ${egreso.usuario.paterno} ${egreso.usuario.materno}</td>
                            <g:if test="${egreso.rendicion == null}">
                                <td><div align="center">-</div></td>
                            </g:if>
                            <g:else>
                                <td>
                                    <div align="center"><g:link target="_blank" controller="rendicion" action="show" id="${egreso.rendicion.id}">Nº ${egreso.rendicion.id}</g:link></div>
                                </td>
                            </g:else>
                            <td>
                                <g:if test="${egreso.aprobacion == "SI" && egreso.rendicion == null}">
                                    <input type="checkbox" id="egresoId" name="egresoIds[]" value="${egreso.id}"/>
                                </g:if>
                                <g:else>
                                    <input type="checkbox" disabled/>
                                </g:else>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${egresoCount ?: 0}" />
            </div>
            <div class="col-sm-6">
                <a id="enviar" href="#"class="button">Crear Rendición</a>
            </div>
        </div>
    </form>
    <a id="clickButton" data-toggle="modal" data-target=".bs-example-modal-lg"></a>
    <g:if test="${params.id!=null}">
        <div id="myModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <table>
                        <thead>
                            <tr>
                                <td>Fecha</td>
                                <td>Motivo/empresa</td>
                                <td>Direción</td>
                                <td>Distancia</td>
                                <td>Tipo</td>
                                <td>Precio</td>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each var="movilizacion" status="i" in="${movsList}">
                                <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                                    <td>${formatDate(format:"dd/MM/yyyy", date: movilizacion.fechaCreacion)}</td>
                                    <td>${movilizacion.motivoEmpresa}</td>
                                    <td>${movilizacion.direccion}</td>
                                    <td>${movilizacion.distancia}</td>
                                    <td>${movilizacion.tipo}</td>
                                    <td>${movilizacion.precio}</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </g:if>
    <asset:javascript src="compite/jquery-2.1.1.min.js"/>
    <script type="application/javascript">
    $(document).ready(function() {
        $('#enviar').click(function() {
            var selected = '';
            $('#formid input[type=checkbox]').each(function(){
                if (this.checked) {
                    selected += $(this).val()+',';
                }
            });

            if (selected != '') {
                var egresos = selected.substring(0, selected.length - 1);
                console.log("Egresos seleccionados: "+egresos)
                window.location = "crearRendicion?egresos="+egresos;
            } else {
                console.log("Nada seleccionado")
                sweetAlert("Selecciona un Egreso...", "Debes seleccionar al menos un Egreso", "error");

            }
            return false;
        });

        window.onload = function() {
            document.getElementById('clickButton').click();
        }
    });
    </script>
</body>
</html>
