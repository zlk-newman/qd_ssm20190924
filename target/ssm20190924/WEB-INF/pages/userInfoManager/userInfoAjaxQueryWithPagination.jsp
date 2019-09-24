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

    <!-- 引入分页插件-->
    <link href="${pageContext.request.contextPath}/static/pagination-2.1.4/css/pagination.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/pagination-2.1.4/js/pagination.min.js"></script>

    <!--引入弹出模态框的插件-->
    <link href="${pageContext.request.contextPath}/static/BootstrapEx/css/bootstrapEx.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/BootstrapEx/js/bootstrapEx.js"></script>
    <%----%>
    <script type="text/javascript">
        //////////////////////////////////////////////////////////////////////////////////////////////////////

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
                        // 将ajax查询的json数据，使用分页插件进行处理

                        $('#myPaging').pagination({
                            dataSource: data, // 分页的数据源
                            pageSize: 5, // 每一页显示的记录条数
                            pageNumber: 1, // 开始定位在第1页
                            callback: function (eachPageData, pagination) { // 每次翻页的时候的回调函数
                                // 清空局部变量 strContent
                                strContent = "";

                                // 遍历data的json数据进行解析显示
                                $.each(eachPageData, function (index, eachValue) {
                                    strContent += "<tr>";
                                    strContent += "<th scope='row'>" + (index + 1) + "</th>";
                                    strContent += "<td>" + eachValue.username + "</td>";
                                    strContent += "<td>" + eachValue["userage"] + "</td>";
                                    strContent += "<td>" + eachValue.useraddress + "</td>";
                                    strContent += "<td>" + eachValue.userregdate + "</td>";
                                    strContent += "<td><img style=\"width: 30px;height: 30px\" src='" + eachValue.userimg + "'></img></td>";
                                    strContent += "<td><button type=\"button\" class=\"btn btn-default\" onclick='showModal4Modify()'>修改</button></td>";
                                    strContent += "<td><button type=\"button\" class=\"btn btn-default\">删除</button></td>";
                                    strContent += "</tr>";
                                });
                                // 显示每一页的内容
                                // 将拼接内容显示到指定的控件中
                                // 局部刷新浏览器的dom对象
                                $("#displayMe").html(strContent);
                            }
                        });
                    }
                    // console.info("ajax查询结果：")
                    // console.info(data);
                },
                error: function () {
                    console.log("ajax查询错误！")
                }
            });
        }

        //////////////////////////////////////////////////////////////////////////////////////

        // 显示修改的模态框
        function showModal4Modify(){
            // 定义模态框显示的页面的url
            //var targetUrl = "https://www.baidu.com/";
            // 修改页面因为在web-info下，需要跳转后台进行访问
            var targetUrl = "forward?pg=userInfoManager/userInfoModify";
            var Modal3 = InitModal3(targetUrl);
            Modal3.show();
        }

        //Modal嵌入页签页初始化处理
        function InitModal3(targetUrl) {
            $(document.body).append('<div id="modal3"></div>');
            var Modal3 = new Modal();
            Modal3.renderto = "#modal3";
            Modal3.InitShow = true;
            Modal3.btns = [{ id: "btn1", text: "保存" }, { id: "closebtn" }]
            var tab1 = new Tab();
            Modal3.OnfirstInited = function (thismodal) {
                tab1.tabs = [{
                    id: "tabs1", title: "用户信息修改", active: true, isiframe: true, url: targetUrl
                }];
                tab1.renderto = thismodal.body;
                tab1.Init();
            }
            return  Modal3;
        }

    </script>

</head>
<body>
<div id="maindiv" style="margin: 10px auto">
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

    <div class="row" style="height: 400px;">
        <div class="col-sm-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>地址</th>
                    <th>注册日期</th>
                    <th>头像</th>
                    <th>修改</th>
                    <th>删除</th>
                </tr>
                </thead>
                <tbody id="displayMe">
                <%--此处有jquery通过ajax查询之后的回调函数进行局部刷新操作--%>

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12" id="myPaging">
            <%--分页插件需要显示的内容，运行时动态添加--%>
        </div>
    </div>
</div>
</body>
</html>
