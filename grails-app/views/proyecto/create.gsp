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
        <g:select name="empresa" from="${empresas}" optionValue="nombre" optionKey="id"/>
        Codigo <g:textField name="codigo"/>
        Nombre <g:textField name="nombre"/>
        estado <g:textField name="estado"/>
        Fecha Creacion <g:datePicker name="fechaCreacion" value="${new Date()}" noSelection="['':'Selecciona Mes']"/>
        Fecha Fin <g:datePicker name="fechaFin" value="${new Date()}" noSelection="['':'Selecciona Mes']"/>
        <g:actionSubmit value="Save"/>
    </g:form>

</body>
</html>