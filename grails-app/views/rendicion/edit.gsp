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

    <g:form action="update" id="${rendicion.id}">
        <g:select name="usuario" from="${usuarios}" optionValue="nombres" optionKey="id"/><br/>
        <g:select name="proyecto" from="${proyectos}" optionValue="nombre" optionKey="id"/><br/>
        tipo <g:textField name="tipo" value="${rendicion.tipo}"/><br/>
        nombre <g:textField name="nombre" value="${rendicion.nombre}"/><br/>
        motivo <g:textField name="motivo" value="${rendicion.motivo}"/><br/>
        recorrido <g:textField name="recorrido" value="${rendicion.recorrido}"/><br/>
        tiempo <g:textField name="tiempo" value="${rendicion.tiempo}"/><br/>
        total <g:textField name="total" value="${rendicion.total}"/><br/>
        fecha <g:datePicker name="fecha" value="${new Date()}" noSelection="['':'Selecciona Mes']"/><br/>
        <g:actionSubmit value="Update"/>
    </g:form>


</body>
</html>