<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>

    <g:form action="save">
        usuario <g:select name="usuario" from="${usuarios}" optionValue="rut" optionKey="id"/><br/>
        nombre <g:textField name="nombre"/><br/>
        marca <g:textField name="marca"/><br/>
        modelo <g:textField name="modelo" value=""/><br/>
        kmPorLitro <g:textField name="kmPorLitro" value=""/><br/>
        descripcion <g:textField name="descripcion" value=""/><br/>
        <g:actionSubmit value="Save"/>
    </g:form>

</body>
</html