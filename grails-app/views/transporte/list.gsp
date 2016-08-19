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
    <g:each in="${transportes}" var="tran">
        usuario ${tran.usuario} <br/>
        nombre ${tran.nombre}"/><br/>
        marca ${tran.marca}"/><br/>
        modelo ${tran.modelo}"/><br/>
        kmPorLitro ${tran.kmPorLitro}"/><br/>
        descripcion ${tran.descripcion}"/><br/>
        <g:link action="edit" id="${tran.id}">Editar</g:link><br/>
        <g:link action="delete" id="${tran.id}">Borrar</g:link><br/><br/>
    </g:each>
    <g:link action="create">Nuevo transporte</g:link>
</body>
</html>