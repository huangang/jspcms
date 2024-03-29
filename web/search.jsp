<%--
  Created by IntelliJ IDEA.
  User: huangang
  Date: 15/5/11
  Time: 上午8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<%@page import="com.jspcms.SqlOperate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>


<jsp:include page="header.jsp" flush="true" />


<title>搜索</title>
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
            String ptitle=new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
            if(ptitle == null){
              response.sendRedirect("index.jsp");
            }
            SqlOperate sqlop = new SqlOperate();
            String sql = "SELECT * FROM posts WHERE title LIKE '%"+ptitle+"%'";
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
              sql = "select username from users where uid='"+uid+"'";
              String username=sqlop.executeQuerySingle(sql, null).toString();

              String sid=map.get("sid").toString();
              sql = "select sname from sorts where sid='"+sid+"'";
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
      <jsp:include page="sidebar.jsp" flush="true"/>


    </div>
  </div>
</section>

<jsp:include page="footer.jsp" flush="true" />

