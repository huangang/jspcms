<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jspcms.SqlOperate" %>
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
    机构名称：
    <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增分类</button>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>分类编号</th>
        <th>分类名</th>
        <th>文章数</th>
        <th>管理操作</th>
    </tr>
    </thead>
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
            sql= "select count(*) from posts where sid="+sid;
            String postnum=sqlop.executeQuerySingle(sql, null).toString();
            out.print("<tr>");
            out.print("<td>"+sid+"</td>");
            out.print("<td>"+sname+"</td>");
            out.print("<td>"+postnum+"</td>");
            out.print("<td>"+"<a href='edit.jsp?sid="+sid+"'>编辑</a> <a href='#' onclick='del("+map.get("sid")+")'>删除</a>"+"</td>");
            out.print("</tr>");

        }

    %>
</table>
<div class="inline pull-right page">
    <%=sortNum %> 条记录
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
        var xmlhttp;
        var status="";
        try{
            xmlhttp=new ActiveXObject('Msxml2.XMLHTTP');
        } catch(e){
            try{
                xmlhttp=new ActiveXObject('Microsoft.XMLHTTP');
            } catch(e){
                try{
                    xmlhttp=new XMLHttpRequest();
                }catch(e){}
            }
        }
		
		
		if(confirm("确定要删除吗？"))
		{

            xmlhttp.open("GET","/DoDelete?table=sort&sid="+id,true);
            xmlhttp.onreadystatechange=function(){
                if (xmlhttp.readyState==4)
                //xmlhttp.status==404 代表 没有发现该文件
                    if (xmlhttp.status==200)
                    {
                        //alert(xmlhttp.status);
                        status=xmlhttp.responseText;
                        console.log(status);
                    } else
                    {
                        alert("发生错误："+xmlhttp.status);
                    }

            }
            xmlhttp.send(null);
            window.location.href="index.jsp";
		
		}
	
	
	
	
	}
</script>