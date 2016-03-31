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
                xmlHttp.open("get","/product.xml",true);
                xmlHttp.onreadystatechange = function(){
                    var readyState = xmlHttp.readyState;
                    if(readyState == 4) {
                        if(xmlHttp.status == 200) {

                            document.querySelector("#content").innerHTML = "";

                            //获取服务端返回的xml
                            var xmlDoc = xmlHttp.responseXML;
                            var productElements = xmlDoc.getElementsByTagName("product");

                            for(var i = 0;i < productElements.length;i++) {
                                var productElement = productElements[i];
                                var id = productElement.getAttribute("id");
                                var name = productElement.getElementsByTagName("name")[0].childNodes[0].nodeValue;
                                var price = productElement.getElementsByTagName("price")[0].childNodes[0].nodeValue;
                                var num = productElement.getElementsByTagName("num")[0].childNodes[0].nodeValue;

                                addTbody(id,name,price,num);



                                //alert("ID:" + id + " Name:" + name + " Price:" + price + " Num:" + num);
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