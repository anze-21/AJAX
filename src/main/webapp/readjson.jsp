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
        <button id="readXml" class="btn btn-primary">Read XML</button>

        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Num</th>
                </tr>
            </thead>
            <tbody id="content">

            </tbody>
        </table>
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


            document.querySelector("#readXml").onclick = function(){

                var xmlHttp = createXmlHttp();
                xmlHttp.open("get","/product.json",true);
                xmlHttp.onreadystatechange = function(){
                    var readyState = xmlHttp.readyState;
                    if(readyState == 4) {
                        if(xmlHttp.status == 200) {

                            document.querySelector("#content").innerHTML = "";

                            //接收服务器返回的JSON
                            var result = xmlHttp.responseText;
                            //将字符串转换为JSON
                            var json = JSON.parse(result);

                            for(var i = 0;i < json.length;i++) {
                                var obj = json[i];
                                var id = obj.id;
                                var name = obj.productName;
                                var price = obj.price;
                                var num = obj.number;

                                addTbody(id,name,price,num);
                            }



                        } else {
                            alert("服务器错误:" + xmlHttp.status);
                        }
                    }
                };

                xmlHttp.send();

            };

            function addTbody(id,name,price,num) {
                var tr = document.createElement("tr");
                var idTd = document.createElement("td");
                var nameTd = document.createElement("td");
                var priceTd = document.createElement("td");
                var numTd = document.createElement("td");

                var idTextNode = document.createTextNode(id);
                var nameTextNode = document.createTextNode(name);
                var priceTextNode = document.createTextNode(price);
                var numTextNode = document.createTextNode(num);

                idTd.appendChild(idTextNode);
                nameTd.appendChild(nameTextNode);
                priceTd.appendChild(priceTextNode);
                numTd.appendChild(numTextNode);

                tr.appendChild(idTd);
                tr.appendChild(nameTd);
                tr.appendChild(priceTd);
                tr.appendChild(numTd);

                document.getElementById("content").appendChild(tr);

            }




        })();
    </script>
</body>
</html>