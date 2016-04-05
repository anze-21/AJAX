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
            <th>MESSAGE</th>
            <th>#</th>
        </tr>
        </thead>
        <tbody id="tbody"></tbody>
    </table>

    <script src="/static/js/jquery-1.12.2.min.js"></script>
    <script src="/static/js/handlebars-v4.0.5.js"></script>
    <script type="text/x-handlebars-template" id="rowTemplate">
        {{#each users}}
        <tr>
            <td>{{@index}} ：{{id}}</td>
            <td>{{name}}</td>
            {{#unless isA}}
            <td>{{score}}</td>
            {{else}}
            <td class="text-error">{{score}}</td>
            {{/unless}}
            <td>{{{message}}}</td>
            <td>
                <a href="">编辑</a>
                <a href="">删除</a>
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="5"><h4>暂无数据显示</h4></td>
        </tr>
        {{/each}}
    </script>
    <script>
        $(function(){

            $("#createBtn").click(function(){
                var source = $("#rowTemplate").html();
                var template = Handlebars.compile(source);

                var data = {
                    "users":[
                        {"id":101,"name":"Rose","score":88.5,"message":"<span style='color:red'>Good Student</span>","isA":true},
                        {"id":102,"name":"LiSi","score":100,"message":"<span style='color:red'>Good Student</span>","isA":true},
                        {"id":102,"name":"张三","score":48.5,"message":"<span style='color:red'>Bad Student</span>","isA":false}
                    ]
                };


                var html = template(data);
                $("#tbody").append(html);




            });


        });
    </script>

</div>
</body>
</html>