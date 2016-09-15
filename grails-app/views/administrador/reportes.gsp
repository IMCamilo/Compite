

<%@ page import="org.apache.tools.ant.property.GetProperty; org.apache.tools.ant.taskdefs.Get" %>
<title>COMPITE - Reportes de Rendiciones</title>
<meta name="layout" content="mainadministrador"/>

    <g:form method="GET" action="reportes">
        <div>
            <label>Proyecto</label>
            <select class="form-control" name="proyecto" required id="proyecto">
                <option value="">Proyecto</option>
                <g:each var="proyecto" in="${compite.Proyecto.list()}">
                    <option value="${proyecto.id.toString()}">${proyecto.nombre}</option>
                </g:each>
            </select>
        </div>
        <br>
        <button >Buscar</button>
    </g:form>

<form>
    <br>
    <br>
    <div>
        <h1>Reporte de Rendicion de Gastos</h1>
        <div id="fecha" class="col-md-6">
            <label for="fecha">FECHA RENDICION</label>
            <input type="text" placeholder="Fecha Rendicion" class="form-control">
        </div>
        <div id="sede" class="col-md-6">
            <label for="sede" class="col-md-6">SEDE ENVIO</label>
            <input class="form-control" type="text" placeholder="Sede Envio">
        </div>
        <div id="nombre" class="col-md-12">
            <label for="nombre">NOMBRE RESPONSABLE</label>
            <input class="form-control"  type="text" placeholder="Nombre Responsable">
        </div>
        <div id="rut" class="col-md-6">
            <label for="rut">RUT</label>
            <input class="form-control" type="text" placeholder="RUT">
        </div>
        <div id="tipo" class="col-md-6">
            <label for="nombre">TIPO RENDICION</label>
            <input class="form-control" type="text" placeholder="Tipo Rendicion">
        </div>
    </div>
</form>

<br>
<br>

    <div>

        <table>
            <thead>
            <tr>
                <th>Proyecto ID</th>
                <th>Numero Documento</th>
                <th>Fecha Creacion</th>
                <th>Rut Empresa</th>
                <th>Pagado A</th>
                <th>Centro de Costos</th>
                <th>Item Presupuestario</th>
                <th>Concepto</th>
                <th>Monto</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="reporte" in="${compite.Egreso.executeQuery("from Egreso where proyecto = ${params.proyecto}")}" >
                <tr>
                    <td>${reporte.proyectoId}</td>
                    <td>${reporte.nDocumento}</td>
                    <td>${reporte.fechaCreacion.dateString}</td>
                    <td>${reporte.rutEmpresa}</td>
                    <td>${reporte.pagadoA}</td>
                    <td>${reporte.item.centroCosto}</td>
                    <td>${reporte.item.itemPresupuestario} ${reporte.item.descripcion}</td>
                    <td>${reporte.concepto}</td>
                    <td>${reporte.monto}</td>
                </tr>
            </g:each>
            </tbody>
        </table>

    </div>
<br>
<br>
<br>

<h1>Reporte de Movilizacion</h1>

<form>
    <div id="vehiculo" class="col-md-6">
        <label for="vehiculo">Dueño Vehiculo</label>
        <input type="text" placeholder="Vehiculo" class="form-control">
    </div>
    <div id="mantencion" class="col-md-6">
        <label for="mantencion">Mantencion Vehiculo</label>
        <input type="text" placeholder="Mantencion" class="form-control">
    </div>
    <div id="seguro" class="col-md-6">
        <label for="fecha">Seguro Automóvil</label>
        <input type="text" placeholder="Seguro Automovil" class="form-control">
    </div>
    <div id="valor_bencina" class="col-md-6">
        <label for="valor_bencina">Valor Bencina</label>
        <input type="text" placeholder="Valor Bencina" class="form-control">
    </div>
    <div id="valor_uf" class="col-md-6">
        <label for="valor_uf">Valor UF</label>
        <input type="text" placeholder="Valor UF" class="form-control">
    </div>
    <div id="rendimiento" class="col-md-6">
        <label for="rendimiento">Rendimiento Promedio</label>
        <input type="text" placeholder="Rendimiento" class="form-control">
    </div>
    <div id="peso_km" class="col-md-6">
        <label for="peso_km">$ Por Km.</label>
        <input type="text" placeholder="$ por Km." class="form-control">
    </div>
    <div id="UF_km" class="col-md-6">
        <label for="uf_km">UF por Km</label>
        <input type="text" placeholder="UF por KM" class="form-control">
    </div>
    <br>
    <br>
</form>
<div>
    <table>
        <thead>
            <tr>
                <th>Numero</th>
                <th>Fecha</th>
                <th>Motivo / Empresa </th>
                <th>Dirección</th>
                <th>Distancia Ida / Vuelta</th>
                <th>Estacionamiento / TAG / Peaje / Metro</th>
            </tr>
        </thead>
        <tbody>
            <g:each var="movil" in="${compite.Movilizacion.executeQuery("from Movilizacion where proyecto = ${params.proyecto}")}" >
                <tr>
                    <td>${movil.id}</td>
                    <td>${movil.fechaCreacion}</td>
                    <td>${movil.motivoEmpresa}</td>
                    <td>${movil.direccion}</td>
                    <td>${movil.distancia}</td>
                    <td>${movil.egresomov.egreso.monto}</td>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>

