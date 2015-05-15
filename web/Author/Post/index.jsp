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
        //一页放10个
        int PAGESIZE = 10;
        int pageCount;
        int curPage = 1;

        String uid = session.getAttribute("uid").toString();
        SqlOperate sqlop = new SqlOperate();
        String sql = "select *from posts where uid='"+uid+"' order by uid desc";
        List list = sqlop.excuteQuery(sql, null);
        int postNum = list.size();

        pageCount = (postNum%PAGESIZE==0)?(postNum/PAGESIZE):(postNum/PAGESIZE+1);
        String tmp = request.getParameter("curPage");
        if(tmp==null){
            tmp="1";
        }
        curPage = Integer.parseInt(tmp);
        if(curPage>=pageCount) curPage = pageCount;


        int pageI = 0;
        int curPageI = 0;
        if(postNum > PAGESIZE){
            pageI = (curPage-1) * PAGESIZE;
            curPageI = curPage * PAGESIZE;
        }else{
            pageI = 0;
            curPageI = postNum;
        }
        if(curPageI > postNum ){
            curPageI = postNum;
        }
        for(int i=pageI;i<curPageI;i++) {
            Object ob = list.get(i);
            Map<String, Object> map = new HashMap<String, Object>();
            map = (HashMap)ob;
            String pid =map.get("pid").toString();
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
            out.print("<td>" + post_time.substring(0, post_time.length() - 2) + "</td>");
            out.print("<td>"+"<a href='edit.jsp?pid="+pid+"&sid="+sid+"'>编辑</a> <a href='#' onclick='del("+map.get("pid")+")'>删除</a>"+"</td>");
            out.print("</tr>");
        }
    %>
</table>
<div class="inline pull-right page">
    <%=postNum%> 条记录
    <a href = "index.jsp?curPage=1" >首页</a>
    <%
        if(curPage==1){
    %>
    <%
    }else{
    %>
    <a href = "index.jsp?curPage=<%=curPage-1%>" >上一页</a>
    <%
        }
        if(curPage == pageCount){

        }else{
    %>
    <a href = "index.jsp?curPage=<%=curPage+1%>" >下一页</a>
    <%
        }
    %>
    <a href = "index.jsp?curPage=<%=pageCount%>" >尾页</a>
    第<%=curPage%>页/共<%=pageCount%>页
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

            xmlhttp.open("GET","/DoDelete?table=post&pid="+id,true);
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