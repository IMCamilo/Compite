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

    <g:form action="update" id="${item.id}">
        rendicion <g:select name="rendicion" from="${item.rendicion}" optionValue="id" optionKey="id"/><br/>
        nombre <g:textField name="nombre" value="${item.nombre}"/>
        tipo <g:textField name="tipo" value="${item.tipo}"/>
        descripcion <g:textArea name="descripcion" value="${item.descripcion}"/>
        valor <g:textField name="valor" value="${item.valor}" />
        <g:actionSubmit value="Update" />
    </g:form>

</body>
</html>