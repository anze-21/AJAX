<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/static/js/simditor-2.3.6/styles/simditor.css">
</head>
<body>

<form action="/edit.do" method="post">
<textarea name="context" id="editer" placeholder="请输入文章内容" autofocus></textarea>
    <button>保存</button>
</form>


<script src="/static/js/jquery-1.12.2.min.js"></script>
<script src="/static/js/simditor-2.3.6/scripts/module.min.js"></script>
<script src="/static/js/simditor-2.3.6/scripts/hotkeys.min.js"></script>
<script src="/static/js/simditor-2.3.6/scripts/uploader.min.js"></script>
<script src="/static/js/simditor-2.3.6/scripts/simditor.min.js"></script>

<script>
    $(function(){
        var editer = new Simditor({
            textarea:$("#editer"),
            upload:{
                url:"http://upload.qiniu.com",
                fileKey:"file",
                params:{"token":"${token}"}
            }
            //toolbarFloat:false
            //toolbarHidden:true
            //toolbar:['title','fontScale','color'],

        });

    });
</script>

</body>
</html>