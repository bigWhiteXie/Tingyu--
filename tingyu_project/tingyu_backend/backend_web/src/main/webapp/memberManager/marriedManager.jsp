<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/9 0009
  Time: 下午 16:20
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
     /************************声明页面加载事件，完成DataGrid组件的初始化*******************/
     $(function () {
         //初始化设置新人管理的DataGrid组件
         $("#marriedPersonTable").datagrid({
             url:'married/marriedPersonInfo',//声明异步数据的请求地址
             toolbar:"#tb",
             rownumbers:true,//显示行号
             pagination:true,//显示分页工具栏(上一页，下一页...)
             pageSize:2,//默认每页显示的数据量
             pageNumber:1,//默认的请求页码数
             pageList:[2,4,6],//设置每页显示数量的选择列表
             columns:[[//声明响应的实体类数据和列的映射关系
                 {field:'pid',title:'新人编号',width:100},//一个json表示一列的映射，可以声明多个
                 {field:'pname',title:'新人姓名',width:100},//一个json表示一列的映射，可以声明多个
                 {field:'pmail',title:'新人邮箱',width:100},//一个json表示一列的映射，可以声明多个
                 {field:'phone',title:'新人手机号',width:100},//一个json表示一列的映射，可以声明多个
                 {field:'marrydate',title:'新婚日期',width:100},//一个json表示一列的映射，可以声明多个
                 {field:'regdate',title:'注册日期',width:100},//一个json表示一列的映射，可以声明多个
                 {field:'status',title:'账号状态',width:100}//一个json表示一列的映射，可以声明多个
             ]]
         })

     })
     function doSearch(){
         $('#marriedPersonTable').datagrid('load',{
             pname: $('#pname').val(),
             phone: $('#phone').val()
         });
     }
    </script>
</head>
<body>
    <%--声明panel组件区域--%>
    <div id="p" class="easyui-panel" title="新人管理" style="width:800px;height:400px;padding:10px;">
        <%--声明空表格，并使用js方式完成初始化--%>
        <table id="marriedPersonTable" ></table>
            <div id="tb" style="padding:3px">
                <span>名字:</span>
                <input id="pname" style="line-height:26px;border:1px solid #ccc">
                <span>电话:</span>
                <input id="phone" style="line-height:26px;border:1px solid #ccc">
                <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" onclick="doSearch()">Search</a>
            </div>
    </div>
</body>
</html>
