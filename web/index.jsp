<%--
Created by IntelliJ IDEA.
com.jspcms.User: huangang
Date: 15/5/4
Time: 下午3:16
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.jspcms.SqlOperate" %>
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
    <title>首页</title>
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
                <a href="login.jsp">登陆</a><br>
                <a href="register.jsp">注册</a><br>
                <a href="#"><img src="images/logo.png" alt="logo" /></a>
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
                            <h3>News</h3>
                            <div class="divider-arrow"></div>
                        </div>
                    </div>
                    <%--<article class="blog-post span8">--%>
                        <%--<div class="block-grey">--%>
                            <%--<div class="block-light">--%>
                                <%--<div class="wrapper-img">--%>
                                    <%--<a href="#"><img src="example/blog1.jpg" alt="photo" /></a>--%>
                                <%--</div>--%>
                                <%--<div class="wrapper">--%>
                                    <%--<h2 class="post-title"><a href="#">Lorem ipsum</a></h2>--%>
                                    <%--<a href="#" class="blog-comments">3</a>--%>
                                    <%--<p>--%>
                                        <%--Lorem ipsum dolor sit amet, consectetuer adipiscing elit,--%>
                                        <%--sed diam nonummy nibh euismod tdolore mag quam erat volutpat.--%>
                                        <%--<a href="#" class="read-more">[...]</a>--%>
                                    <%--</p>--%>
                                    <%--<p class="tags">--%>
                                        <%--Tags: <a href="#">Science</a>, <a href="#">Technology</a>, <a href="#">News</a>--%>
                                    <%--</p>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</article>--%>
                    <%--<article class="blog-post span8">--%>
                        <%--<div class="block-grey">--%>
                            <%--<div class="block-light">--%>
                                <%--<div class="wrapper">--%>
                                    <%--<h2 class="post-title"><a href="#">Lorem ipsum</a></h2>--%>
                                    <%--<a href="#" class="blog-comments">3</a>--%>
                                    <%--<blockquote>--%>
                                        <%--<p>--%>
                                            <%--Lorem ipsum dolor sit amet, consectetur adipiscing elit.--%>
                                            <%--Morbi posuere metus ut sem pellentesque nec ullamcorper leo sollicitudin.--%>
                                            <%--Sed adipiscing placerat eros id tincidunt. Donec eu luctus tortor.--%>
                                        <%--</p>--%>
                                    <%--</blockquote>--%>
                                    <%--<p class="tags">--%>
                                        <%--Tags: <a href="#">Science</a>, <a href="#">Technology</a>, <a href="#">News</a>--%>
                                    <%--</p>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</article>--%>

                    <%
                        SqlOperate sqlop = new SqlOperate();
                        String sql = "select *from posts";
                        List list = sqlop.excuteQuery(sql, null);
                        int postNum = list.size();
                        for(int i=0;i<postNum;i++) {
                            Object ob = list.get(i);
                            Map<String, Object> map = new HashMap<String, Object>();
                            map = (HashMap)ob;
                            String pid =map.get("pid").toString();
                            String uid=map.get("uid").toString();
                            String title = map.get("title").toString();
                            String content = map.get("content").toString();
                            sql = "select username from users where uid="+uid;
                            String username=sqlop.executeQuerySingle(sql, null).toString();

                            String sid=map.get("sid").toString();
                            sql = "select sname from sorts where sid="+sid;
                            String sname=sqlop.executeQuerySingle(sql, null).toString();
                            out.print("<article class=\"blog-post span8\"><div class=\"block-grey\"><div class=\"block-light\"><div class=\"wrapper\">");
                            out.print("<h2 class=\"post-title\"><a href=\"single.jsp?pid="+pid+"\">");
                            out.print(title+"</a></h2>");
                            out.print("<a href=\"#\" class=\"blog-comments\">0</a>");
                            out.print("<blockquote><p>"+content+"</p></blockquote>");
                            out.print("<p class=\"tags\">Sort: <a href=\"#\">"+sname+"</a></p>");
                            out.print("</div></div></div></article>");

                        }
                    %>
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


<!--footer menu-->
<section id="footer-menu">
    <div class="container">
        <div class="row">
            <p class="span12"><span>&copy; Copyright 2015, <span class="color2">JSP CMS</span> | All Rights Reserved</span></p>
        </div>
    </div>
</section>


</body>
</html>