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
        #maindiv{
            margin-top: 10px;
            width: 90%;
        }
    </style>
    <!--引入bootstrap的css文件-->
    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">-->
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!--引入jquery，注意：jquery要在js文件之前引入，因为bootstrap使用了jquery框架-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jQuery-1.12.4/jquery-1.12.4.js"></script>
    <!--引入bootstrap的js文件-->
    <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>-->
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div id="maindiv">
    <form class="form-horizontal" action="${pageContext.request.contextPath}/saveOrUpdateUserinfo" method="post"
          enctype="multipart/form-data">

        <div class="form-group">
            <label class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="username" name="username" placeholder="请输入姓名">
            </div>

            <label class="col-sm-2 control-label">密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="userpsw" name="userpsw" placeholder="请输入密码">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">年龄</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="userage" name="userage" placeholder="请输入年龄">
            </div>

            <label class="col-sm-2 control-label">地址</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="useraddress" name="useraddress" placeholder="请输入地址">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">注册日期</label>
            <div class="col-sm-4">
                <input type="date" class="form-control" id="userregdate" name="userregdate" placeholder="请选择日期">
            </div>

            <label class="col-sm-2 control-label">头像</label>
            <div class="col-sm-4">
                <%--注意：file控件的anme属性，不要和实体类bean的属性字段一样，否则会直接把文件流赋值给该字段，造成数据类型转换错误--%>
                <%--默认映射规则：那么属性采用 file_属性名  方式进行命名（属性名就是实体类的成员变量名）--%>
                <input type="file" class="form-control" id="userimg" name="file_userimg" placeholder="请选择头像">
            </div>
        </div>

        <%--<div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">保存</button>
            </div>
        </div>--%>
    </form>
</div>
</body>
</html>
