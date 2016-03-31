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
        <h3>RSS解析</h3>
        <form class="form-inline">
            <input type="text" class="span6" id="url"> <button type="button" class="btn" id="btn">抓取</button>
        </form>
        <div id="rss">
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

                document.querySelector("#rss").innerHTML = "";

                var url = document.querySelector("#url").value;
                var xmlHttp = createXmlHttp();
                xmlHttp.open("get","/read/rss.do?url="+url,true);
                xmlHttp.onreadystatechange = function(){
                    if(xmlHttp.readyState == 4) {
                        if(xmlHttp.status == 200) {
                            var xmlDoc = xmlHttp.responseXML;

                            var itemElements = xmlDoc.getElementsByTagName("item");
                            for(var i = 0;i < itemElements.length;i++) {
                                var itemElement = itemElements[i];
                                var title = itemElement.getElementsByTagName("title")[0].childNodes[0].nodeValue;
                                var link = itemElement.getElementsByTagName("link")[0].childNodes[0].nodeValue;

                                var h4 = document.createElement("h4");
                                var a = document.createElement("a");
                                a.setAttribute("href",link);
                                var text = document.createTextNode(title);

                                a.appendChild(text);
                                h4.appendChild(a);
                                document.querySelector("#rss").appendChild(h4);

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