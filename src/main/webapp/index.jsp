<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        .error {
            color:red;
        }
        .hide {
            display: none;
        }
    </style>
</head>
<body>
    <h1>Hello,Maven</h1>
    <input type="text" id="username"><span class="error hide" id="helpText">该账号已被占用</span>


    <script>

        (function(){

            function createXmlHttp() {
                var xmlHttp = null;
                if(window.ActiveXObject) {
                    //IE < 9
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } else {
                    //no IE
                    xmlHttp = new XMLHttpRequest();
                }
                return xmlHttp;
            }




            document.querySelector("#username").onchange = function(){
                //1. 获取xmlHttpRequest对象
                var xmlHttp = createXmlHttp();
                //2. 指定请求地址和方式
                xmlHttp.open("post","/home.do",true);
                xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

                //3. 设置回调函数
                xmlHttp.onreadystatechange = function(){
                    var readyState = xmlHttp.readyState;
                    if(readyState == 4) {
                        var httpCode = xmlHttp.status;
                        if(httpCode == 200) {
                            //接收服务器端返回的值
                            var value = xmlHttp.responseText;
                            if(value == 0) {
                                document.querySelector("#helpText").style.display="inline";
                            }
                        } else {
                            alert("服务器错误：" + httpCode);
                        }
                    }
                };

                //4. 执行
                var username = document.querySelector("#username").value;
                xmlHttp.send("username="+username);
            };

        })();


    </script>


</body>
</html>