<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/9 0009
  Time: 下午 14:09
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
    <%--引入EasyUI的资源--%>
    <link rel="stylesheet" type="text/css" href="static/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="static/demo.css">
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.easyui.min.js"></script>
    <%--声明js代码域--%>
    <script type="text/javascript">
        //声明页面加载事件，给登录按钮添加单击事件，完成异步登录
        $(function () {
            $("#userLoginBtn").click(function () {
                $("#loginFm").form('submit',{
                    url:"admin/adminLogin",
                    success:function (data) {
                        if(eval(data)){
                            //登录成功，跳转主页面
                            window.location.href="main.jsp";
                        }else{
                            $("#flagSpan").html("用户名或密码错误").css("color","red");
                        }
                    }
                })
            })
        })


    </script>
</head>
<body>
    <%--使用div完成页面布局--%>
    <div style="text-align: center;margin-top: 100px;">
        <span id="flagSpan"></span>
    </div>
    <div style="width: 410px;height: 290px;margin: auto;">
        <%--使用form表单收集登录信息，并完成异步登录--%>
        <form id="loginFm" method="post">
        <%--使用panel面板完成登录页面的组件--%>
            <div class="easyui-panel" title="欢迎登录Ting域主持人后台管理系统" style="width:100%;max-width:400px;padding:30px 60px;">
                <div style="margin-bottom:10px">
                    <input class="easyui-textbox" name="aname" style="width:100%;height:40px;padding:12px" data-options="prompt:'用户名',iconCls:'icon-man',iconWidth:38">
                </div>
                <div style="margin-bottom:20px">
                    <input class="easyui-textbox" name="apwd" type="password" style="width:100%;height:40px;padding:12px" data-options="prompt:'密码',iconCls:'icon-lock',iconWidth:38">
                </div>
                <div style="margin-bottom:20px">
                    <input type="checkbox" checked="checked">
                    <span>记住我</span>
                </div>
                <div>
                    <a id="userLoginBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;">
                        <span style="font-size:14px;">点击登录</span>
                    </a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
