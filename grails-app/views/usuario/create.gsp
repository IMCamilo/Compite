<html>
    <head>
        <title>Create new usuario</title>
    </head>
    <body>
        <h1>Create new usuario</h1>
        <g:form action="save">
            rut: <g:textField name="rut" /><br />
            nombres: <g:textField name="nombres" /><br />
            paterno: <g:textField name="paterno" /><br />
            materno: <g:textField name="materno" /><br />
            direccion: <g:textField name="direccion" /><br />
            correo: <g:textField name="correo" /><br />
            telefono: <g:textField name="telefono" /><br />
            clave: <g:textField name="clave" /><br />
            tipo: <g:textField name="tipo" /><br />
            <g:actionSubmit value="Save" />
        </g:form>
    </body>
</html>
