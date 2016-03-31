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
        <h3>调用有道词典API</h3>
        <form class="form-inline">
            <input type="text" placeholder="请输入要翻译的文本" id="dict">
            <button class="btn" id="btn" type="button">翻译</button>
        </form>
        <div id="result">

        </div>
    </div>

    <script>
        (function(){
            function createXmlHttp() {
                var xmlHttp = null;
                if(window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } else {
                    xmlHttp = new XMLHttpRequest();
                }
                return xmlHttp;
            }

            document.querySelector("#btn").onclick = function(){

                var result = document.querySelector("#result");
                result.innerHTML = "";

                var dict = document.querySelector("#dict").value;

                var xmlHttp = createXmlHttp();
                xmlHttp.open("get","/youdao.do?word="+encodeURIComponent(dict),true);
                xmlHttp.onreadystatechange = function(){
                    if(xmlHttp.readyState == 4) {
                        if(xmlHttp.status == 200) {
                            var xmlDoc = xmlHttp.responseXML;

                            var explains = xmlDoc.getElementsByTagName("explains")[0];
                            var exs = explains.getElementsByTagName("ex");
                            for(var i = 0;i < exs.length;i++) {
                                var ex = exs[i];
                                var text = ex.childNodes[0].nodeValue;

                                var p = document.createElement("p");
                                var textNode = document.createTextNode(text);

                                p.appendChild(textNode);
                                result.appendChild(p);

                            }

                        } else {
                            alert("服务器错误：" + xmlHttp.status);
                        }
                    }

                };
                xmlHttp.send();
            };



        })();
    </script>

</body>
</html>