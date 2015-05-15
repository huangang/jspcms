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
    <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/style.css" />
    <script type="text/javascript" src="../../CommonBackstage/Js/jquery.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/bootstrap.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/ckform.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/common.js"></script>

    <%request.setCharacterEncoding("UTF-8"); %>

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
    用户名称：
    <input type="text" name="username" id="username"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增用户</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>用户id</th>
        <th>用户名</th>
        <th>用户邮箱</th>
        <th>用户身份</th>
        <th>注册时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <%
        //一页放10个
        int PAGESIZE = 10;
        int pageCount;
        int curPage = 1;

        SqlOperate sqlop = new SqlOperate();
        String sql = "select * from users order by uid desc";
        List list = sqlop.excuteQuery(sql, null);
        int userNum = list.size();

        pageCount = (userNum%PAGESIZE==0)?(userNum/PAGESIZE):(userNum/PAGESIZE+1);
        String tmp = request.getParameter("curPage");
        if(tmp==null){
            tmp="1";
        }
        curPage = Integer.parseInt(tmp);
        if(curPage>=pageCount) curPage = pageCount;


        int pageI = 0;
        int curPageI = 0;
        if(userNum > PAGESIZE){
            pageI = (curPage-1) * PAGESIZE;
            curPageI = curPage * PAGESIZE;
        }else{
            pageI = 0;
            curPageI =userNum;
        }
        if(curPageI > userNum ){
            curPageI = userNum;
        }
        for(int i=pageI;i<curPageI;i++) {
            Object ob = list.get(i);
            Map<String, Object> map = new HashMap<String, Object>();
            map = (HashMap)ob;
            String uid=map.get("uid").toString();
            String username=map.get("username").toString();
            String password=map.get("password").toString();
            String email=map.get("email").toString();
            String role=map.get("role").toString();
            String register_time=map.get("register_time").toString();

            out.print("<tr>");
            out.print("<td>"+uid+"</td>");
            out.print("<td>"+username+"</td>");
            out.print("<td>"+email+"</td>");
            out.print("<td>"+role+"</td>");
            out.print("<td>" + register_time.substring(0, register_time.length() - 2) + "</td>");
            out.print("<td>"+"<a href='edit.jsp?uid="+uid+"&username="+username+"&password="+password+"&email="+email+"&role="+role+"'>编辑</a> <a href=\"changePassword.jsp?uid="+uid+"\">修改密码</a> <a href='#' onclick='del("+uid+")'>删除</a>"+"</td>");
            out.print("</tr>");


        }
    %>
</table>
<div class="inline pull-right page">
    <%=userNum %> 条记录
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


        if(confirm("确定要删除吗？该用户的所有文章及内容都会删除"))
        {

            xmlhttp.open("GET","/DoDelete?table=user&uid="+id,true);
            xmlhttp.onreadystatechange=function(){
                if (xmlhttp.readyState==4)
                //xmlhttp.status==404 代表 没有发现该文件
                    if (xmlhttp.status==200) {
                        //alert(xmlhttp.status);
                        status = xmlhttp.responseText;
                        console.log(status);
                    }

            }
            xmlhttp.send(null);
            window.location.href="index.jsp";

        }




    }
</script>