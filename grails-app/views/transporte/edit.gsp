<meta name="layout" content="auditoria/auditoria.main" />

    <g:form action="update" id="${transporte.id}">
        usuario <g:select name="usuario" from="${usuarios}" optionValue="rut" optionKey="id"/><br/>
        nombre <g:textField name="nombre" value="${transporte.nombre}"/><br/>
        marca <g:textField name="marca" value="${transporte.marca}"/><br/>
        modelo <g:textField name="modelo" value="${transporte.modelo}"/><br/>
        kmPorLitro <g:textField name="kmPorLitro" value="${transporte.kmPorLitro}"/><br/>
        descripcion <g:textField name="descripcion" value="${transporte.descripcion}"/><br/>
        <g:actionSubmit value="Update" />
    </g:form>
