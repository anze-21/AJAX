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

        <div class="page-header">
            <h3>JS模版示例</h3>
        </div>
        <button id="createBtn" class="btn btn-primary">创建行</button>
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>SCORE</th>
                <th>#</th>
            </tr>
            </thead>
            <tbody id="tbody"></tbody>
        </table>


    </div>


<script src="/static/js/jquery-1.12.2.min.js"></script>
<script type="text/mytemplate" id="rowTemplate">
    <tr>
        <td>{{id}}</td>
        <td>{{name}}</td>
        <td class="text-error">{{score}}</td>
        <td>
            <a href="">编辑</a>
            <a href="">删除</a>
        </td>
    </tr>
</script>
<script>
    $(function(){

        $("#createBtn").click(function(){
            var html = $("#rowTemplate").html();
            html = html.replace("{{id}}","100");
            html = html.replace("{{name}}",new Date().getTime());

            $("#tbody").append(html);
        });


    });
</script>

</body>
</html>