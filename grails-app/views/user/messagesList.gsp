<html>
<head>
</head>
<body>
    <h2>Hi, ${user.name}</h2>
    <h2>Your messages:</h2>
    <div>
        <g:each in="${messages}" var="message">
        <div style="border:1px solid black;">

        </div>
        </g:each>
    </div>


</body>
</html>
