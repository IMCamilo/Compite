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
<g:each in="${rendiciones}" var="re">
    usuario ${re.usuario}<br/>
    proyecto ${re.proyecto}<br/>
    tipo ${re.tipo}<br/>
    nombre ${re.nombre}<br/>
    motivo ${re.motivo}<br/>
    recorrido ${re.recorrido}<br/>
    tiempo ${re.tiempo}<br/>
    total ${re.total}<br/>
    fecha ${re.fecha}<br/>
    <g:link action="edit" id="${re.id}">Editar</g:link><br/>
    <g:link action="delete" id="${re.id}">Borrar</g:link><br/><br/>
</g:each>
<g:link action="create">Nueva rendicion</g:link>
</body>
</html>