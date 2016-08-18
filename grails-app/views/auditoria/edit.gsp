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

    <g:form action="update" id="${auditoria.id}">

        Usuario <g:select name="usuario" from="${auditoria.usuario}" optionValue="nombres" optionKey="id"/><br/>
        (no se verá, es automatica) Fecha <g:datePicker name="fecha" value="${new Date()}" noSelection="['':'Selecciona Mes']"/><br/>
        Descripcion <g:textArea name="descripcion" value="${auditoria.descripcion}" rows="5" cols="40"/>



        <g:actionSubmit value="Update" />
    </g:form>


</body>
</html>