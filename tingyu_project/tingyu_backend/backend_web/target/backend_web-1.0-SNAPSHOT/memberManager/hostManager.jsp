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
                url:'host/hostInfo',//声明异步数据的请求地址
                fitColumns:true,
                toolbar:"#tb",
                rownumbers:true,//显示行号
                pagination:true,//显示分页工具栏(上一页，下一页...)
                pageSize:2,//默认每页显示的数据量
                pageNumber:1,//默认的请求页码数
                pageList:[2,4,6],//设置每页显示数量的选择列表
                toolbar:'#tb',
                columns:[[//声明响应的实体类数据和列的映射关系
                    {field:'pid',title:'新人编号',checkbox:true},//一个json表示一列的映射，可以声明多个
                    {field:'strong',title:'权重',width:60,
                        formatter:function (value,row,index) {
                            return "<input type='text' value='"+value+"' style='width: 50px;'/>";
                        }
                    },//一个json表示一列的映射，可以声明多个
                    {field:'hname',title:'姓名',width:80},//一个json表示一列的映射，可以声明多个
                    {field:'hphone',title:'手机号',width:100},//一个json表示一列的映射，可以声明多个
                    {field:'starttime',title:'开通时间',width:200},//一个json表示一列的映射，可以声明多个
                    {field:'hpprice',title:'价格',width:80,
                        formatter:function (value,row,index) {
                            return row.hostPower?row.hostPower.hpprice:"";
                        }
                    },//一个json表示一列的映射，可以声明多个
                    {field:'ordernumber',title:'订单量',width:50},//一个json表示一列的映射，可以声明多个
                    {field:'hpdiscount',title:'折扣',width:50,
                        formatter:function (value,row,index) {
                            return row.hostPower?row.hostPower.hpdiscount+"折":"";
                        }
                    },//一个json表示一列的映射，可以声明多个
                    {field:'hpstart',title:'星推荐',width:50,
                        formatter:function (value,row,index) {
                            if(row.hostPower) {
                                return row.hostPower.hpstar == '1' ? "是" : "否";
                            }
                            return ""
                        }
                    },//一个json表示一列的映射，可以声明多个
                    {field:'status',title:'账号状态',width:100,
                        formatter:function (value,row,index) {
                            return row.status=='1'?"正常":"禁用";
                        }}//一个json表示一列的映射，可以声明多个
                ]]
            })
            $("#search").click(function () {
                $("#dg").datagrid('load',{
                    hname:$("#hname").val(),
                    status:$("#status").val(),
                    strong:$("#strong").val(),
                    hpstart:$("#start").val(),
                    hpdiscount:$("#discount").val()
                })
            })
        })
        /********给添加主持人按钮添加单击事件，完成主持人信息的新增***************************/
        $(function () {
            //给添加主持人按钮添加单击事件
            $("#addHost").click(function () {
                //显示主持人新增的对话框
                $("#addHostDialog").dialog('open');
            })
            //给保存按钮添加单击事件
            $("#addHostInfoButton").click(function () {
                //异步提交表单数据
                $("#hostFm").form('submit',{
                    url:'host/hostAdd',
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
            $("#hostAccount").click(function () {
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
                    $.messager.alert("提示","请选择主持人信息","info");
                }
            })
            //给账号状态保存按钮添加单击事件，完成表单的异步提交
            $("#hostAccountSave").click(function () {
                $("#zcrStatus_fm").form('submit',{
                    url:'host/hostStatus',
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
        /************声明页面加载事件，完成权限的批量操作**************************************************/
        $(function () {
            //给权限批量操作按钮添加单击事件
            $("#hostPowerInfo").click(function () {
                //获取选择的主持人
                var trs=$("#dg").datagrid('getChecked');
                //判断
                if(trs.length>0){
                    //将选择的主持人的ID使用表单的隐藏域标签记录下来
                    var hids="";
                    for(var i=0;i<trs.length;i++){
                        hids+=trs[i].hid+",";
                    }
                    $("#hostids").val(hids);
                    //显示账号状态修改对话框
                    $("#hostPower_dlg").dialog('open');
                }else{
                    $.messager.alert("提示","请选择主持人信息","info");
                }
            })
            //给确认按钮增加单击事件，完成权限信息的异步表单提交
            $("#updatePowerInfos").click(function () {
                $("#powerFms").form('submit',{
                    url:'host/hostPowerOper',
                    success:function (data) {
                        if(eval(data)){
                            $.messager.alert("提示","权限重置成功","info");
                            $("#powerFms").form('reset');//重置表单
                            $("#hostPower_dlg").dialog('close');//关闭对话框
                            $("#dg").datagrid('reload');//重新加载表格数据
                        }else{
                            $.messager.alert("提示","权限重置失败","info");
                        }
                    }
                })
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
            <input class="easyui-textbox" id="hname" name="hname" data-options="prompt:'姓名'" style="width:100px">
            <select id="status" class="easyui-combobox" name="status" style="width:110px;">
                <option value="">账号状态</option>
                <option value="1">正常</option>
                <option value="0">禁用</option>
            </select>
            <select id="strong" class="easyui-combobox" name="strong" style="width:110px;">
                <option value="">权重排序</option>
                <option value="asc">升序</option>
                <option value="desc">降序</option>
            </select>
            <select id="start" class="easyui-combobox" name="hpstart" style="width:110px;">
                <option value="">星推荐</option>
                <option value="1">是</option>
                <option value="0">否</option>
            </select>
            <select id="discount" class="easyui-combobox" name="hpdiscount" style="width:110px;">
                <option value="">折扣</option>
                <option value="6">六折</option>
                <option value="7">七折</option>
                <option value="8">八折</option>
                <option value="9">九折</option>
            </select>

            <a id="search" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="margin-left: 30px">查询</a>

            <a id="btn2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">导出</a>
        </form>

    </div>
    <table id="dg"></table>
    <div id="tb">
        <a id="addHost" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" >添加主持人</a>
        <a id="hostAccount" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" >账号状态</a>
        <a id="hostPowerInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true">权限批量操作</a>
    </div>
    <%--添加主持人信息对话框的展示--%>
    <div id="addHostDialog" title="新增主持人" class="easyui-dialog" style="width:400px" data-options="closed:'true',modal:true,border:'thin',buttons:'#dlg-buttons'">
        <form id="hostFm" method="post" novalidate style="margin:0;padding:20px 50px">
            <h3>请求填写完整的主持人信息:</h3>
            <div style="margin-bottom:10px">
                <input name="hname" class="easyui-textbox" labelWidth="120" label="主持人姓名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="hpwd" class="easyui-textbox" labelWidth="120"  label="主持人密码:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="hphone" class="easyui-textbox" labelWidth="120" label="主持人电话:" style="width:100%">
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
    <div id="hostPower_dlg" class="easyui-dialog" title="批量操作" style="width:600px;height:500px;padding:10px"
         data-options="iconCls: 'icon-save',buttons:'#hostDialogButtons',modal:true, draggable:false,closed:true,top:40">
        <%--声明form表单:收集 要增加的主持人信息 --%>
        <form id="powerFms" method="post">
            <%--使用table表格显示权限设置的页面效果--%>
            <table cellpadding="10px">
                <tr>
                    <td>
                        <%--记录要进行权限设置的主持人的Id--%>
                        <input type="hidden" id="hostids" name="hostids" value="">
                    </td>
                </tr>
                <tr>
                    <td align="right">是否星推荐:</td>
                    <td>
                        <input class="easyui-radiobutton" name="hpstar" value="1" labelWidth="50" labelAlign="right" label="是:">
                        <input class="easyui-radiobutton" name="hpstar" value="0" labelWidth="50" labelAlign="right" label="否:">
                    </td>
                </tr>
                <tr>
                    <td align="right">星推荐有效期:</td>
                    <td>
                        <input class="easyui-datebox" name="hpstart_begindate" data-options="formatter:myformatter,parser:myparser" style="width:45%;">
                        --
                        <input class="easyui-datebox" name="hpstart_enddate" data-options="formatter:myformatter,parser:myparser" style="width:45%;">
                    </td>
                </tr>
                <tr>
                    <td align="right">星推荐时间:</td>
                    <td>
                        <input class="easyui-timespinner" data-options="showSeconds:true" name="hpstart_begintime" value="00:00:00" style="width:45%;">
                        --
                        <input class="easyui-timespinner"  data-options="showSeconds:true" name="hpstart_endtime" value="00:00:00" style="width:45%;">
                    </td>
                </tr>
                <tr>
                    <td align="right">自添订单:</td>
                    <td>
                        <input class="easyui-radiobutton" name="hp_order_power" value="1" labelWidth="50" labelAlign="right" label="是:">
                        <input class="easyui-radiobutton" name="hp_order_power" value="0" labelWidth="50" labelAlign="right" label="否:">
                    </td>
                </tr>
                <tr>
                    <td align="right">折扣:</td>
                    <td>
                        <input class="easyui-combobox" name="hpdiscount"  prompt="折扣"  style="width:100px;" data-options="
                                    editable:false,
                                    panelHeight:70,
                                    valueField: 'label',
                                    textField: 'value',
                                    data: [{
                                        label: '9',
                                        value: '9'
                                    },{
                                        label: '8',
                                        value: '8'
                                    },{
                                        label: '7',
                                        value: '7'
                                    }]" />
                    </td>
                </tr>
                <tr>
                    <td align="right">折扣周期:</td>
                    <td>
                        <input class="easyui-datebox" name="hp_dis_starttime" data-options="formatter:myformatter,parser:myparser" style="width:45%;">
                        --
                        <input class="easyui-datebox" name="hp_dis_endtime"  data-options="formatter:myformatter,parser:myparser" style="width:45%;">
                    </td>
                </tr>
                <tr>
                    <td align="right">价格:</td>
                    <td>
                        <input class="easyui-numberbox" name="hpprice" precision="2"  style="width:45%;">
                    </td>
                </tr>
                <tr>
                    <td align="right">管理费:</td>
                    <td>
                        <input class="easyui-numberbox" name="hcosts"  precision="2"  style="width:45%;">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <%--声明主持人信息增加对话框中的按钮工具--%>
    <div id="hostDialogButtons">
        <a id="updatePowerInfos" href="javascript:void(0)" class="easyui-linkbutton">确认</a>
    </div>
</div>
</body>
</html>
