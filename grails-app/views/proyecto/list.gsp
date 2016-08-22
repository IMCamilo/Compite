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
    <g:each in="${proyectos}" var="pro">
        Empresa ${pro.empresa}<br/>
        Codigo ${pro.codigo}<br/>
        Nombre ${pro.nombre}<br/>
        estado ${pro.estado}<br/>
        Fecha Creacion ${pro.fechaCreacion}<br/>
        Fecha Fin ${pro.fechaFin}<br/>
        <g:link action="edit" id="${pro.id}">Editar</g:link><br/>
        <g:link action="delete" id="${pro.id}">Borrar</g:link><br/><br/>
    </g:each>
    <g:link action="create">Nuevo proyecto</g:link>
</body>
</html>