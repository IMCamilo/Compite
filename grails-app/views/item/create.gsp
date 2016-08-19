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
        rendicion <g:select name="rendicion" from="${rendiciones}" optionValue="id" optionKey="id"/><br/>
        nombre <g:textField name="nombre" value=""/>
        tipo <g:textField name="tipo" value=""/>
        descripcion <g:textArea name="descripcion" value=""/>
        valor <g:textField name="valor" value="" />
        <g:actionSubmit value="Save"/>
    </g:form>

</body>
</html>