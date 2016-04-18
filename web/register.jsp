<%--
  Created by IntelliJ IDEA.
  com.jspcms.User: joya
  Date: 15/5/5
  Time: 下午3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  if(session.getAttribute("uid") != null){
    response.sendRedirect("index.jsp");
  }
%>
<html>
<head>
  <link rel="shortcut icon" href="images/favicon.png" type="image/png" />
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <title>注册</title>
</head>
<style>
  body {
    padding-top: 40px;
    padding-bottom: 40px;
    background-color: #eee;
  }

  .form-signin {
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
  }
  .form-signin .form-signin-heading{
    margin-bottom: 10px;
  }

  .form-signin .form-control {
    position: relative;
    height: auto;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 10px;
    font-size: 16px;
  }
  .form-signin .form-control:focus {
    z-index: 2;
  }
  .form-signin input[type="text"] {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
  .form-signin input[type="email"] {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
  .form-signin input[type="password"] {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
  }
  .input-group{
    margin-bottom: 10px;
  }

</style>
<script>
</script>
<body>

<div class="container">
  <form class="form-signin" role="form" method="post" action="DoRegister">
    <h2 class="form-signin-heading">注册</h2>
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
      <input type="text" class="form-control" placeholder="用户名" required name="username">
    </div>

    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></div>
      <input type="email" class="form-control" placeholder="邮箱" required autofocus name="email">
    </div>

    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span></div>
      <input type="password" class="form-control" placeholder="密码" required name="password">
    </div>

    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span></div>
      <input type="password" class="form-control" placeholder="重复密码" required name="repassword">
    </div>

    <div class="input-group">
      <div class="input-group-addon"><img src="captcha.jsp" onclick="javascript:this.src = 'captcha.jsp?time=' + Math.random();"></div>
      <input type="text" class="form-control" placeholder="验证码" required name="code">
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
    <br>
    <a href="login.jsp">已有帐号</a>
    <a href="index.jsp">返回首页</a>
  </form>

</div>

</body>
</html>
