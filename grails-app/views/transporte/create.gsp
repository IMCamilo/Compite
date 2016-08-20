<meta name="layout" content="auditoria/auditoria.main" />

    <g:form action="save">
        usuario <g:select name="usuario" from="${usuarios}" optionValue="rut" optionKey="id"/><br/>
        nombre <g:textField name="nombre"/><br/>
        marca <g:textField name="marca"/><br/>
        modelo <g:textField name="modelo" value=""/><br/>
        kmPorLitro <g:textField name="kmPorLitro" value=""/><br/>
        descripcion <g:textField name="descripcion" value=""/><br/>
        <g:actionSubmit value="Save"/>
    </g:form>

