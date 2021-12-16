<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/11/25
  Time: 20:56
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
    <script>
        $(()=>{
            $("#dg").datagrid({
                url:'company/companyInfo',//声明异步数据的请求地址
                fitColumns:true,
                toolbar:"#tb",
                rownumbers:true,//显示行号
                pagination:true,//显示分页工具栏(上一页，下一页...)
                pageSize:2,//默认每页显示的数据量
                pageNumber:1,//默认的请求页码数
                pageList:[2,4,6],//设置每页显示数量的选择列表
                toolbar:'#tb',
                columns:[[//声明响应的实体类数据和列的映射关系
                    {field:'cid',title:'公司编号',checkbox:true},//一个json表示一列的映射，可以声明多个
                    {field:'cpwd',title:'密码',width:60,

                    },//一个json表示一列的映射，可以声明多个
                    {field:'cname',title:'公司名称',width:80},//一个json表示一列的映射，可以声明多个
                    {field:'cphone',title:'公司电话',width:100},//一个json表示一列的映射，可以声明多个
                    {field:'ceo',title:'公司法人',width:200},//一个json表示一列的映射，可以声明多个
                    {field:'cmail',title:'公司邮箱',width:80,

                    },//一个json表示一列的映射，可以声明多个
                    {field:'starttime',title:'注册时间',width:50},//一个json表示一列的映射，可以声明多个
                    {field:'status',title:'账号状态',width:50,

                    },//一个json表示一列的映射，可以声明多个
                    {field:'ordernumber',title:'订单数量',width:50,

                    },//一个json表示一列的映射，可以声明多个
                    //一个json表示一列的映射，可以声明多个
                ]]
            })
            $("#search").click(function () {
                $("#dg").datagrid('load',{
                    cname:$("#cname").val(),
                    status:$("#status").val(),
                    strong:$("#strong").val(),
                })
            })
        })
        /********给添加公司按钮添加单击事件，完成公司信息的新增***************************/
        $(function () {
            //给添加主持人按钮添加单击事件
            $("#addCompany").click(function () {
                //显示主持人新增的对话框
                $("#addHostDialog").dialog('open');
            })
            //给保存按钮添加单击事件
            $("#addHostInfoButton").click(function () {
                //异步提交表单数据
                $("#hostFm").form('submit',{
                    url:'company/companyAdd',
                    success:function (data) {
                        if(eval(data)){
                            $.messager.alert("提示","新增成功","info");//提示语
                            $("#addHostDialog").dialog('close');//关闭对话框
                            $("#hostFm").form('reset');//重置表单
                            $("#dg").datagrid('reload');//重新加载DataGrid的数据
                        }else{
                            $.messager.alert("提示","新增失败","info");//提示语
                        }
                    }
                })
            })
        })
        /************声明页面加载事件，给账号状态按钮添加单击事件，完成账号状态的修改**************************************************/
        $(function () {
            //给账号状态按钮新增单击事件
            $("#idStatus").click(function () {
                //获取选择的主持人
                var trs=$("#dg").datagrid('getChecked');
                //判断
                if(trs.length>0){
                    //将选择的主持人的ID使用表单的隐藏域标签记录下来
                    var hids="";
                    for(var i=0;i<trs.length;i++){
                        hids+=trs[i].hid+",";
                    }
                    $("#hids").val(hids);
                    //显示账号状态修改对话框
                    $("#zcrStatus_dlg").dialog('open');
                }else{
                    $.messager.alert("提示","请选择公司信息","info");
                }
            })
            //给账号状态保存按钮添加单击事件，完成表单的异步提交
            $("#hostAccountSave").click(function () {
                $("#zcrStatus_fm").form('submit',{
                    url:'company/companyStatus',
                    success:function (data) {
                        if(eval(data)){
                            $.messager.alert("提示","修改成功","info");//提示语
                            $("#zcrStatus_fm").form('reset');//重置表单
                            $("#zcrStatus_dlg").dialog('close');//关闭对话框
                            $("#dg").datagrid('reload');//重新加载数据
                        }else{
                            $.messager.alert("提示","修改失败","error");//提示语
                        }
                    }
                })
            })
        })
        /************声明页面加载事件，完成公司编辑操作**************************************************/
        $(function () {
            //给权限批量操作按钮添加单击事件
            $("#updateInfo").click(function () {
                //获取选择的主持人
                var trs=$("#dg").datagrid('getChecked');
                //判断
                if(trs.length>1){
                    //将选择的主持人的ID使用表单的隐藏域标签记录下来
                    $.messager.alert("提示","请选择一个公司信息","info");

                }else if(trs.length==0){
                    $.messager.alert("提示","请选择一个信息","info");
                }else{
                    $("#companyEditDialog").dialog('open');
                    $("#fmEdit").form("load",trs[0])
                }
            })
            //给确认按钮增加单击事件，完成权限信息的异步表单提交
            $("#EditCompanyInfoButton").click(function () {
                $("#fmEdit").form('submit',{
                    url:'company/companyUpdate',
                    success:function (data) {
                        if(eval(data)){
                            $.messager.alert("提示","权限重置成功","info");
                            $("#fmEdit").form('reset');//重置表单
                            $("#companyEditDialog").dialog('close');//关闭对话框
                            $("#dg").datagrid('reload');//重新加载表格数据
                        }else{
                            $.messager.alert("提示","权限重置失败","info");
                        }
                    }
                })
            })
        })
        /************声明页面加载事件，完成公司编辑操作**************************************************/
        $(function () {
            //给权限批量操作按钮添加单击事件
            $("#plannerList").click(function () {
                //获取选择的主持人
                var trs=$("#dg").datagrid('getChecked');
                //判断
                if(trs.length>1){
                    //将选择的主持人的ID使用表单的隐藏域标签记录下来
                    $.messager.alert("提示","只能选择一个公司信息","info");

                }else if(trs.length==0){
                    $.messager.alert("提示","请选择一个公司","info");
                }else{
                    window.location.href="memberManager/plannerList.jsp?cid="+trs[0].cid
                }
            })

        })
    </script>
    <script>
            function myformatter(date){
            var y = date.getFullYear();
            var m = date.getMonth()+1;
            var d = date.getDate();
            return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
        }
            function myparser(s){
            if (!s) return new Date();
            var ss = (s.split('-'));
            var y = parseInt(ss[0],10);
            var m = parseInt(ss[1],10);
            var d = parseInt(ss[2],10);
            if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
            return new Date(y,m-1,d);
        } else {
            return new Date();
        }
        }
    </script>
    </script>
