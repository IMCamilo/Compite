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

    <g:each in="${egresos}" var="auditoria">

        Usuario ${egresos.usuario} <br/>
        Fecha ${egresos.fechaCreacion}<br/>
        aprobacion ${egresos.aprobacion}<br/>
        sedeEnvio ${egresos.sedeEnvio}<br/>
        tipoRendicion ${egresos.tipoRendicion}<br/>

        <g:link action="edit" id="${egresos.id}">Editar</g:link><br/>
        <g:link action="delete" id="${egresos.id}">Borrar</g:link><br/><br/>
    </g:each>
    <g:link action="create">Nueva auditoria</g:link>

</body>
</html>
