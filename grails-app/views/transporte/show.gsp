<meta name="layout" content="administrador" />

<div class="row">
    <div class="s12 row-fluid">
        <div class="darken-4">
            <div class="card form blue-grey darken-1">
                <div class="card-action form-control">
                    Usuario     : ${transporte.id} <br/>
                    Nombre      : ${transporte.nombre}<br/>
                    Marca       : ${transporte.marca}<br/>
                    Modelo      : ${transporte.modelo}<br/>
                    Km.por Litro: ${transporte.kmPorLitro}<br/>
                    Descripcion : ${transporte.descripcion}<br/>
                    <g:link action="edit" id="${transporte.id}">Editar</g:link><br/>
                    <g:link action="delete" id="${transporte.id}">Borrar</g:link><br/>
                </div>
            </div>
        </div>
    </div>
</div>

