<%--
Created by IntelliJ IDEA.
com.jspcms.User: huangang
Date: 15/5/6
Time: 下午4:16
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jspcms.SqlOperate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
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

<%
    String pid=request.getParameter("pid");
    if(pid == null){
        response.sendRedirect("index.jsp");
    }
    SqlOperate sqlop = new SqlOperate();
    String sql = "select *from posts where pid='"+pid+"'";
    List list = sqlop.excuteQuery(sql, null);
    Object ob = list.get(0);
    Map<String, Object> map = new HashMap<String, Object>();
    map = (HashMap)ob;
    String uid=map.get("uid").toString();
    String title = map.get("title").toString();
    String content = map.get("content").toString();
    sql = "select username from users where uid="+uid;
    String username=sqlop.executeQuerySingle(sql, null).toString();
    String sid=map.get("sid").toString();
    sql = "select sname from sorts where sid="+sid;
    String sname=sqlop.executeQuerySingle(sql, null).toString();

%>
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

<!-- container -->
<section id="container">
    <div class="container">
        <div class="row">
            <!-- page content -->
            <section id="page-sidebar" class="alignleft span8">
                <!-- content -->
                <div class="row">
                    <div class="span8">
                        <div class="title-divider">
                            <h3><%=title%></h3>
                            <div class="divider-arrow"></div>
                        </div>
                    </div>
                    <article class="blog-post span8">
                        <div class="block-grey">
                            <div class="block-light">
                                <div class="wrapper-img">
                                    <a href="#"><img src="example/blog2.jpg" alt="photo" /></a>
                                </div>
                                <div class="wrapper">
                                    <h2 class="post-title"><a href="#"><%=sname%></a></h2>
                                    <title><%=sname%></title>
                                    <a href="#" class="blog-comments">3</a>
                                    <%=content%>
                                    <hr />
                                    <!--comments-->
                                    <div class="title-divider">
                                        <h3>4 Comments</h3>
                                        <div class="divider-arrow"></div>
                                    </div>
                                    <%--<div class="comments">--%>
                                        <%--<ul class="comments-list">--%>
                                            <%--<li class="clearfix comments_li">--%>
                                                <%--<img src="images/avatar.png" alt="avatar" class="avatar" />--%>
                                                <%--<div class="textarea">--%>
                                                    <%--<p class="meta">May 18, 2012 Designmd says:</p>--%>
                                                    <%--<p>--%>
                                                        <%--Lorem ipsum dolor sit amet, consectetur adipiscing elit.--%>
                                                        <%--Etiam a sapien odio, sit amet--%>
                                                    <%--</p>--%>
                                                <%--</div>--%>
                                                <%--<ul>--%>
                                                    <%--<li>--%>
                                                        <%--<img src="images/avatar.png" alt="avatar" class="avatar" />--%>
                                                        <%--<div class="textarea">--%>
                                                            <%--<p class="meta">May 17, 2012 bingumd says:</p>--%>
                                                            <%--<p>--%>
                                                                <%--Lorem ipsum dolor sit amet, consectetur adipiscing elit.--%>
                                                            <%--</p>--%>
                                                            <%--<div class="shadow-comments2"></div>--%>
                                                        <%--</div>--%>
                                                        <%--<ul>--%>
                                                            <%--<li>--%>
                                                                <%--<img src="images/avatar.png" alt="avatar" class="avatar" />--%>
                                                                <%--<div class="textarea">--%>
                                                                    <%--<p class="meta">May 17, 2012 bingumd says:</p>--%>
                                                                    <%--<p>--%>
                                                                        <%--Lorem ipsum dolor sit amet, consectetur adipiscing elit.--%>
                                                                    <%--</p>--%>
                                                                    <%--<div class="shadow-comments2"></div>--%>
                                                                <%--</div>--%>
                                                            <%--</li>--%>
                                                        <%--</ul>--%>
                                                    <%--</li>--%>
                                                <%--</ul>--%>
                                            <%--</li>--%>
                                            <%--<li>--%>
                                                <%--<div><img src="images/avatar.png" alt="avatar" class="avatar" /></div>--%>
                                                <%--<div class="textarea last">--%>
                                                    <%--<p class="meta">May 16, 2012 Designmd says:</p>--%>
                                                    <%--<p>--%>
                                                        <%--scelerisque felis. Maecenas tincidunt ligula eu magna tincidunt eget imperdiet erat malesuada.--%>
                                                        <%--Ut in diam et metus facilisis venenatis sit amet vel enim.--%>
                                                    <%--</p>--%>
                                                <%--</div>--%>
                                            <%--</li>--%>
                                        <%--</ul>--%>
                                    <%--</div>--%>
                                    <hr />
                                    <!--commetns form-->
                                    <%--<div class="title-divider">--%>
                                        <%--<h3>Leave A Reply</h3>--%>
                                        <%--<div class="divider-arrow"></div>--%>
                                    <%--</div>--%>
                                    <%--<form name="comment" method="post" action="" class="af-form" id="af-form" />--%>
                                        <%--<div class="af-outer af-required">--%>
                                            <%--<div class="af-inner">--%>
                                                <%--<label for="name" id="name_label">Your Name:</label>--%>
                                                <%--<input type="text" name="name" id="name" size="30" value="" class="text-input input-xlarge" />--%>
                                                <%--<label class="error" for="name" id="name_error">Name is required.</label>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="af-outer af-required">--%>
                                            <%--<div class="af-inner">--%>
                                                <%--<label for="email" id="email_label">Your Email:</label>--%>
                                                <%--<input type="text" name="email" id="email" size="30" value="" class="text-input input-xlarge" />--%>
                                                <%--<label class="error" for="email" id="email_error">Email is required.</label>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="af-outer af-required">--%>
                                            <%--<div class="af-inner">--%>
                                                <%--<label for="input-message" id="message_label">Your Message:</label>--%>
                                                <%--<textarea name="message" id="input-message" cols="30" class="text-input"></textarea>--%>
                                                <%--<label class="error" for="input-message" id="message_error">Message is required.</label>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="af-outer af-required">--%>
                                            <%--<div class="af-inner">--%>
                                                <%--<input type="submit" name="submit" class="form-button btn btn-large" id="submit_btn" value="Send Message!" />--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</form>--%>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
            <!-- sidebar -->
            <aside id="sidebar" class="alignright span4">
                <!-- Search -->
                <section class="search clearfix">
                    <form id="search" class="input-append" />
                        <input class="" id="appendedInputButton" size="16" type="text" value="Search..." name="search site" onfocus="if(this.value=='Search...') this.value=''" onblur="if(this.value=='') this.value='Search...'" />
                        <input class="btn search-bt" type="submit" name="submit" value="" />
                    </form>
                </section>

                <!-- Advertisment -->
                <div class="title-divider">
                    <h3>Advertisment</h3>
                    <div class="divider-arrow"></div>
                </div>
                <section class="block-dark">
                    <img src="images/adv.gif" alt="" />
                </section>
                <!-- Recent Posts -->
                <div class="title-divider">
                    <h3>Recent Posts</h3>
                    <div class="divider-arrow"></div>
                </div>
                <section class="post-widget block-grey">
                    <ul class="clearfix block-light wrap15">
                        <li>
                            <a href="#"><img src="example/sidebar1.jpg" alt="photo" /></a>
                            <a href="#">Ut in lacus rhoncus elit egesta sluctus. Nullam at</a>
                            <p><em>12 Apr 2012, 3 comments</em></p>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <a href="#"><img src="example/sidebar2.jpg" alt="photo" /></a>
                            <a href="#">Ut in lacus rhoncus elit egesta sluctus. Nullam at</a>
                            <p><em>12 Apr 2012, 3 comments</em></p>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <a href="#"><img src="example/sidebar3.jpg" alt="photo" /></a>
                            <a href="#">Ut in lacus rhoncus elit egesta sluctus. Nullam at</a>
                            <p><em>12 Apr 2012, 3 comments</em></p>
                            <div class="clear"></div>
                        </li>
                    </ul>
                </section>
            </aside>


        </div>
    </div>
</section>

<section id="footer-menu">
    <div class="container">
        <div class="row">
            <p class="span12"><span>&copy; Copyright 2015, <span class="color2">JSP CMS</span> | All Rights Reserved</span></p>
        </div>
    </div>
</section>
</body>
</html>