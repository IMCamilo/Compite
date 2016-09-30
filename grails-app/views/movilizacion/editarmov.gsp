<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainingeniero" />
    <g:set var="entityName" value="${message(code: 'movilizacion.label', default: 'Movilizacion')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
    <div id="edit-movilizacion" class="content scaffold-edit" role="main">
        <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.movilizacion}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.movilizacion}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:if test="${listaTransportes.isEmpty()}">
            <div class="col-md-12">
                <div class="col-sm-6">
                    Usuario no tiene Transportes creados
                </div>
            </div>
        </g:if>
        <g:else>
            <g:each in="${listaTransportes}">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <table>
                            <thead>
                            <tr>
                                <th>Patente</th>
                                <th>Combustible</th>
                                <th>KMs. por Litro</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${it.patente}</td>
                                <g:if test="${it.combustible == 'BENCINA93'}">
                                    <td>GAS. 93</td>
                                </g:if>
                                <g:elseif test="${it.combustible == 'BENCINA95'}">
                                    <td>GAS. 95</td>
                                </g:elseif>
                                <g:elseif test="${it.combustible == 'BENCINA97'}">
                                    <td>GAS. 97</td>
                                </g:elseif>
                                <g:elseif test="${it.combustible == 'DIESEL'}">
                                    <td>Petróleo</td>
                                </g:elseif>
                                <g:else>
                                    <td>Gas Licuado</td>
                                </g:else>
                                <td>${it.kmPorLitro}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </g:each>
        </g:else>
        <g:form action="editMov" resource="${this.movilizacion}" method="PUT">
            <g:hiddenField name="version" value="${this.movilizacion?.version}" />
            <fieldset class="form">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for='fechaCreacion'>Fecha Documento
                                <span class='required-indicator'>*</span>
                            </label>
                            <g:datePicker name="fechaCreacion" value="${movilizacion.fechaCreacion}" precision="day" years="${2016..2018}"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for='motivoEmpresa'>Item
                                <span class='required-indicator'>*</span>
                            </label>
                            <select name="tipo" required="" class="fieldcontain required">
                                <g:if test="${listaTransportes.isEmpty()}">
                                    <option value="PASAJE" selected>Pasaje</option>
                                    <option value="${movilizacion.tipo}">---</option>
                                    <option value="PASAJE">Pasaje</option>
                                </g:if>
                                <g:else>
                                    <g:if test="${movilizacion.tipo == "COMBUSTIBLE"}">
                                        <option value="COMBUSTIBLE" selected>Combustible</option>
                                    </g:if>
                                    <g:elseif test="${movilizacion.tipo == "PEAJE"}">
                                        <option value="PEAJE" selected>Peaje</option>
                                    </g:elseif>
                                    <g:elseif test="${movilizacion.tipo == "TAG"}">
                                        <option value="TAG" selected>Tag</option>
                                    </g:elseif>
                                    <g:elseif test="${movilizacion.tipo == "ESTACIONAMIENTO"}">
                                        <option value="ESTACIONAMIENTO" selected>Estacionamiento</option>
                                    </g:elseif>
                                    <g:elseif test="${movilizacion.tipo == "PASAJE"}">
                                        <option value="PASAJE" selected>Pasaje</option>
                                    </g:elseif>
                                    <option value="${movilizacion.tipo}">---</option>
                                    <option value="COMBUSTIBLE">Combustible</option>
                                    <option value="PEAJE">Peaje</option>
                                    <option value="TAG">Tag</option>
                                    <option value="ESTACIONAMIENTO">Estacionamiento</option>
                                    <option value="PASAJE">Pasaje</option>
                                </g:else>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for='motivoEmpresa'>Motivo/Empresa
                                <span class='required-indicator'>*</span>
                            </label>
                            <input value="${movilizacion.motivoEmpresa}"  type="text" name="motivoEmpresa" maxlength="40" required="" id="motivoEmpresa" placeholder="Describa motivo de la movilización"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for='direccion'>Direccion
                                <span class='required-indicator'>*</span>
                            </label>
                            <input value="${movilizacion.direccion}" type="text" name="direccion" required="" id="direccion" maxlength="60" placeholder="Ingrese la dirección"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for='concepto'>Total
                                <span class='required-indicator'>*</span>
                            </label>
                            <input value="${movilizacion.precio}" type="text" name="precio" required="" id="precio" max="100000" onkeypress="return isNumber(event)" placeholder="Total de boleta"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for='distancia'>Distancia(kmtrs)/Tiempo(hrs)
                                <span class='required-indicator'>*</span>
                            </label>
                            <input value="${movilizacion.distancia}" type="text" name="distancia" required="" id="distancia" max="100000" onkeypress="return isNumber(event)" placeholder="Ingrese la distancia total"/>
                        </div>
                    </div>
                </div>
            </fieldset>
            <fieldset class="buttons">
                <g:link class="list" action="nuevamovilizacion">Volver al Listado</g:link>
                <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'editguardar')}" />
            </fieldset>
        </g:form>
    </div>
</body>
</html>