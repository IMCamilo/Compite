<meta name="layout" content="administrador" />
<div class="row">
    <div class="s12 row-fluid">
        <div class="darken-4">
            <div class="card form blue-grey darken-1">
                <div class="card-action form-control">
                    <g:form action="update" id="${transporte.id}">
                        usuario <g:select name="usuario" from="${usuarios}" optionValue="rut" optionKey="id"/><br/>
                        nombre <g:textField name="nombre" value="${transporte.nombre}"/><br/>
                        marca <g:textField name="marca" value="${transporte.marca}"/><br/>
                        modelo <g:textField name="modelo" value="${transporte.modelo}"/><br/>
                        kmPorLitro <g:textField name="kmPorLitro" value="${transporte.kmPorLitro}"/><br/>
                        descripcion <g:textField name="descripcion" value="${transporte.descripcion}"/><br/>
                        <g:actionSubmit value="Update" />
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>


