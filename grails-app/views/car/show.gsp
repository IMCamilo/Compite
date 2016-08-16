<html>
    <head>
        <title>Show car</title>
    </head>
    <body>
        <h1>Show car</h1>
        Patent: ${car.patent}<br />
        Year: ${car.year}<br />
        <g:link action="edit" id="${car.id}">Edit</g:link><br />
        <g:link action="delete" id="${car.id}">Delete</g:link>
    </body>
</html>