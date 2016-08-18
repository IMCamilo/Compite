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

    <g:form action="update" id="${egreso.id}">
        Usuario <g:select name="usuario" from="${egreso.usuario}" optionValue="nombres" optionKey="id"/><br/>
        Fecha <g:datePicker name="fechaCreacion" value="${new Date()}" noSelection="['':'Selecciona Mes']"/><br/>
        aprobacion <g:textField name="aprobacion" value="${egreso.aprobacion}" />
        sedeEnvio <g:textField name="sedeEnvio" value="${egreso.sedeEnvio}"/>
        tipoRendicion <g:textField name="tipoRendicion" value="${egreso.tipoRendicion}" />
        <g:actionSubmit value="Update" />
    </g:form>

</body>
</html>