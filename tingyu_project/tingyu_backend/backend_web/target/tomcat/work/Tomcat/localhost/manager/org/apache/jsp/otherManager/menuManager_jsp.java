/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2021-12-03 08:23:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.otherManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menuManager_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    //http://localhost:8080/01_sxtoa_war_exploded/

      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
      out.write("    <title>Title</title>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"static/themes/default/easyui.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"static/themes/icon.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"static/demo.css\">\r\n");
      out.write("    <script type=\"text/javascript\" src=\"static/js/jquery.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"static/js/jquery.easyui.min.js\"></script>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        $(function () {\r\n");
      out.write("            //?????????????????????????????????\r\n");
      out.write("            $(\"#addMenu\").click(function () {\r\n");
      out.write("                //??????????????????????????????\r\n");
      out.write("                var node=$(\"#menuTree\").tree('getSelected');\r\n");
      out.write("                //?????????????????????ID??????????????????????????????ID?????????????????????????????????\r\n");
      out.write("                $(\"#pid\").val(node?node.id:\"0\")\r\n");
      out.write("                //??????????????????????????????\r\n");
      out.write("                $(\"#addMenuDialog\").dialog('open');\r\n");
      out.write("            })\r\n");
      out.write("            //?????????????????????????????????????????????????????????????????????\r\n");
      out.write("            $(\"#addMenuInfo\").click(function () {\r\n");
      out.write("                //??????????????????\r\n");
      out.write("                $(\"#menuAddFm\").form('submit',{\r\n");
      out.write("                    url:'menu/menuAdd',\r\n");
      out.write("                    success:function (data) {\r\n");
      out.write("                        if(eval(data)){\r\n");
      out.write("                            $.messager.alert(\"??????\",\"????????????\",\"info\");\r\n");
      out.write("                            $(\"#menuAddFm\").form('reset');\r\n");
      out.write("                            $(\"#addMenuDialog\").dialog('close');\r\n");
      out.write("                            $(\"#menuTree\").tree('reload');\r\n");
      out.write("                        }else{\r\n");
      out.write("                            $.messager.alert(\"??????\",\"????????????\",\"info\");\r\n");
      out.write("                        }\r\n");
      out.write("                    }\r\n");
      out.write("                })\r\n");
      out.write("            })\r\n");
      out.write("        })\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        $(function () {\r\n");
      out.write("            //?????????????????????????????????\r\n");
      out.write("            $(\"#editMenu\").click(function () {\r\n");
      out.write("                //???????????????????????????\r\n");
      out.write("                var node=$(\"#menuTree\").tree('getSelected');\r\n");
      out.write("                //??????\r\n");
      out.write("                if(node !=null){\r\n");
      out.write("                    //????????????????????????????????????form?????????\r\n");
      out.write("                    $(\"#mid\").val(node.id);\r\n");
      out.write("                    $(\"#mname\").textbox('setValue',node.text);\r\n");
      out.write("                    $(\"#url\").textbox('setValue',node.attributes.url);\r\n");
      out.write("                    $(\"#mdesc\").textbox('setValue',node.attributes.mdesc);\r\n");
      out.write("                    //??????????????????????????????\r\n");
      out.write("                    $(\"#editMenuDialog\").dialog('open')\r\n");
      out.write("                }else{\r\n");
      out.write("                    $.messager.alert(\"??????\",\"???????????????????????????\",\"info\");\r\n");
      out.write("                }\r\n");
      out.write("            })\r\n");
      out.write("            //???????????????????????????????????????????????????????????????\r\n");
      out.write("            $(\"#editMenuInfo\").click(function () {\r\n");
      out.write("                $(\"#menuEditFm\").form('submit',{\r\n");
      out.write("                    url:'menu/menuEdit',\r\n");
      out.write("                    success:function (data) {\r\n");
      out.write("                        if(eval(data)){\r\n");
      out.write("                            $.messager.alert(\"??????\",\"????????????\",\"info\");\r\n");
      out.write("                            $(\"#menuEditFm\").form('reset');\r\n");
      out.write("                            $(\"#editMenuDialog\").dialog('close');\r\n");
      out.write("                            $(\"#menuTree\").tree('reload');\r\n");
      out.write("                        }else{\r\n");
      out.write("                            $.messager.alert(\"??????\",\"????????????\",\"info\");\r\n");
      out.write("                        }\r\n");
      out.write("                    }\r\n");
      out.write("                })\r\n");
      out.write("            })\r\n");
      out.write("        })\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        $(function () {\r\n");
      out.write("            //?????????????????????????????????\r\n");
      out.write("            $(\"#delMenu\").click(function () {\r\n");
      out.write("                //?????????????????????\r\n");
      out.write("                var node=$(\"#menuTree\").tree('getSelected');\r\n");
      out.write("                //??????\r\n");
      out.write("                if(node ==null){\r\n");
      out.write("                    $.messager.alert(\"??????\",\"???????????????????????????\",\"info\")\r\n");
      out.write("                }else{\r\n");
      out.write("                    if(node.attributes.isparent==1){\r\n");
      out.write("                        $.messager.alert(\"??????\",\"???????????????????????????\",\"info\")\r\n");
      out.write("                    }else{\r\n");
      out.write("                        $.post(\"menu/menuDel\",{mid:node.id,pid:node.attributes.pid},function (data) {\r\n");
      out.write("                            if(data){\r\n");
      out.write("                                $.messager.alert(\"??????\",\"????????????\",\"info\");\r\n");
      out.write("                                $(\"#menuTree\").tree('reload');\r\n");
      out.write("                            }else{\r\n");
      out.write("                                $.messager.alert(\"??????\",\"????????????\",\"info\");\r\n");
      out.write("                            }\r\n");
      out.write("                        })\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("            })\r\n");
      out.write("        })\r\n");
      out.write("    </script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("    <div class=\"easyui-panel\" style=\"width:700px;height:400px;padding:10px;\">\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        <div id=\"editMenuDialog\" class=\"easyui-dialog\" title=\"??????????????????\" style=\"width:400px;height:380px;padding:10px\"\r\n");
      out.write("             data-options=\"iconCls: 'icon-save',buttons:'#menuDialogButton',modal:true, draggable:false,closed:true\">\r\n");
      out.write("            ");
      out.write("\r\n");
      out.write("            <form id=\"menuEditFm\" method=\"post\">\r\n");
      out.write("                <input type=\"hidden\" id=\"mid\" name=\"mid\" value=\"0\">");
      out.write("\r\n");
      out.write("                <div style=\"margin-bottom:20px;text-align: center;\">\r\n");
      out.write("                    <input class=\"easyui-textbox\" id=\"mname\" name=\"mname\" label=\"????????????:\" iconWidth=\"28\" style=\"width:80%;height:34px;padding:10px;\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div style=\"margin-bottom:20px;text-align: center;\">\r\n");
      out.write("                    <input  class=\"easyui-textbox\" id=\"url\" name=\"url\" label=\"??????url??????:\" iconWidth=\"28\" style=\"width:80%;height:34px;padding:10px\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div style=\"margin-bottom:20px;text-align: center;\">\r\n");
      out.write("                    <input  class=\"easyui-textbox\" id=\"mdesc\" name=\"mdesc\" label=\"????????????:\" iconWidth=\"28\" style=\"width:80%;height:34px;padding:10px\">\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"menuDialogButton\">\r\n");
      out.write("            <a id=\"editMenuInfo\" href=\"javascript:void(0)\" class=\"easyui-linkbutton\">????????????</a>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        <div id=\"addMenuDialog\" class=\"easyui-dialog\" title=\"??????????????????\" style=\"width:400px;height:300px;padding:10px\"\r\n");
      out.write("             data-options=\"iconCls: 'icon-save',buttons:'#menuDialogButton',modal:true, draggable:false,closed:true\">\r\n");
      out.write("            ");
      out.write("\r\n");
      out.write("            <form id=\"menuAddFm\" method=\"post\">\r\n");
      out.write("                <input type=\"hidden\" id=\"pid\" name=\"pid\" value=\"0\">");
      out.write("\r\n");
      out.write("                <div style=\"margin-bottom:20px;text-align: center;\">\r\n");
      out.write("                    <input class=\"easyui-textbox\" name=\"mname\" labelWidth=\"120\" label=\"????????????:\" prompt=\"????????????\" iconWidth=\"28\" style=\"width:80%;height:34px;padding:10px;\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div style=\"margin-bottom:20px;text-align: center;\">\r\n");
      out.write("                    <input id=\"pass\" class=\"easyui-textbox\" name=\"url\" labelWidth=\"120\" label=\"??????url??????:\" prompt=\"??????url??????\" iconWidth=\"28\" style=\"width:80%;height:34px;padding:10px\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div style=\"margin-bottom:20px;text-align: center;\">\r\n");
      out.write("                    <input id=\"cphone\" class=\"easyui-textbox\" name=\"mdesc\" labelWidth=\"120\" label=\"????????????:\" prompt=\"????????????\" iconWidth=\"28\" style=\"width:80%;height:34px;padding:10px\">\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"menuDialogButton\">\r\n");
      out.write("            <a id=\"addMenuInfo\" href=\"javascript:void(0)\" class=\"easyui-linkbutton\">????????????</a>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        <div class=\"easyui-layout\" data-options=\"fit:true\">\r\n");
      out.write("            <div data-options=\"region:'west',split:false,title:'??????',collapsible:false\" style=\"width:160px;padding:10px\">\r\n");
      out.write("                <a id=\"addMenu\" href=\"javascript:void(0)\" class=\"easyui-linkbutton c1\" style=\"width:120px\">????????????</a><br><br>\r\n");
      out.write("                <a id=\"editMenu\" href=\"javascript:void(0)\" class=\"easyui-linkbutton c2\" style=\"width:120px\">????????????</a><br><br>\r\n");
      out.write("                <a id=\"delMenu\" href=\"javascript:void(0)\" class=\"easyui-linkbutton c3\" style=\"width:120px\">????????????</a><br><br>\r\n");
      out.write("                <a href=\"javascript:void(0)\" onclick=\"javascript:$('#menuTree').tree('reload');\" class=\"easyui-linkbutton c4\" style=\"width:120px\">????????????</a><br><br>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div data-options=\"region:'center',title:'??????????????????'\" style=\"padding:10px\">\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                <ul class=\"easyui-tree\" id=\"menuTree\" data-options=\"url:'menu/menuManagerInfo'\"></ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
