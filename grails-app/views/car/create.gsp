<html>
    <head>
        <title>Create new car</title>
    </head>
    <body>
    <h1>Create new car</h1>
    <g:form action="save">
        Contacto <g:select name="contact" from="${contacts}" optionValue="name" optionKey="id"/><br />
        Patent: <g:textField name="patent" /><br />
        Year: <g:textField name="year" /><br />
        <g:actionSubmit value="Save" />
    </g:form>
    </body>
</html>