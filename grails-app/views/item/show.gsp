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
    rendicion ${item.rendicion} <br/>
    nombre ${item.nombre}<br/>
    tipo ${item.tipo}<br/>
    descripcion ${item.descripcion}<br/>
    valor ${item.valor}<br/>
    <g:link action="edit" id="${item.id}">Editar</g:link><br/>
    <g:link action="delete" id="${item.id}">Borrar</g:link><br/><br/>
</body>
</html>