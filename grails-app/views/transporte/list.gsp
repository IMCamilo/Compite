<meta name="layout" content="administrador" />

<div class="row">
    <div class="s12 row-fluid">
        <div class="darken-4">
            <div class="card form blue-grey darken-1">
                <div class="card-action form-control">
                    <div class="table-bordered">
                        <table class="responsive-table ">
                            <thead>
                                <tr>
                                    <th>Usuario</th>
                                    <th>Nombre</th>
                                    <th>Marca</th>
                                    <th>Modelo</th>
                                    <th>Km.por Litro</th>
                                    <th>Descripcion</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <g:each in="${transportes}" var="tran">
                                <tr>
                                    <td>${tran.usuario}</td>
                                    <td>${tran.nombre}</td>
                                    <td>${tran.marca}</td>
                                    <td>${tran.modelo}</td>
                                    <td>${tran.kmPorLitro}</td>
                                    <td>${tran.descripcion}</td>
                                    <td><g:link action="edit" id="${tran.id}">Editar</g:link></td>
                                    <td><g:link action="delete" id="${tran.id}">Borrar</g:link></td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>



                        <p><g:link action="create">Nuevo transporte</g:link></p>
                        <p><g:link action="index">Volver al Inicio</g:link></p>

                </div>
            </div>
        </div>
    </div>
</div>


