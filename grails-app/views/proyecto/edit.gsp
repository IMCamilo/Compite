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

    <g:form action="update" id="${proyecto.id}">
        Empresa <g:select name="empresa" from="${empresas}" optionValue="nombre" optionKey="id"/>
        Codigo <g:textField name="codigo" value="${proyecto.codigo}"/>
        Nombre <g:textField name="nombre" value="${proyecto.nombre}"/>
        estado <g:textField name="estado" value="${proyecto.estado}"/>
        Fecha Creacion <g:datePicker name="fechaCreacion" value="${new Date()}" noSelection="['':'Selecciona Mes']"/>
        Fecha Fin <g:datePicker name="fechaFin" value="${new Date()}" noSelection="['':'Selecciona Mes']"/>
        <g:actionSubmit value="Update" />
    </g:form>

</body>
</html>

