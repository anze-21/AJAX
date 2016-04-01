<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>

    <div class="container">
        <button class="btn" id="btn">Send Get Request</button>
        <hr>
        <form class="form-inline" id="saveForm">
            <input type="text" name="email" id="email">
            <input type="text" name="username" id="username"> <span id="helptext"></span>
        </form>
        <hr>
        <h3>RSS解析</h3>
        <form class="form-inline">
            <input type="text" class="span6" id="url"> <button type="button" class="btn" id="btnRss">抓取</button>
        </form>
        <div id="rss">
        </div>
        <hr>
        <h3>有道词典</h3>
        <form class="form-inline">
            <input type="text" id="word">
            <button type="button" class="btn" id="youdaoBtn"><i class="fa fa-search"></i> 查询</button>
        </form>
        <div id="result"></div>


    </div>

<script src="http://cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script>
    $(function(){

        $("#btn").click(function(){
            $.get("/homes.do",{"msg":'tom'}).done(function(data){
                alert(data);
            }).fail(function(){
                alert("请求错误");
            }).always(function(){
                console.log("always method");
            });
        });

        $("#username").change(function(){

            console.log($("#saveForm").serialize());
            $.post("/home.do",$("#saveForm").serialize(),function(data){
                if(data == "0") {
                    $("#helptext").text("该账号已被占用");
                } else {
                    $("#helptext").text("√");
                }
            });

        });

        $("#btnRss").click(function(){
            var url = $("#url").val();
            var $this = $(this);

            $.ajax({
                url:"/read/rss.do",
                data:{"url":url},
                beforeSend:function(){
                    //发送前调用的方法
                    $this.html("<i class=\"fa fa-spinner fa-spin\"></i>").attr("disabled","disabled");
                },
                success:function(xmlDoc){
                    //请求成功后调用的方法
                    var $rssNode = $("#rss");
                    $rssNode.html("");

                    $(xmlDoc).find("item").each(function(){
                        var title = $(this).find("title").text();
                        var link = $(this).find("link").text();
                        var html = "<h4><a href='"+link+"'>"+title+"</a></h4>";
                        $rssNode.append(html);
                    });
                },
                error:function(){
                    //请求失败调用的方法
                    alert("服务器错误");
                },
                complete:function(){
                    //无论请求成功success或失败error都调用的方法
                    $this.text("抓取").removeAttr("disabled");
                }
            });

        });

        $("#youdaoBtn").click(function(){
            var word = $("#word").val();

            $.getJSON("/youdao.do",{"doctype":"json","word":word})
                    .done(function(json){
                        var $result = $("#result");
                        $result.html("");

                        var result = json.basic.explains;
                        for(var i = 0;i < result.length;i++) {
                            $result.append("<p>"+result[i]+"</p>");
                        }
                    })
                    .fail(function(){
                        alert("请求服务器错误");
                    });

        });

    });
</script>
</body>
</html>