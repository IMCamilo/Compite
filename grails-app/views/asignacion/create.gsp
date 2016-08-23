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
        usuario <g:select name="usuario" from="${usuarios}" optionValue="nombres" optionKey="id"/><br/>
        proyecto <g:select name="proyecto" from="${proyectos}" optionValue="nombre" optionKey="id"/><br/>
        fecha <g:datePicker name="fecha" value="${new Date()}" noSelection="['':'Selecciona Mes']"/><br/>
        detalle <g:textArea name="detalle" value="" />
        <g:actionSubmit value="Save"/>
    </g:form>
</body>
</html>