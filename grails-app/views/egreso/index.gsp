<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mainadministrador" />
        <g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
    <g:form controller="egreso" action="index">
        <div class="col-sm-6">
            <div class="fieldcontain required">
                <label for="region">Región
                    <span class="required-indicator">*</span>
                </label>
                <select name="programa" value="" required="" id="programa">
                    <option value="" disabled selected>Seleccione un programa</option>
                    <g:each var="program" in="${programas}">
                        <option value="${program.id}">${program.nombre}</option>
                    </g:each>
                </select>
            </div>
        </div>
        <div class="col-sm-6">
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
                    <th>Ver detalles</th>
                    <th>Movilizaciones</th>
                    <g:sortableColumn property="programa" defaultOrder="desc" title="Programa"/>
                    <g:sortableColumn property="concepto" defaultOrder="desc" title="Concepto"/>
                    <g:sortableColumn property="aprobacion" defaultOrder="desc" title="Aprobación"/>
                    <%--<g:sortableColumn property="tipoMoneda" defaultOrder="desc" title="Tipo Moneda"/>--%>
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
                        <td><a href="show/${egreso.id}">ver</a></td>
                        <td><a href="show/${egreso.id}">ver movilizaciones</a></td>
                        <td>${egreso.programa.nombre}</td>
                        <td>${egreso.concepto}</td>
                        <td>${egreso.aprobacion}</td>
                        <%--<td>
                            <g:if test="${egreso.tipoMoneda == 'CLP'}">
                                Pesos Chilenos
                            </g:if>
                            <g:elseif test="${egreso.tipoMoneda == 'USD'}">
                                Dolar Américano
                            </g:elseif>
                            <g:else>
                                Euro
                            </g:else>
                        </td>--%>
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
<asset:javascript src="compite/jquery-2.1.1.min.js"/>
<asset:javascript src="compite/validarut.js"/>
<asset:javascript src="compite/typeahead.bundle.js"/>

<script type="application/javascript">
$(document).ready(function() {
    $('#enviar').click(function(){
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
            /*$(function () {
                $("#dialog").dialog({
                    title: "Compite - Rendición",
                    width: 280,
                });
            });*/
            alert("Debe seleccionar al menos un Egreso");
        }
        return false;
    });
});
</script>
</body>
</html>
