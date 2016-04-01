<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>

<script>
    (function(){

        var obj = {"name":"tom","age":23,"score":88.5};
        console.log(obj.name);
        console.log(obj.age);

        var array = [
            {"name":"tom","age":23,"score":88.5},
            {"name":"jack","age":28,"score":45}
        ];

        for(var i = 0;i < array.length;i++) {
            var temp = array[i];
            console.log(temp.name + " " + temp.age + "  " + temp.score);
        }




    })();
</script>

</body>
</html>