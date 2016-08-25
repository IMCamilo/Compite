<meta name="layout" content="administrador" />
<div class="row">
    <div class="s12 row-fluid">
        <div class="darken-4">
            <div class="card form blue-grey darken-1">
                <div class="card-action form-control">
                    <g:form action="save">
                        <p>Usuario <g:select name="usuario" from="${usuarios}" optionValue="rut" optionKey="id"/></p>
                        <p>Nombre <g:textField name="nombre"/></p>
                        <p>Marca <g:textField name="marca"/></p>
                        <p>Modelo <g:textField name="modelo" value=""/></p>
                        <p>Kms. por Litro <g:textField name="kmPorLitro" value=""/></p>
                        <p>Descripcion <g:textField name="descripcion" value=""/></p>
                        <p><g:actionSubmit text="Crear" value="Save"/></p>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>


