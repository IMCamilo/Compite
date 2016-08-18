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

    <h1>egreso</h1>
    Usuario ${egreso.usuario} <br/>
    Fecha ${egreso.fechaCreacion}<br/>
    aprobacion ${egreso.aprobacion}<br/>
    sedeEnvio ${egreso.sedeEnvio}<br/>
    tipoRendicion ${egreso.tipoRendicion}<br/>
    <g:link action="edit" id="${egreso.id}">Editar</g:link><br />
    <g:link action="delete" id="${egreso.id}">Borrar</g:link>

</body>
</html>