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
    <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../../CommonBackstage/../CommonBackstage/Css/style.css" />
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
    留言人：
    <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>留言编号</th>
        <th>留言内容</th>
        <th>留言人</th>
        <th>留言文章</th>
        <th>留言时间</th>
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
        String sql = "select * from comments where uid= '"+uid+"' order by cid desc";
        List list = sqlop.excuteQuery(sql, null);
        int commentNum = list.size();

        pageCount = (commentNum%PAGESIZE==0)?(commentNum/PAGESIZE):(commentNum/PAGESIZE+1);
        String tmp = request.getParameter("curPage");
        if(tmp==null){
            tmp="1";
        }
        curPage = Integer.parseInt(tmp);
        if(curPage>=pageCount) curPage = pageCount;

        int pageI = 0;
        int curPageI = 0;
        if(commentNum > PAGESIZE){
            pageI = (curPage-1) * PAGESIZE;
            curPageI = curPage * PAGESIZE;
        }else{
            pageI = 0;
            curPageI = commentNum;
        }
        if(curPageI > commentNum ){
            curPageI = commentNum;
        }
        for(int i=pageI;i<curPageI;i++) {
            Object ob = list.get(i);
            Map<String, Object> map = new HashMap<String, Object>();
            map = (HashMap)ob;
            String cid=map.get("cid").toString();
            String pid=map.get("pid").toString();
            sql = "select title from posts where pid='"+pid+"'";
            String title = sqlop.executeQuerySingle(sql,null).toString();
            sql = "select username from users where uid='"+uid+"'";
            String username = sqlop.executeQuerySingle(sql, null).toString();
            String content=map.get("content").toString();
            String comment_time=map.get("comment_time").toString();

            out.print("<tr>");
            out.print("<td>"+cid+"</td>");
            out.print("<td>"+content+"</td>");
            out.print("<td>"+username+"</td>");
            out.print("<td>"+title+"</td>");
            out.print("<td>"+comment_time.substring(0,comment_time.length()-2)+"</td>");
            out.print("<td>"+"<a onclick='del("+cid+")'>删除</a></td>");
            out.print("</tr>");
        }
    %>

</table>
<div class="inline pull-right page">
    <%=commentNum%> 条记录
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

    function del(id){
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

            xmlhttp.open("GET","/DoDelete?table=comment&cid="+id,true);
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