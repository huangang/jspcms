<%--
Created by IntelliJ IDEA.
com.jspcms.User: joya
Date: 15/5/4
Time: 下午3:16
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  errorPage="error.jsp" %>
<%@ page import="com.jspcms.SqlOperate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<jsp:include page="header.jsp" flush="true" />
<title>首页</title>
<script src="js/Cutter.js"></script>
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

                        int pageI = 0;
                        int curPageI = 0;
                        if(postNum > PAGESIZE){
                            pageI = (curPage-1) * PAGESIZE;
                            curPageI = curPage * PAGESIZE;
                        }else{
                            pageI = 0;
                            curPageI = postNum;
                        }
                        if(curPageI > postNum ){
                            curPageI = postNum;
                        }
                        for(int i=pageI;i<curPageI;i++) {
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
                            out.println("<article class=\"blog-post span8\"><div class=\"block-grey\"><div class=\"block-light\"><div class=\"wrapper\">");
                            out.println("<h2 class=\"post-title\"><a href=\"single.jsp?pid=" + pid + "\">");
                            out.println(title + "</a></h2>");
                            out.println("<a href=\"#\" class=\"blog-comments\">" + cnum + "</a>");
                            out.println("<blockquote><div id=\"pid" + pid + "\">" + content + "</div></blockquote>");
                            out.println("<script>var oElement"+pid+" = document.getElementById(\"pid" + pid + "\");Cutter.run(oElement"+pid+", oElement"+pid+", 20,{more:\"<a href=single.jsp?pid="+pid+">View more</a>\"}, {more:\"more\"});</script>");
                            out.println("<p class=\"tags\">Sort: <a href=\"sort.jsp?sid=" + sid + "\">" + sname + "</a></p>");
                            out.println("</div></div></div></article>");

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

