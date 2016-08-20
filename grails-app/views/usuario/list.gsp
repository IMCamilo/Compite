<meta name="layout" content="auditoria/auditoria.main"/>

    <table class="striped">
        <thead>
            <tr>
                <th data-field="rut">RUT</th>
                <th data-field="nombre">Nombres / Apellidos</th>
                <th data-field="correo">Correo</th>
                <th data-field="telefono">Teléfono</th>
                <th data-field="tipo">Tipo</th>
                <th data-field="action"></th>
            </tr>
        </thead>
        <tbody>
        <g:each in="${usuarios}" var="usuario">
            <tr>
                <td>${usuario.rut}</td>
                <td>${usuario.nombres} ${usuario.paterno}</td>
                <td>${usuario.correo}</td>
                <td>${usuario.telefono}</td>
                <td>${usuario.tipo}</td>
                <td>
                    <!-- Esto también corrije los buttons normales donde hay que hacer click en el texto y no en el boton en si para que funcione -->
                    <g:link class="btn-floating btn-sm waves-effect waves-light green" action="show" id="${usuario.id}"><i class="material-icons">visibility</i></g:link>
                    <g:link class="btn-floating btn-sm waves-effect waves-light light-blue" action="edit" id="${usuario.id}"><i class="material-icons">edit</i></g:link>
                    <g:link class="btn-floating btn-sm waves-effect waves-light red" action="delete" id="${usuario.id}"><i class="material-icons">delete</i></g:link>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
<p class="red-text">Nota: Es necesario encontrar una función para ordenar.</p>