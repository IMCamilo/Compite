<html>
    <head>
        <title>List cars</title>
    </head>
    <body>
    <h1>List cars</h1>
    <g:each in="${car}" var="contact">
        Contact: ${car.contactId}<br/><!--almacenar nombre o llamar a nombre para mostrarlo-->
        Patent: ${car.patent}<br/>
        Year: ${car.year}<br/>
        <g:link action="edit" id="${car.id}">Edit</g:link><br/>
        <g:link action="delete" id="${car.id}">Delete</g:link><br/><br/>
    </g:each>
    <g:link action="create">Create new car</g:link>
    </body>
</html>