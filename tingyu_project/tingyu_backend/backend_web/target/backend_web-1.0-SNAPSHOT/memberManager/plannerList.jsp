<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11 0011
  Time: 上午 11:16
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
        /**********声明页面加载事件，完成DataGrid组件的初始化，加载策划师信息******************************/
        $(function () {
            $("#plannerListTable").datagrid({
                url:'company/plannerInfo',
                title:'策划师列表',
                rownumbers:true,//显示行号
                queryParams:{cid:'${param.cid}'},
                columns:[[//声明响应的实体类数据和列的映射关系
                    {field:'nid',title:'策划师编号',width:80},//一个json表示一列的映射，可以声明多个
                    {field:'nname',title:'策划师名称',width:100},//一个json表示一列的映射，可以声明多个
                    {field:'nphone',title:'手机号',width:100},//一个json表示一列的映射，可以声明多个
                    {field:'addtime',title:'开通时间',width:100},//一个json表示一列的映射，可以声明多个
                    {field:'pnum',title:'订单量',width:100},//一个json表示一列的映射，可以声明多个
                    {field:'status',title:'账号状态',width:100}//一个json表示一列的映射，可以声明多个
                ]]
            })
        })

    </script>
</head>
<body>
    <%--使用panel面板组件完成布局--%>
    <div style="width: 800px;height: 370px;padding: 20px;" class="easyui-panel" title="策划师列表">
        <%--使用DataGrid组件完成策划师列表的加载--%>
        <table id="plannerListTable"></table>
            <br><br>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" onclick="javascript:window.location.href='memberManager/companyManager.jsp'" style="width:90px">返回</a>
    </div>

</body>
</html>
