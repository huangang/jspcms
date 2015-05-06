<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.jspcms.SqlOperate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>

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
<body>
<form class="form-inline definewidth m20" action="index.jsp" method="get">
    文章名：
    <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增文章</button>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>标题</th>
        <th>作者</th>
        <th>分类</th>
        <th>发布日期</th>
        <th>管理操作</th>
    </tr>
    </thead>
    <%
        SqlOperate sqlop = new SqlOperate();
        String sql = "select *from posts";
        List list = sqlop.excuteQuery(sql, null);
        int postNum = list.size();
        for(int i=0;i<postNum;i++){
            Object ob = list.get(i);
            Map<String, Object> map = new HashMap<String, Object>();
            map = (HashMap)ob;
            String uid=map.get("uid").toString();
            sql = "select username from users where uid="+uid;
            String username=sqlop.executeQuerySingle(sql, null).toString();

            String sid=map.get("sid").toString();
            sql = "select sname from sorts where sid="+sid;
            String sname=sqlop.executeQuerySingle(sql, null).toString();

            out.print("<tr>");
            out.print("<td>"+map.get("title")+"</td>");
            out.print("<td>"+username+"</td>");
            out.print("<td>"+sname+"</td>");
            String post_time = map.get("post_time").toString();
            out.print("<td>"+post_time.substring(0,post_time.length()-2) +"</td>");
            out.print("<td>"+"<a href='edit.jsp'>编辑</a> <a href='#' onclick='del("+map.get("pid")+")'>删除</a>"+"</td>");
            out.print("</tr>");
        }
    %>
</table>
<div class="inline pull-right page">
         <%=postNum%> 条记录
    <%--1/507 页  <a href='#'>下一页</a>--%>
    <%--<span class='current'>1</span><a href='#'>2</a><a href='#'>3</a><a href='#'>4</a><a href='#'>5</a>  <a href='#' >下5页</a> <a href='#' >最后一页</a>--%>
</div>
</body>
</html>
<script>
    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="add.jsp";
		 });


    });

	function del(id)
	{
		
		
		if(confirm("确定要删除吗？"))
		{
		
			var url = "index.jsp";
			
			window.location.href=url;		
		
		}
	
	
	
	
	}
</script>