<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>

<script>
    function sayHello(obj){
        alert("Hello," + obj.name);
    }
</script>
<script src="/jsonp.js?callback=sayHello"></script>

</body>
</html>