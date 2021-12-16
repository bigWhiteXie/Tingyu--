<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/6 0006
  Time: 下午 15:32
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
        //声明页面加载事件，给树组件添加单击事件
        $(function () {
            $('#tt').tree({
                onClick: function (node) {
                    console.log(node)
                    if(node.attributes.isparent==1){
                        return;
                    }
                    //判断是否已经存在标签页
                    var has=$("#tabsDiv").tabs('exists',node.text);
                  if(has){
                      //选择已经存在的标签页
                      $("#tabsDiv").tabs('select',node.text);
                  }else{
                      //新增标签页
                      $("#tabsDiv").tabs('add',{
                          title:node.text,
                          closable:true,
                          content:"<iframe  src='"+node.attributes.url+"' style='border: none' width='99%' height='99%'/>"
                      })
                  }

                }
            });
        })
        //声明页面加载事件，给退出按钮，添加单击事件，完成退出
        $(function () {
            $("#adminLoginOut").click(function () {
                $.messager.confirm("确认框","你确定要退出吗?",function (r) {
                    if(r){
                        window.location.href="admin/adminOut";
                }
                })
            })
        })

    </script>
</head>
<body class="easyui-layout">
<%--布局:北--%>
<div data-options="region:'north'" style="height:75px;background-image: url('static/images/bg.png')">
    <%--创建网站的logo--%>
    <span>
            <img style="margin-top: 15px;position: relative;left: 10px;" src="static/images/logo.png" width="260px">
        </span>
    <%--创建头部菜单--%>
    <span style="color: white;font-size:15px;font-weight:bold;float: right;position: relative;top:40px;right: 50px;">
            当前登录: ${sessionScope.admin.aname}
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a id="adminLoginOut" href="javascript:void(0)" style="text-decoration: none;color: red;">退出</a>
        </span>
</div>
<%--布局:南--%>
<div data-options="region:'south'" style="height:50px;text-align: center">
    <%--网站声明--%>
    <span style="font-weight: bold;position: relative;top:8px;">
        &copy;仅供学习交流使用，商用必究！当前版本:ADGHJ00099,备案号:990008877
    </span>
</div>
<%--布局:西--%>
<div data-options="region:'west',title:'系统菜单'" style="width:200px;">
    <%--使用Tree组件完成菜单效果--%>
    <ul id="tt" class="easyui-tree" data-options="url:'menu/menuInfo'"></ul>
</div>
<%--布局:中--%>
<div data-options="region:'center'" style="padding:5px;background:#eee;">
    <%--使用tabs组件完成标签页效果--%>
    <div id="tabsDiv" class="easyui-tabs" fit="true" style="width:500px;height:250px;">
        <div title="首页" style="padding:20px;display:none;"> tab1</div>
    </div>
</div>
</body>
</html>
