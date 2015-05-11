<%--
  Created by IntelliJ IDEA.
  User: huangang
  Date: 15/5/11
  Time: 上午8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->

<head>

  <meta name="viewport" content="width=100%; initial-scale=1; maximum-scale=1; minimum-scale=1; user-scalable=no;" />
  <link rel="icon" href="images/favicon.png" type="image/png" />
  <link rel="shortcut icon" href="images/favicon.png" type="image/png" />

  <link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
  <link href="css/style.css" type="text/css" rel="stylesheet" />
  <link href="css/prettyPhoto.css" type="text/css" rel="stylesheet" />
  <script type="text/javascript" src="js/js/jquery.min.js"></script>
  <script type="text/javascript" src="js/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/js/jquery.easing.1.3.js"></script>
  <script type="text/javascript" src="js/js/jquery.quicksand.js"></script>
  <script type="text/javascript" src="js/js/superfish.js"></script>
  <script type="text/javascript" src="js/js/hoverIntent.js"></script>
  <script type="text/javascript" src="js/js/jquery.hoverdir.js"></script>
  <script type="text/javascript" src="js/js/jquery.flexslider.js"></script>
  <script type="text/javascript" src="js/js/jflickrfeed.min.js"></script>
  <script type="text/javascript" src="js/js/jquery.prettyPhoto.js"></script>
  <script type="text/javascript" src="js/js/jquery.elastislide.js"></script>
  <script type="text/javascript" src="js/js/smoothscroll.js"></script>
  <script type="text/javascript" src="js/js/jquery.ui.totop.js"></script>
  <script type="text/javascript" src="js/js/main.js"></script>
  <script type="text/javascript" src="js/js/accordion.settings.js"></script>
  <!--[if lt IE 9]>
  <script type="text/javascript" src="js/js/html5.js"></script>
  <link href="css/ie.css" type="text/css" rel="stylesheet"/>
  <![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>


<!-- header -->
<header id="header">
  <div class="container">
    <div class="row">
      <div class="span4 logo">
        <%
          if(session.getAttribute("uid") != null){
            String role = session.getAttribute("role").toString();
            if(role.equals("manager")){
        %>
        <a href="Manager/index.jsp">后台</a><br>
        <%
        }else if(role.equals("author")){
        %>
        <a href="Author/index.jsp">后台</a><br>
        <%
        }else if(role.equals("subscriber")){
        %>
        <a href="Subscriber/index.jsp">后台</a><br>
        <%

          }
        }else{
        %>
        <a href="login.jsp">登陆</a><br>
        <a href="register.jsp">注册</a><br>
        <%
          }
        %>
        <a href="index.jsp"><img src="images/logo.png" alt="logo" /></a>
      </div>
      <div class="span8 hidden-phone">
        <a href="#" class="alignright banner">
          <img src="images/banner-468-60.gif" alt="" />
        </a>
      </div>
    </div>
  </div>
</header>