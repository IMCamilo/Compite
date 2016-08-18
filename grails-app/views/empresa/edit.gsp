<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>edit</title>
</head>

<body>
    <g:form action="update" id="${empresa.id}">
            GERENTE <g:textField name="gerente" value="${empresa.gerente}"/><br/>
            DIRECCION <g:textField name="direccion" value="${empresa.direccion}"/><br/>
            Fecha <g:datePicker name="fechaCreacion" value="${new Date()}" noSelection="['':'Selecciona Mes']"/><br/>
            CORREO <g:textField name="correo" value="${empresa.correo}"/><br/>
            GIRO <g:textField name="giro" value="${empresa.giro}"/><br/>
            NOMBRE <g:textField name="nombre" value="${empresa.nombre}"/><br/>
            RUT <g:textField name="rut" value="${empresa.rut}"/><br/>
            TELEFONO <g:textField name="telefono" value="${empresa.telefono}"/><br/>
            TIPO <g:textField name="tipo" value="${empresa.tipo}"/><br/>
        <g:actionSubmit value="Update" />
    </g:form>
</body>
</html>



