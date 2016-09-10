<%@ page import="org.apache.tools.ant.property.GetProperty; org.apache.tools.ant.taskdefs.Get" %>
<title>COMPITE - Reportes de Rendiciones</title>
<meta name="layout" content="administrador"/>

<div class="container section">

    <g:form method="GET" action="reportes">
                <label>Usuario</label>
                <select name="usuario" class="browser-default" required id="usuario">
                    <option value="">Usuario</option>
                    <g:each var="usuario" in="${compite.Usuario.list()}">
                        <option value="${usuario.id}">${usuario}</option>
                    </g:each>
                </select>

                <label>Proyecto</label>
                <select name="proyecto" class="browser-default" required id="proyecto">
                    <option value="">Proyecto</option>
                    <g:each var="proyecto" in="${compite.Proyecto.list()}">
                        <option value="${proyecto.id}">${proyecto.nombre}</option>
                    </g:each>
                </select>


        <div class="row">
            <div class="col l4 offset-l4 input-field">
                <button class="waves-effect waves-light btn">Buscar</button>
            </div>
        </div>
    </g:form>
</div>

<div class="divider"></div>

<div class="section">
    <div class="col l12">
        <table class="table highlight responsive-table bordered centered" id="table">
            <thead class="teal white-text">
            <tr>
                <th>Usuario</th>
                <th>Proyecto</th>
                <th>Tipo</th>
                <th>Nombre</th>
                <th>Fecha Creacion</th>
                <th>Motivo</th>
                <th>Kilometros Iniciales</th>
                <th>Kilometros Finales</th>
                <th>Desde</th>
                <th>Hasta</th>
                <th>Distancia</th>
                <th>Tiempo</th>
                <th>Total</th>
                <th>Cantidad Boletas</th>
                <th>Descripcion</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody class="black-text">
            <g:each var="rendicion" in="${compite.Rendicion.executeQuery("from Rendicion ") }">
                <tr>
                    <td>${rendicion.usuario}</td>
                    <td>${rendicion.proyecto}</td>
                    <td>${rendicion.tipo}</td>
                    <td>${rendicion.nombre}</td>
                    <td>${rendicion.fecha}</td>
                    <td>${rendicion.motivo}</td>
                    <td>${rendicion.kmInicial}</td>
                    <td>${rendicion.kmFinal}</td>
                    <td>${rendicion.desde}</td>
                    <td>${rendicion.hasta}</td>
                    <td>${rendicion.distancia}</td>
                    <td>${rendicion.tiempo}</td>
                    <td>${rendicion.total}</td>
                    <td>${rendicion.nBoleta}</td>
                    <td>${rendicion.descripcion}</td>
                    <td><g:link action="show" resource="${rendicion}">Detalles</g:link></td>
                    <td><g:link action="edit" resource="${rendicion}">Editar</g:link></td>
                    <td><g:link action="delete" resource="${rendicion}">Borrar</g:link></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>


