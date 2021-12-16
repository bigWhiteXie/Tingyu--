<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/12 0012
  Time: 上午 9:16
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
        //声明页面加载事件，完成DataGrid组件的初始化，分页加载角色信息
        $(function () {
            $("#roleDataGrid").datagrid({
                url:'role/roleInfo',//声明异步数据的请求地址
                rownumbers:true,//显示行号
                pagination:true,//显示分页工具栏(上一页，下一页...)
                pageSize:2,//默认每页显示的数据量
                pageNumber:1,//默认的请求页码数
                pageList:[2,4,6],//设置每页显示数量的选择列表
                toolbar:'#tb',
                checkOnSelect:false,
                columns:[[//声明响应的实体类数据和列的映射关系
                    {field:'pid',title:'新人编号',checkbox:true},//一个json表示一列的映射，可以声明多个
                    {field:'rid',title:'角色编号',width:80},//一个json表示一列的映射，可以声明多个
                    {field:'rname',title:'角色名称',width:100},//一个json表示一列的映射，可以声明多个
                    {field:'rdesc',title:'角色描述',width:100}//一个json表示一列的映射，可以声明多个
                ]]
            })
        })
        //声明页面加载事件:完成角色的新增
        $(function () {
            //给增加角色按钮添加单击事件
            $("#addRole").click(function () {
                //显示角色信息的对话框
                $("#addRoleDialog").dialog('open');
            })
            //给增加角色按钮添加单击事件，完成角色的异步新增
            $("#addRoleInfo").click(function () {
                //获取选择的菜单节点
                var nodes=$('#menuTree').tree('getChecked', ['checked','indeterminate']);
                //判断
                if(nodes!=null){
                    //获取选择的节点的ID
                    var mids="";
                    for(var i=0;i<nodes.length;i++){
                        mids+=nodes[i].id+",";
                    }
                    //将选择的节点的ID记录下来
                    $("#mids").val(mids);
                }
                //异步提交表单
                $("#roleAddFm").form('submit',{
                    url:'role/roleAdd',
                    success:function (data) {
                        if(eval(data)){
                            $.messager.alert("提示","角色新增成功","info");
                            $("#roleAddFm").form('reset');
                            $("#menuTree").tree('reload');
                            $("#addRoleDialog").dialog('close');
                            $("#roleDataGrid").datagrid('reload')
                        }else{
                            $.messager.alert("提示","角色新增失败","info");
                        }
                    }
                })
            })
        })
        //声明页面加载事件:完成角色的编辑
        $(function () {
            //给编辑角色按钮添加单击事件
            $("#editRole").click(function () {
                //获取选择的角色
                var trs=$("#roleDataGrid").datagrid('getChecked');
                //判断
                if(trs.length>1){
                    $.messager.alert("提示","只能选择一个","info");
                }else if(trs.length==0){
                    $.messager.alert("提示","请选择要编辑的角色","info");
                }else{
                    //重置菜单树
                    var nodes=$("#roleEditMenuTree").tree('getRoots');
                    for(var i=0;i<nodes.length;i++){
                        $('#roleEditMenuTree').tree('uncheck', nodes[i].target);
                    }
                    //回显角色的菜单，将角色已经具备的菜单置为选择状态
                    $.post("role/roleChildMenuInfo",{rid:trs[0].rid},function (data) {
                        for(var i=0;i<data.length;i++){
                            var node = $('#roleEditMenuTree').tree('find', data[i]);
                            $('#roleEditMenuTree').tree('check', node.target);
                        }
                    })

                    //将编辑的角色的信息回显到表单中
                    $("#roleEditFm").form('load',trs[0]);
                    //显示编辑对话框
                    $("#editRoleDialog").dialog('open')
                }

            })
            //给修改角色按钮添加添加单击事件
            $("#editRoleInfo").click(function () {
                //获取选择的菜单节点
                var nodes=$('#roleEditMenuTree').tree('getChecked', ['checked','indeterminate']);
                //判断
                if(nodes!=null){
                    //获取选择的节点的ID
                    var mids="";
                    for(var i=0;i<nodes.length;i++){
                        mids+=nodes[i].id+",";
                    }
                    //将选择的节点的ID记录下来
                    $("#midsEdit").val(mids);
                }
                //异步提交表单
                $("#roleEditFm").form('submit',{
                    url:'role/roleEdit',
                    success:function (data) {
                        if(eval(data)){
                            $.messager.alert("提示","角色修改成功","info");
                            $("#roleEditFm").form('reset');
                            $("#roleEditMenuTree").tree('reload');
                            $("#editRoleDialog").dialog('close');
                            $("#roleDataGrid").datagrid('reload')
                        }else{
                            $.messager.alert("提示","角色修改失败","info");
                        }
                    }
                })
            })
        })
        //声明页面加载事件:完成角色的删除
        $(function () {
            //给删除按钮添加单击事件
            $("#delRole").click(function () {
                //获取选择的行
                var trs=$("#roleDataGrid").datagrid('getChecked');
                if(trs.length==0){
                    $.messager.alert("提示","请选择要删除的行","info");
                }else{
                    $.messager.confirm("提示","你确定要删除吗?",function (r) {
                        if(r){
                            //获取要删除的角色的ID
                            var rids="";
                            for(var i=0;i<trs.length;i++){
                                rids+=trs[i].rid+",";
                            }
                            //发送Ajax请求
                            $.post("role/roleDel",{rids:rids},function (data) {
                                if(data){
                                    $.messager.alert("提示","删除成功","info");
                                    $("#roleDataGrid").datagrid('reload');
                                }else{
                                    $.messager.alert("提示","删除失败","info");
                                }
                            })
                        }
                    })
                }
            })
        })
    </script>
