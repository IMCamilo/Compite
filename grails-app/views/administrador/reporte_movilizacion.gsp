<%@ page import="org.apache.tools.ant.property.GetProperty; org.apache.tools.ant.taskdefs.Get" %>
<title>COMPITE - Reportes de Rendiciones</title>
<meta name="layout" content="mainadministrador"/>

<h1>Reporte de Movilizacion</h1>

<g:form>
    <div id="vehiculo">
        <label for="vehiculo">Dueño Vehiculo</label>
        <input type="text" placeholder="Vehiculo">
    </div>
    <div id="mantencion">
        <label for="mantencion">Mantencion Vehiculo</label>
        <input type="text" placeholder="Mantencion">
    </div>
    <div id="seguro">
        <label for="seguro">Seguro Automóvil</label>
        <input type="text" placeholder="Seguro Automovil" >
    </div>
    <div id="valor_bencina">
        <label for="valor_bencina">Valor Bencina</label>
        <input type="text" placeholder="Valor Bencina" >
    </div>
    <div id="valor_uf" >
        <label for="valor_uf">Valor UF</label>
        <input type="text" placeholder="Valor UF" >
    </div>
    <div id="rendimiento">
        <label for="rendimiento">Rendimiento Promedio</label>
        <input type="text" placeholder="Rendimiento">
    </div>
    <div id="peso_km">
        <label for="peso_km">$ Por Km.</label>
        <input type="text" placeholder="$ por Km.">
    </div>
    <div id="UF_km">
        <label for="uf_km">UF por Km</label>
        <input type="text" placeholder="UF por KM">
    </div>
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
</g:form>

