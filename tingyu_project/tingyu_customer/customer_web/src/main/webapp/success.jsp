<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/17 0017
  Time: 下午 15:34
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    //http://localhost:8080/01_sxtoa_war_exploded/
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<body>
注册成功，点击<a href="index.jsp">跳转</a>主页
</body>
</html>