</head>
<body>
<div id="p" class="easyui-panel" title="主持人管理"
     style="width:1000px;height:400px;padding:10px;">
    <div style="width: 750px;height: 40px;border: 0px solid red;margin: 0px auto;margin-top: 30px">
        <form id="fm1">
            <input class="easyui-textbox" id="cname" name="cname" data-options="prompt:'公司名称'" style="width:100px">
            <select id="status" class="easyui-combobox" name="status" style="width:110px;">
                <option value="">账号状态</option>
                <option value="1">正常</option>
                <option value="0">禁用</option>
            </select>
            <select id="strong" class="easyui-combobox" name="strong" style="width:110px;">
                <option value="">订单排序</option>
                <option value="asc">升序</option>
                <option value="desc">降序</option>
            </select>

            <a id="search" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="margin-left: 30px">查询</a>

            <a id="btn2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">导出</a>
        </form>

    </div>
    <table id="dg"></table>
    <div id="tb">
        <a id="addCompany" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" >添加公司</a>
        <a id="updateInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" >编辑公司信息</a>
        <a id="plannerList" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true">策划师列表</a>
        <a id="idStatus" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true">账号状态</a>
    </div>
    <%--添加主持人信息对话框的展示--%>
    <div id="addHostDialog" title="添加公司" class="easyui-dialog" style="width:400px" data-options="closed:'true',modal:true,border:'thin',buttons:'#dlg-buttons'">
        <form id="hostFm" method="post" novalidate style="margin:0;padding:20px 50px">
            <h3>请求填写完整的公司信息:</h3>
            <div style="margin-bottom:10px">
                <input name="cname" class="easyui-textbox" labelWidth="120" label="公司名称:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="cpwd" class="easyui-textbox" labelWidth="120"  label="密码:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="ceo" class="easyui-textbox" labelWidth="120"  label="公司法人:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="cphone" class="easyui-textbox" labelWidth="120" label="公司电话:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="cmail" class="easyui-textbox" labelWidth="120"  label="公司邮箱:" style="width:100%">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a id="addHostInfoButton" href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"  style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#addHostDialog').dialog('close')" style="width:90px">取消</a>
    </div>
    <%--主持人账号状态--%>
    <div id="zcrStatus_dlg" title="修改账号状态" class="easyui-dialog" style="width:450px" data-options="closed:true,modal:true,border:'thin',buttons:'#zcrStatus_dlg-buttons'">
        <form id="zcrStatus_fm" method="post" novalidate style="margin:0;padding:20px 50px">
            <input type="hidden" name="hids" value="" id="hids">
            <h3>修改账号状态</h3>
            <div style="margin-bottom:10px">
                账号状态&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="easyui-radiobutton" name="status" value="1" labelWidth="45" checked="checked" label="正常:">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input class="easyui-radiobutton" name="status" value="0" labelWidth="45" label="禁用:">
            </div>
        </form>
    </div>
    <div id="zcrStatus_dlg-buttons">
        <a id="hostAccountSave" href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" style="width:90px">确认修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#zcrStatus_dlg').dialog('close')" style="width:90px">取消</a>
    </div>
    <%--主持人授权的对话框的展示--%>
    <%--声明公司编辑的对话框--%>
    <div id="companyEditDialog" title="编辑公司信息" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons-edit'">
        <form id="fmEdit" method="post" novalidate style="margin:0;padding:20px 50px">
            <%--声明隐藏标签记录公司的ID--%>
            <input type="hidden" name="cid" value="">
            <h3>编辑公司信息:</h3>
            <div style="margin-bottom:10px">
                <input name="cname" class="easyui-textbox" required="true" label="公司名称:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="cpwd" class="easyui-textbox" required="true" label="公司密码:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="ceo" class="easyui-textbox" required="true" label="公司ceo:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="cphone" class="easyui-textbox" required="true" label="公司手机号:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="cmail" class="easyui-textbox" required="true" label="公司邮箱:" style="width:100%">
            </div>
        </form>
    </div>
    <div id="dlg-buttons-edit">
        <a id="EditCompanyInfoButton" href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"  style="width:90px">确认修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#companyEditDialog').dialog('close')" style="width:90px">取消</a>
    </div>
</div>
</body>
</html>
