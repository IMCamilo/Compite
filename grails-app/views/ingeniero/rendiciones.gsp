<meta name="layout" content="ingeniero" />
    <h4>Muestra las rendiciones correspondientes a este usuario</h4>
        <div class="card-panel">
                <div class="col lg 12">
                    <table class="table highlight responsive-table">
                        <thead class="teal white-text">
                            <tr>
                                <th>usuario</th>
                                <th>Tipo</th>
                                <th>Nombre</th>
                                <th>Fecha</th>
                                <th>Motivo</th>
                                <th>Distancia</th>
                                <th>Desde</th>
                                <th>Hasta</th>
                                <th>Tiempo</th>
                                <th>Total</th>
                                <th>Cantidad Boletas</th>
                                <th>Descripcion</th>
                            </tr>
                        </thead>
                        <tbody class="black-text table-bordered">
                        <g:each var="lista" in="${compite.Rendicion.executeQuery("from Rendicion r where r.usuario = usuario.id")}" >
                            <tr>
                                <td>${lista.usuario}</td>
                                <td>${lista.tipo}</td>
                                <td>${lista.nombre}</td>
                                <td>${lista.fecha}</td>
                                <td>${lista.motivo}</td>
                                <td>${lista.distancia}</td>
                                <td>${lista.desde}</td>
                                <td>${lista.hasta}</td>
                                <td>${lista.tiempo}</td>
                                <td>${lista.total}</td>
                                <td>${lista.nBoleta}</td>
                                <td>${lista.descripcion}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
        </div>