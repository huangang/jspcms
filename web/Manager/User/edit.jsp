<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/style.css" />
    <script type="text/javascript" src="../../CommonBackstage/Js/jquery.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/bootstrap.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/ckform.js"></script>
    <script type="text/javascript" src="../../CommonBackstage/Js/common.js"></script>


    <%request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8"); %>
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
<form action="/DoUpdate" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <input type="hidden" name="table" value="user" />
        <%
            String uid=request.getParameter("uid");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String email=request.getParameter("email");
            String role=request.getParameter("role");
        %>
        <input type="hidden" name="uid" value="<%=uid%>" />
        <tr>
            <td width="10%" class="tableleft">用户名</td>
            <td><input type="text" name="username" value="<%=username%>"/></td>
        </tr>
        <%--<tr>--%>
            <%--<td class="tableleft">密码</td>--%>
            <%--<td><input type="password" name="password" value="<%=password%>"/></td>--%>
        <%--</tr>--%>
        <tr>
            <td class="tableleft">邮箱</td>
            <td><input type="text" name="email" value="<%=email%>"/></td>
        </tr>
        <td class="tableleft">身份</td>
        <td>
            <select name="role">
                <%
                    if(role.equals("subscriber")){
                %>
                <option value="subscriber" selected="selected">subscriber</option>
                <option value="author">author</option>
                <option value="manager">manager</option>
                <%
                    }else if(role.equals("author")){
                %>
                <option value="subscriber">subscriber</option>
                <option value="author" selected="selected">author</option>
                <option value="manager">manager</option>
                <%
                    }else if(role.equals("manager")){

                %>
                <option value="subscriber">subscriber</option>
                <option value="author">author</option>
                <option value="manager" selected="selected">manager</option>
                <%
                    }
                %>
            </select>
        </td>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="{:U('User/index')}";
		 });

    });
</script>