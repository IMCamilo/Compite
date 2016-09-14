

<%@ page import="org.apache.tools.ant.property.GetProperty; org.apache.tools.ant.taskdefs.Get" %>
<title>COMPITE - Reportes de Rendiciones</title>
<meta name="layout" content="mainadministrador"/>


    <g:form method="GET" action="reportes">
        <label>Proyecto</label>
        <select name="proyecto" required id="proyecto">
            <option value="">Proyecto</option>
            <g:each var="proyecto" in="${compite.Proyecto.list()}">
                <option value="${proyecto.id.toString()}">${proyecto.nombre}</option>
            </g:each>
        </select>

        <button>Buscar</button>
    </g:form>

<g:form>

</g:form>

<div class="section">
    <div class="col l12">
        <table id="table">
            <thead class="teal white-text">
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
            <tbody class="black-text">
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
</div>