</head>
<body>
<%--使用dialog组件声明角色编辑对话框--%>
<div id="editRoleDialog" class="easyui-dialog" title="编辑角色信息" style="width:650px;height:550px;"
     data-options="iconCls: 'icon-save',modal:true, draggable:false,closed:true,top:20">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:false,title:'请编辑角色信息',collapsible:false" style="width:400px;padding:10px">
            <%--声明表单:收集要编辑的角色的信息--%>
            <div style="margin-top: 50px">
                <form id="roleEditFm" method="post">
                    <input type="hidden" name="midsEdit" id="midsEdit" value="">
                    <input type="hidden" name="rid" id="rid" value=""><%--记录要编辑的角色的id--%>
                    <div style="margin-bottom:20px;text-align: center;">
                        <input class="easyui-textbox" name="rname" label="角色名称:" prompt="角色名称" iconWidth="28" style="width:80%;height:34px;padding:10px;">
                    </div>
                    <div style="margin-bottom:20px;text-align: center;">
                        <input  class="easyui-textbox" name="rdesc" label="角色描述:" prompt="角色描述" iconWidth="28" style="width:80%;height:34px;padding:10px">
                    </div>
                    <div style="margin-bottom:20px;text-align: center;">
                        <a id="editRoleInfo" href="javascript:void(0)" class="easyui-linkbutton c1" style="width:120px">修改角色</a>
                    </div>
                </form>
            </div>

        </div>
        <div data-options="region:'center',title:'当前系统菜单'" style="padding:10px">
            <%--使用同步树完成菜单信息的加载--%>
            <ul class="easyui-tree" id="roleEditMenuTree" data-options="url:'menu/menuRoleInfo',checkbox:true"></ul>
        </div>
    </div>

</div>
<%--使用dialog组件声明角色增加对话框--%>
<div id="addRoleDialog" class="easyui-dialog" title="增加角色信息" style="width:650px;height:550px;"
     data-options="iconCls: 'icon-save',modal:true, draggable:false,closed:true">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:false,title:'请输入要增加的角色信息',collapsible:false" style="width:400px;padding:10px">
            <%--声明表单:收集要增加的角色的信息--%>
            <div style="margin-top: 50px">
                <form id="roleAddFm" method="post">
                    <input type="hidden" name="mids" id="mids" value=""><%--记录选择的菜单的Id--%>
                    <div style="margin-bottom:20px;text-align: center;">
                        <input class="easyui-textbox" name="rname" label="角色名称:" prompt="角色名称" iconWidth="28" style="width:80%;height:34px;padding:10px;">
                    </div>
                    <div style="margin-bottom:20px;text-align: center;">
                        <input  class="easyui-textbox" name="rdesc" label="角色描述:" prompt="角色描述" iconWidth="28" style="width:80%;height:34px;padding:10px">
                    </div>
                    <div style="margin-bottom:20px;text-align: center;">
                        <a id="addRoleInfo" href="javascript:void(0)" class="easyui-linkbutton c1" style="width:120px">增加角色</a>
                    </div>
                </form>
            </div>

        </div>
        <div data-options="region:'center',title:'当前系统菜单'" style="padding:10px">
            <%--使用同步树完成菜单信息的加载--%>
            <ul class="easyui-tree" id="menuTree" data-options="url:'menu/menuRoleInfo',checkbox:true"></ul>
        </div>
    </div>

</div>
<%--使用panel面板组件完成页面布局--%>
<div id="p" class="easyui-panel" title="角色管理" style="width:700px;height:500px;padding:10px;">
    <%--使用DataGrid组件分页加载主持人信息--%>
    <div style="margin-top: 30px">
        <%--声明表格：使用js方式完成DataGrid的初始化设置--%>
        <table id="roleDataGrid"></table>
        <%--声明工具栏组件：使用DataGrid的toolbar属性完成设置--%>
        <div id="tb">
            <a id="addRole" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加角色</a>
            <a id="editRole" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑角色</a>
            <a id="delRole" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除角色</a>
        </div>
    </div>
</div>
</body>
</html>
