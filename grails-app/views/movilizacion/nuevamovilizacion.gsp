<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mainingeniero" />
    <g:set var="entityName" value="${message(code: 'movilizacion.label', default: 'Movilizacion')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <div id="create-movilizacion" class="content scaffold-create" role="main">
        <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
        <g:form action="verificar">
            <fieldset class="form">
                <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                <input name="programa" value="${programa}" required="" type="hidden">
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for='fechaCreacion'>Fecha Documento
                                <span class='required-indicator'>*</span>
                            </label>
                            <g:datePicker name="fechaCreacion" value="${new Date()}" precision="day" years="${2016..2018}"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for='motivoEmpresa'>Item
                                <span class='required-indicator'>*</span>
                            </label>
                            <select name="tipo" required="" class="fieldcontain required">
                                <g:if test="${listaTransportes.isEmpty()}">
                                    <option value="" disabled selected>Seleccione Documento</option>
                                    <option value="PASAJE">Pasaje</option>
                                </g:if>
                                <g:else>
                                    <option value="" disabled selected>Seleccione</option>
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
                            </label><input type="text" name="motivoEmpresa" maxlength="40" required="" id="motivoEmpresa" placeholder="Describa motivo de la movilización"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for='direccion'>Direccion
                                <span class='required-indicator'>*</span>
                            </label><input type="text" name="direccion" required="" id="direccion" maxlength="60" placeholder="Ingrese la dirección"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for="precio">Total
                                <span class='required-indicator'>*</span>
                            </label>
                            <input type="text" name="precio" required="" id="precio" max="100000" onkeypress="return isNumber(event)" placeholder="Total de boleta"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-6">
                        <div class='fieldcontain required'>
                            <label for='distancia'>Distancia(kmtrs)/Tiempo(hrs)
                                <span class='required-indicator'>*</span>
                            </label>
                            <input type="text" name="distancia" required="" id="distancia" max="100000" onkeypress="return isNumber(event)" placeholder="Ingrese la distancia total"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <br>
                </div>
                <div class="col-md-12">
                    <div class="col-sm-1">
                    </div>
                    <div class="col-sm-6">
                        <g:submitButton name="create" class="save btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </div>
                </div>
            </fieldset>
        </g:form>
    </div>
    <div id="list-movilizacion" class="content scaffold-list" role="main">
        <h1>Lista de movilizacion para proyecto: </h1>
        <table>
            <thead>
                <tr>
                    <th>ver</th>
                    <g:sortableColumn property="fecha" defaultOrder="desc" title="Fecha"/>
                    <g:sortableColumn property="motivoEmpresa" defaultOrder="desc" title="Motivo/Empresa"/>
                    <g:sortableColumn property="direccion" defaultOrder="desc" title="Dirección"/>
                    <g:sortableColumn property="distancia" defaultOrder="desc" title="Distancia"/>
                    <g:sortableColumn property="tipo" defaultOrder="desc" title="Tipo"/>
                    <g:sortableColumn property="precio" defaultOrder="desc" title="Total"/>
                </tr>
            </thead>
            <tbody>
            <g:each var="movilizacion" status="i" in="${movsList}">
                <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                    <td><a href="editarmov/${movilizacion.id}">Editar</a></td>
                    <td>${formatDate(format:"dd/MM/yyyy", date: movilizacion.fechaCreacion)}</td>
                    <td>${movilizacion.motivoEmpresa}</td>
                    <td>${movilizacion.direccion}</td>
                    <td>${movilizacion.distancia}</td>
                    <td>${movilizacion.tipo}</td>
                    <td>$ ${movilizacion.precio}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${movilizacionCount ?: 0}" />
        </div>
    </div>
</body>
</html>
