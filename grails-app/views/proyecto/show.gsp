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
    Empresa ${proyecto.empresa}<br/>
    Codigo ${proyecto.codigo}<br/>
    Nombre ${proyecto.nombre}<br/>
    estado ${proyecto.estado}<br/>
    Fecha Creacion ${proyecto.fechaCreacion}<br/>
    Fecha Fin ${proyecto.fechaFin}<br/>
    <g:link action="edit" id="${pro.id}">Editar</g:link><br/>
    <g:link action="delete" id="${pro.id}">Borrar</g:link><br/><br/>
</body>
</html>