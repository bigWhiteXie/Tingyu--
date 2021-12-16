<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11 0011
  Time: 下午 14:17
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
        <%--声明页面加载事件:完成菜单的新增--%>
        $(function () {
            //给新增按钮添加单击事件
            $("#addMenu").click(function () {
                //获取选择的菜单树节点
                var node=$("#menuTree").tree('getSelected');
                //将选择的菜单的ID作为新增的菜单的上级ID记录到表单的隐藏标签中
                $("#pid").val(node?node.id:"0")
                //显示菜单新增的对话框
                $("#addMenuDialog").dialog('open');
            })
            //给确认增加按钮添加单击事件，完成菜单的异步新增
            $("#addMenuInfo").click(function () {
                //异步提交表单
                $("#menuAddFm").form('submit',{
                    url:'menu/menuAdd',
                    success:function (data) {
                        if(eval(data)){
                            $.messager.alert("提示","新增成功","info");
                            $("#menuAddFm").form('reset');
                            $("#addMenuDialog").dialog('close');
                            $("#menuTree").tree('reload');
                        }else{
                            $.messager.alert("提示","新增失败","info");
                        }
                    }
                })
            })
        })
        <%--声明页面加载事件:完成菜单的编辑--%>
        $(function () {
            //给编辑按钮添加单击事件
            $("#editMenu").click(function () {
                //获取选择的菜单节点
                var node=$("#menuTree").tree('getSelected');
                //判断
                if(node !=null){
                    //将选择的菜单的信息回显到form表单中
                    $("#mid").val(node.id);
                    $("#mname").textbox('setValue',node.text);
                    $("#url").textbox('setValue',node.attributes.url);
                    $("#mdesc").textbox('setValue',node.attributes.mdesc);
                    //显示菜单编辑的对话框
                    $("#editMenuDialog").dialog('open')
                }else{
                    $.messager.alert("提示","请选择要编辑的菜单","info");
                }
            })
            //给确认编辑增加单击事件，完成数据的异步提交
            $("#editMenuInfo").click(function () {
                $("#menuEditFm").form('submit',{
                    url:'menu/menuEdit',
                    success:function (data) {
                        if(eval(data)){
                            $.messager.alert("提示","编辑成功","info");
                            $("#menuEditFm").form('reset');
                            $("#editMenuDialog").dialog('close');
                            $("#menuTree").tree('reload');
                        }else{
                            $.messager.alert("提示","编辑失败","info");
                        }
                    }
                })
            })
        })
        <%--声明页面加载事件:完成菜单的删除--%>
        $(function () {
            //给删除按钮添加单击事件
            $("#delMenu").click(function () {
                //获取选择的节点
                var node=$("#menuTree").tree('getSelected');
                //判断
                if(node ==null){
                    $.messager.alert("提示","请选择要删除的节点","info")
                }else{
                    if(node.attributes.isparent==1){
                        $.messager.alert("提示","父节点无法直接删除","info")
                    }else{
                        $.post("menu/menuDel",{mid:node.id,pid:node.attributes.pid},function (data) {
                            if(data){
                                $.messager.alert("提示","删除成功","info");
                                $("#menuTree").tree('reload');
                            }else{
                                $.messager.alert("提示","删除失败","info");
                            }
                        })
                    }
                }
            })
        })
    </script>
</head>
<body>
    <%--使用panel面板完成页面布局--%>
    <div class="easyui-panel" style="width:700px;height:400px;padding:10px;">
        <%--使用dialog组件声明菜单信息编辑对话框--%>
        <div id="editMenuDialog" class="easyui-dialog" title="编辑菜单信息" style="width:400px;height:380px;padding:10px"
             data-options="iconCls: 'icon-save',buttons:'#menuDialogButton',modal:true, draggable:false,closed:true">
            <%--声明form表单:收集要增加的菜单信息 --%>
            <form id="menuEditFm" method="post">
                <input type="hidden" id="mid" name="mid" value="0"><%--记录要编辑的菜单的ID--%>
                <div style="margin-bottom:20px;text-align: center;">
                    <input class="easyui-textbox" id="mname" name="mname" label="菜单名称:" iconWidth="28" style="width:80%;height:34px;padding:10px;">
                </div>
                <div style="margin-bottom:20px;text-align: center;">
                    <input  class="easyui-textbox" id="url" name="url" label="菜单url地址:" iconWidth="28" style="width:80%;height:34px;padding:10px">
                </div>
                <div style="margin-bottom:20px;text-align: center;">
                    <input  class="easyui-textbox" id="mdesc" name="mdesc" label="菜单描述:" iconWidth="28" style="width:80%;height:34px;padding:10px">
                </div>
            </form>
        </div>
        <div id="menuDialogButton">
            <a id="editMenuInfo" href="javascript:void(0)" class="easyui-linkbutton">确认编辑</a>
        </div>
        <%--使用dialog组件声明菜单信息增加对话框--%>
        <div id="addMenuDialog" class="easyui-dialog" title="增加菜单信息" style="width:400px;height:300px;padding:10px"
             data-options="iconCls: 'icon-save',buttons:'#menuDialogButton',modal:true, draggable:false,closed:true">
            <%--声明form表单:收集要增加的菜单信息 --%>
            <form id="menuAddFm" method="post">
                <input type="hidden" id="pid" name="pid" value="0"><%--记录新增菜单的上级Id，默认为0--%>
                <div style="margin-bottom:20px;text-align: center;">
                    <input class="easyui-textbox" name="mname" labelWidth="120" label="菜单名称:" prompt="菜单名称" iconWidth="28" style="width:80%;height:34px;padding:10px;">
                </div>
                <div style="margin-bottom:20px;text-align: center;">
                    <input id="pass" class="easyui-textbox" name="url" labelWidth="120" label="菜单url地址:" prompt="菜单url地址" iconWidth="28" style="width:80%;height:34px;padding:10px">
                </div>
                <div style="margin-bottom:20px;text-align: center;">
                    <input id="cphone" class="easyui-textbox" name="mdesc" labelWidth="120" label="菜单描述:" prompt="菜单描述" iconWidth="28" style="width:80%;height:34px;padding:10px">
                </div>
            </form>
        </div>
        <div id="menuDialogButton">
            <a id="addMenuInfo" href="javascript:void(0)" class="easyui-linkbutton">确认增加</a>
        </div>
        <%--使用layout组件完成布局--%>
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'west',split:false,title:'操作',collapsible:false" style="width:160px;padding:10px">
                <a id="addMenu" href="javascript:void(0)" class="easyui-linkbutton c1" style="width:120px">增加菜单</a><br><br>
                <a id="editMenu" href="javascript:void(0)" class="easyui-linkbutton c2" style="width:120px">编辑菜单</a><br><br>
                <a id="delMenu" href="javascript:void(0)" class="easyui-linkbutton c3" style="width:120px">删除菜单</a><br><br>
                <a href="javascript:void(0)" onclick="javascript:$('#menuTree').tree('reload');" class="easyui-linkbutton c4" style="width:120px">刷新菜单</a><br><br>
            </div>
            <div data-options="region:'center',title:'当前系统菜单'" style="padding:10px">
                <%--使用异步树完成菜单信息的加载--%>
                <ul class="easyui-tree" id="menuTree" data-options="url:'menu/menuManagerInfo'"></ul>
            </div>
        </div>
    </div>
</body>
</html>
