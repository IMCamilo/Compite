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

    <g:form action="update" id="${transporte.id}">
        usuario <g:select name="usuario" from="${usuarios}" optionValue="rut" optionKey="id"/><br/>
        nombre <g:textField name="nombre" value="${transporte.nombre}"/><br/>
        marca <g:textField name="marca" value="${transporte.marca}"/><br/>
        modelo <g:textField name="modelo" value="${transporte.modelo}"/><br/>
        kmPorLitro <g:textField name="kmPorLitro" value="${transporte.kmPorLitro}"/><br/>
        descripcion <g:textField name="descripcion" value="${transporte.descripcion}"/><br/>
        <g:actionSubmit value="Update" />
    </g:form>

</body>
</html>
