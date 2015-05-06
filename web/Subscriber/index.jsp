<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
if(session.getAttribute("uid")==null){
    //response.sendRedirect("login.jsp");
    out.print("<script>alert(\"请登陆\");window.location.href=\"/login.jsp\";</script>");
}
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>订阅者</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="header">

    <div class="dl-title">
    </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user"><%=session.getAttribute("username")%></span><a href="#" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">系统管理</div></li>

        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="assets/js/bui-min.js"></script>
<script type="text/javascript" src="assets/js/common/main-min.js"></script>
<script type="text/javascript" src="assets/js/config-min.js"></script>
<script>
    BUI.use('common/main',function(){
        var config = [
            {id:'1',menu:[{text:'系统管理',items:[
                {id:'14',text:'评论管理',href:'Comment/index.jsp'}
            ]
            }
            ]
            },
        ];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
</script>
</body>
</html>