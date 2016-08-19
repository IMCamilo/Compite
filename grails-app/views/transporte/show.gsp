<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>show</title>
</head>

<body>
    usuario ${transporte.usuario} <br/>
    nombre ${transporte.nombre}<br/>
    marca ${transporte.marca}<br/>
    modelo ${transporte.modelo}<br/>
    kmPorLitro ${transporte.kmPorLitro}<br/>
    descripcion ${transporte.descripcion}<br/>
    <g:link action="edit" id="${transporte.id}">Editar</g:link><br/>
    <g:link action="delete" id="${transporte.id}">Borrar</g:link><br/>
</body>
</html>