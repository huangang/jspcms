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
<jsp:include page="header.jsp" flush="true" />

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
                            <title><%=title%></title>
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
            <jsp:include page="sidebar.jsp" flush="true"/>

        </div>
    </div>
</section>

<jsp:include page="footer.jsp" flush="true"/>