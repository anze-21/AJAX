<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <button id="btn1">JSONP DEMO1</button>
    <h3>有道词典</h3>
    <form class="form-inline">
        <input type="text" id="word">
        <button type="button" class="btn" id="youdaoBtn"><i class="fa fa-search"></i> 查询</button>
    </form>
    <div id="result"></div>
</div>


<script src="/static/js/jquery-1.12.2.min.js"></script>
<script>

    $(function(){
        $("#btn1").click(function(){

            $.getJSON("/jsonp.js?callback=?",function(result){
                alert(result.name);
            });
        });


        $("#youdaoBtn").click(function(){
            var word = $("#word").val();
            var url = "http://fanyi.youdao.com/openapi.do?keyfrom=kaishengit&key=1587754017&type=data&doctype=jsonp&callback=?&version=1.1&q="+word;
            $.getJSON(url,function(json){
                var $result = $("#result");
                $result.html("");

                var result = json.basic.explains;
                for(var i = 0;i < result.length;i++) {
                    $result.append("<p>"+result[i]+"</p>");
                }
            });
        });

    });


</script>
</body>
</html>