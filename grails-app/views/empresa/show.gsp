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
    <h1>empresa</h1>

    gerente: ${empresa.gerente}<br/>
    direccion: ${empresa.direccion}<br/>
    fecha: ${empresa.fechaCreacion}<br/>
    correo: ${empresa.correo}<br/>
    giro: ${empresa.giro}<br/>
    nombre: ${empresa.nombre}<br/>
    rut: ${empresa.rut}<br/>
    telefono: ${empresa.telefono}<br/>
    tipo: ${empresa.tipo}<br/>

    <g:link action="edit" id="${empresa.id}">Editar</g:link><br />
    <g:link action="delete" id="${empresa.id}">Borrar</g:link>

</body>
</html>