<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/20
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ajaxdemo</title>
    <%--引入jquery--%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jQuery-1.12.4/jquery-1.12.4.js"></script>
    <script type="text/javascript">

        // 使用jquery进行ajax请求处理
        function doAjax() {
            // 使用jquery进行ajax处理
            $.ajax({
                    // 请求方式 get/post
                    type: "get",
                    // 请求的是服务器的action的url路径
                    url: "doAjaxDemo",
                    //data: "name=John&location=Boston",
                    // 回调函数 中的参数是服务器响应的内容
                    success: function (data) {
                        // 从ajax引擎对象中，responseText属性中获取服务器响应的内容
                        $("#showMe").html(data);
                        console.info("ajax响应的内容：");
                        console.info(data);
                    }
                })

        }
    </script>
</head>
<body>
<input type="button" id="ajax1" value="原生的ajax" onclick="doAjax()">
<br>
<label id="showMe"></label>
</body>
</html>
