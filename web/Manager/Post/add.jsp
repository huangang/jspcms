<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="com.jspcms.SqlOperate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/style.css" />
    <script type="text/javascript" src="../../CommonBackstage/Js/jquery.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/bootstrap.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/ckform.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/common.js"></script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<form action="/DoAdd"  method="post">
<table class="table table-bordered table-hover definewidth m10">
    <input type="hidden" name="table" value="post"/>
    <tr>
        <td width="10%" class="tableleft">标题</td>
        <td><input type="text" name="title"/></td>
    </tr>
    <tr>
        <td class="tableleft">分类</td>
        <td>
        <select name="sid">
            <%
                SqlOperate sqlop = new SqlOperate();
                String sql = "select * from sorts";
                List list = sqlop.excuteQuery(sql, null);
                int sortNum = list.size();
                for(int i=0;i<sortNum;i++){
                    Object ob = list.get(i);
                    Map<String, Object> map = new HashMap<String, Object>();
                    map = (HashMap)ob;
                    String sid=map.get("sid").toString();
                    String sname =map.get("sname").toString();
                    out.print("<option value="+sid+">");
                    out.print(sname);
                    out.print("</option>");

                }
            %>
        </select>
        </td>

    </tr>
    <tr>
        <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.all.min.js"> </script>
        <script type="text/javascript" charset="utf-8" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
        <td class="tableleft">正文</td>
        <td>
            <%--<textarea name="content" rows="10" cols="20">--%>
            <%--</textarea>--%>
            <script id="editor" type="text/plain" style="width:1024px;height:500px;" name="content" ></script>
                <script type="text/javascript">
                    var ue = UE.getEditor('editor');
                </script>
        </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="index.jsp";
		 });

    });
</script>