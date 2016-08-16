<html>
    <head>
        <title>Create new car</title>
    </head>
    <body>
    <h1>Create new car</h1>
    <g:form action="save">
        Contacto <g:select name="more" from="${contacts.name}" /><br/>
        Patent: <g:textField name="patent" /><br />
        Year: <g:textField name="phoneNumber" /><br />
        <g:actionSubmit value="Save" />
    </g:form>
    </body>
</html>