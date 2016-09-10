<%@ page import="compite.Rendicion" %>
<meta name="layout" content="administrador"/>

<div class="card-panel row">
        <div class="col-lg-12">
            <table class="table highlight table-responsive">
                <thead class="teal white-text">
                    <tr>
                        <th>Tipo</th>
                        <th>Nombre</th>
                        <th>Fecha</th>
                        <th>Motivo</th>
                        <th>Recorrido</th>
                        <th>Desde</th>
                        <th>Hasta</th>
                        <th>Tiempo</th>
                        <th>Total</th>
                        <th>Cantidad Boletas</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="black-text table-bordered">
                       <g:each var="rendicion" in="${Rendicion.list()}">
                           <tr>
                               <td>${rendicion.tipo}</td>
                               <td>${rendicion.nombre}</td>
                               <td>${rendicion.fecha}</td>
                               <td>${rendicion.motivo}</td>
                               <td>${rendicion.distancia}</td>
                               <td>${rendicion.desde}</td>
                               <td>${rendicion.hasta}</td>
                               <td>${rendicion.tiempo}</td>
                               <td>${rendicion.total}</td>
                               <td>${rendicion.nBoleta}</td>
                               <td><g:link action="show" resource="${rendicion}">Detalles</g:link></td>
                               <td><g:link action="edit" resource="${rendicion}">Editar</g:link></td>
                               <td><g:link action="delete" resource="${rendicion}">Borrar</g:link></td>
                           </tr>
                       </g:each>
                </tbody>
            </table>
        </div>
</div>