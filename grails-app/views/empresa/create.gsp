<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>create</title>
</head>

<body>

    <g:form action="save">

        GERENTE <g:textField name="gerente"/><br/>
        DIRECCION <g:textField name="direccion"/><br/>
        Fecha <g:datePicker name="fechaCreacion" value="${new Date()}" noSelection="['':'Selecciona Mes']"/><br/>
        CORREO <g:textField name="correo" value=""/><br/>
        GIRO <g:textField name="giro" value=""/><br/>
        NOMBRE <g:textField name="nombre" value=""/><br/>
        RUT <g:textField name="rut" value=""/><br/>
        TELEFONO <g:textField name="telefono" value=""/><br/>
        TIPO <g:textField name="tipo" value=""/><br/>

        <g:actionSubmit value="Save"/>
    </g:form>

</body>
</html>