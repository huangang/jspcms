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
<jsp:include page="header.jsp" flush="true" />
<title>首页</title>
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
                        //一页放10个
                        int PAGESIZE = 10;
                        int pageCount;
                        int curPage = 1;
                        SqlOperate sqlop = new SqlOperate();
                        String sql = "select *from posts order by pid desc";
                        List list = sqlop.excuteQuery(sql, null);
                        int postNum = list.size();
                        pageCount = (postNum%PAGESIZE==0)?(postNum/PAGESIZE):(postNum/PAGESIZE+1);
                        String tmp = request.getParameter("curPage");
                        if(tmp==null){
                            tmp="1";
                        }
                        curPage = Integer.parseInt(tmp);
                        if(curPage>=pageCount) curPage = pageCount;


                        for(int i=((curPage-1) * PAGESIZE);i<curPage * PAGESIZE;i++) {
                            Object ob = list.get(i);
                            Map<String, Object> map = new HashMap<String, Object>();
                            map = (HashMap)ob;
                            String pid =map.get("pid").toString();
                            sql = "select count(*) from comments where pid = '"+pid+"'";
                            String cnum = sqlop.executeQuerySingle(sql, null).toString();
                            String uid=map.get("uid").toString();
                            String title = map.get("title").toString();
                            String content = map.get("content").toString();
                            sql = "select username from users where uid='"+uid+"'";
                            String username=sqlop.executeQuerySingle(sql, null).toString();

                            String sid=map.get("sid").toString();
                            sql = "select sname from sorts where sid='"+sid+"'";
                            String sname=sqlop.executeQuerySingle(sql, null).toString();
                            out.print("<article class=\"blog-post span8\"><div class=\"block-grey\"><div class=\"block-light\"><div class=\"wrapper\">");
                            out.print("<h2 class=\"post-title\"><a href=\"single.jsp?pid="+pid+"\">");
                            out.print(title+"</a></h2>");
                            out.print("<a href=\"#\" class=\"blog-comments\">"+cnum+"</a>");
                            out.print("<blockquote><p>"+content+"</p></blockquote>");
                            out.print("<p class=\"tags\">Sort: <a href=\"#\">"+sname+"</a></p>");
                            out.print("</div></div></div></article>");

                        }
                    %>
                </div>
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
            </section>
            <jsp:include page="sidebar.jsp" flush="true"/>

        </div>
    </div>
</section>

<jsp:include page="footer.jsp" flush="true" />

