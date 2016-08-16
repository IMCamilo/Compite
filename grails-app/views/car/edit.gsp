<html>
    <head>
        <title>Edit car</title>
    </head>
    <body>
    <h1>Edit car</h1>
    <g:form action="update" id="${car.id}">
        Contacto <g:select name="contact" from="${contacts}" optionValue="name" optionKey="id"/><br />
        Patent: <g:textField name="name" value="${car.patent}"/><br />
        Year: <g:textField name="phoneNumber" value="${car.year}"/><br />
        <g:actionSubmit value="Update" />
    </g:form>
    </body>
</html>