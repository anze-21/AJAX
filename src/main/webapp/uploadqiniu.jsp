<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/js/webuploader/webuploader.css">
</head>
<body>
    <div class="container">
        <div id="picker">选择文件</div>
        <div id="show"></div>
    </div>

<script src="/static/js/jquery-1.12.2.min.js"></script>
<script src="/static/js/webuploader/webuploader.min.js"></script>
    <script>

        $(function(){

            var uploader = WebUploader.create({
                swf:"/staic/js/webuploder/Uploader.swf",
                server:"http://upload.qiniu.com",
                pick:"#picker",
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                },
                auto:true,
                fileVal:"file",
                formData:{"token":"${token}"},
                fileNumLimit:1
            });

            uploader.on("uploadSuccess",function(file,result){
                var $img = $("<img>");
                $img.attr("src","http://7xs9b4.com1.z0.glb.clouddn.com/"+result.key);
                $img.appendTo($("#show"));
            });


        });


    </script>
</body>
</html>