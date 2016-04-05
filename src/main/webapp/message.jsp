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
        <h4><a href="javascript:;" id="msgHelp"></a></h4>
        <div class="messages">

        </div>
    </div>
    <script src="/static/js/jquery-1.12.2.min.js"></script>
    <script src="/static/js/handlebars-v4.0.5.js"></script>
    <script type="text/x-template" id="msgTemplate">
        {{#each data}}
        <h3>{{message}}</h3>
        {{else}}
        <h3>暂时没有数据</h3>
        {{/each}}
    </script>
    <script>
        $(function(){

            var maxId = 0;
            var jsonData = null;

            //轮询
            setInterval(function(){
                loadServer(function(json){
                    if(json.data.length > 0) {
                        jsonData = json;
                        $("#msgHelp").text("你有" + json.data.length + "条新消息");
                    }
                });
            },10000);

            $("#msgHelp").click(function(){
                if(jsonData != null) {
                    maxId = jsonData.data[0].id;
                    var source = $("#msgTemplate").html();
                    var template = Handlebars.compile(source);
                    var html = template(jsonData);
                    $(".messages").prepend(html);

                    jsonData = null;
                    $(this).text("");
                }
            });


            function loadServer(callback){
                $.get("/message.do",{"maxId":maxId}).done(function(json){
                    callback(json);
                }).fail(function(){
                    alert("服务器异常");
                });
            }

            loadServer(function(json){
                if(json.data.length > 0) {
                    maxId = json.data[0].id;
                    var source = $("#msgTemplate").html();
                    var template = Handlebars.compile(source);
                    var html = template(json);
                    $(".messages").append(html);
                }
            });


        });
    </script>
</body>
</html>
