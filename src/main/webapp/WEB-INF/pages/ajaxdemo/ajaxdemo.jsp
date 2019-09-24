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
    <script type="text/javascript">

        // 获取一个ajax引擎对象的函数
        function getXMLRequest() {
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            } else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            return xmlhttp;
        }

        // 进行ajax请求处理
        function doAjax() {
            // 1、获取一个ajax引擎对象
            var xmlhttp = getXMLRequest();
            // 2、委托ajx引擎进行请求
            // 在ajax引擎代理的open方法中设置ajax的请求参数： 请求方式get/post，请求action的url，是否进行异步（默认true为异步）
            xmlhttp.open("GET", "doAjaxDemo", true);
            // ajax引擎发送请求
            xmlhttp.send();
            //3、判断ajax引擎是否请求成功，并进行回调处理
            // 通过监听ajax引擎的onreadystatechange事件的处理结果是否成功，然后进行回调处理
            xmlhttp.onreadystatechange = function () {
                // 处理成功： http的状态为200；ajax引擎的状态为4
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    // 此时，进行回调处理
                    // 从ajax引擎对象中，responseText属性中获取服务器响应的内容
                    document.getElementById("showMe").innerHTML = xmlhttp.responseText;
                    console.info("ajax响应的内容：");
                    console.info(xmlhttp.responseText);
                }
            }
        }

    </script>
</head>
<body>
<input type="button" id="ajax1" value="原生的ajax" onclick="doAjax()">
<br>
<label id="showMe"></label>
</body>
</html>
