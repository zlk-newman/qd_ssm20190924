<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/17
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户信息新增</title>
    <style rel="stylesheet">
        #maindiv {
            margin-top: 10px;
            width: 90%;
        }
    </style>
    <!--引入bootstrap的css文件-->
    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">-->
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!--引入jquery，注意：jquery要在js文件之前引入，因为bootstrap使用了jquery框架-->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jQuery-1.12.4/jquery-1.12.4.js"></script>
    <!--引入bootstrap的js文件-->
    <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>-->
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        // 使用ajax进行查询

        function doAjaxQuery() {
            // 使用ajax进行查询
            $.ajax({
                type: "POST", // 请求类型
                //url: "doAjaxUserInfoQueryByPramas?name=John&location=Boston",  // get的传参方式
                url: "doAjaxUserInfoQueryByPramas", // 和form表单的 action属性一样
                //data: "name=John&location=Boston", // post的传参方式，可以使用jquery提供的 $("form").serialize() 方法进行处理
                data: $("#form1").serialize(),
                // 指定服务器响应的数据类型  json html xml text
                dataType: "json",
                success: function (data) { // ajax的请求成功的回调处理， data就是从服务器返回的影响内容
                    // 拼写需要显示的dom组件的内容
                    var strContent = "";

                    if (data) {
                        // 遍历data的json数据进行解析显示
                        // for (var i =0;i<data.length;i++) {
                        //     var eachValue = data[i];
                        //     console.log(eachValue);
                        //     strContent += "<tr>";
                        //     strContent += "<th scope='row'>1</th>";
                        //     strContent += "<td>" + eachValue.username + "</td>";
                        //     strContent += "<td>" + eachValue.userage + "</td>";
                        //     strContent += "<td>" + eachValue.useraddress + "</td>";
                        //     strContent += "<td>" + eachValue.userregdate + "</td>";
                        //     strContent += "<td>" + eachValue.userimg + "</td>";
                        //     strContent += "</tr>";
                        // }
                        $.each(data, function (index, eachValue) {
                            strContent += "<tr>";
                            strContent += "<th scope='row'>" + (index + 1) + "</th>";
                            strContent += "<td>" + eachValue.username + "</td>";
                            strContent += "<td>" + eachValue["userage"] + "</td>";
                            strContent += "<td>" + eachValue.useraddress + "</td>";
                            strContent += "<td>" + eachValue.userregdate + "</td>";
                            strContent += "<td><img style=\"width: 30px;height: 30px\" src='" + eachValue.userimg + "'></img></td>";
                            strContent += "</tr>";
                        });
                    }
                    // 将拼接内容显示到指定的控件中
                    // 局部刷新浏览器的dom对象
                    $("#displayMe").html(strContent);

                    console.info("ajax查询结果：")
                    console.info(data);

                },
                error: function () {
                    console.log("ajax查询错误！")
                }

            });
        }

    </script>

</head>
<body>
<div id="maindiv">
    <div id="formdiv">
        <form id="form1" class="form-horizontal">

            <div class="form-group">
                <label class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="username" name="username" placeholder="请输入姓名">
                </div>

                <label class="col-sm-2 control-label">年龄</label>
                <div class="col-sm-4">
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="userage" name="userage" placeholder="请输入开始年龄">
                    </div>
                    <div class="col-sm-2">-
                    </div>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="userage2" name="userage2" placeholder="请输入结束年龄">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">地址</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="useraddress" name="useraddress" placeholder="请输入地址">
                </div>
                <label class="col-sm-2 control-label">注册日期</label>
                <div class="col-sm-2">
                    <input type="date" class="form-control" id="userregdate" name="userregdate" placeholder="请选择开始日期">
                </div>
                <div class="col-sm-2">
                    <input type="date" class="form-control" id="userregdate2" name="userregdate2" placeholder="请选择结束日期">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" onclick="doAjaxQuery()">查询</button>
                </div>
            </div>
        </form>
    </div>

    <div class="bs-example" data-example-id="hoverable-table col-sm-offset-2">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>地址</th>
                <th>注册日期</th>
                <th>头像</th>
            </tr>
            </thead>
            <tbody id="displayMe">
            <%--此处有jquery通过ajax查询之后的回调函数进行局部刷新操作--%>

            </tbody>
        </table>
    </div>
</div>
</body>
</html>
