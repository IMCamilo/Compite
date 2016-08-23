<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>list</title>
</head>

<body>
    <g:each in="${asignaciones}" var="asig">
        Usuario ${asig.usuario} <br/>
        Proyecto ${asig.proyecto}<br/>
        Fecha ${asig.fecha}<br/>
        Detalle ${asig.detalle}<br/>
        <g:link action="edit" id="${asig.id}">Editar</g:link><br/>
        <g:link action="delete" id="${asig.id}">Borrar</g:link><br/><br/>
    </g:each>
    </body>
</html>