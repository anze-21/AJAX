<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/js/webuploader/webuploader.css">
    <style>
        .delLine{
            text-decoration: line-through;
        }
    </style>
</head>
<body>

    <div class="container">
        <div id="picker">选择文件</div>
        <button class="btn btn-success" id="btn">开始上传</button>
        <ul class="fileList"></ul>

    </div>


<script src="/static/js/jquery-1.12.2.min.js"></script>
<script src="/static/js/webuploader/webuploader.min.js"></script>
<script>
    $(function(){

        var uploader = WebUploader.create({
            swf:"/staic/js/webuploder/Uploader.swf",
            server:"/upload.do",
            pick:"#picker",
            fileVal:"file",
            //auto:true,
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });

        //文件放入到上传队列中调用
        uploader.on("fileQueued",function(file){
            console.log("fileQueued start...");
            var $li = $("<li id='"+file.id+"'>"+file.name+"</li>");

            console.log("fileQueued end...");

            //图片预览
            uploader.makeThumb(file,function(error,src){
                if(!error) {
                    var $img = $("<img>");
                    $img.attr("src",src);
                    $li.append($img);
                }
            },100,100);


            $(".fileList").append($li);


        });

        //文件上传过程中调用
        uploader.on("uploadProgress",function(file){
            $("#"+file.id).text($("#"+file.id).text() + " 开始上传");
        })

        //文件上传成功时调用
        uploader.on("uploadSuccess",function(file){
            $("#"+file.id).addClass("delLine");
        });
        //文件上传失败时调用
        uploader.on("uploadError",function(file){});
        //无论上传成功还是失败都调用
        uploader.on("uploadComplete",function(){});

        //开始上传
        $("#btn").click(function(){
            uploader.upload();
        });


    });
</script>

</body>
</html>