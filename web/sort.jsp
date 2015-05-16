<%--
  Created by IntelliJ IDEA.
  User: huangang
  Date: 15/5/16
  Time: 下午4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  errorPage="error.jsp" %>
<%@ page import="com.jspcms.SqlOperate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<jsp:include page="header.jsp" flush="true" />
<title>sort</title>
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
              <%
                String sid=request.getParameter("sid");
                if(sid == null){
                  response.sendRedirect("index.jsp");
                }
                SqlOperate sqlop = new SqlOperate();
                String sql = "select sname from sorts where sid='"+sid+"'";
                String sname=sqlop.executeQuerySingle(sql, null).toString();
              %>
              <h3><%=sname%></h3>
              <div class="divider-arrow"></div>
            </div>
          </div>
          <%
            //一页放10个
            int PAGESIZE = 20;
            int pageCount;
            int curPage = 1;

            sql = "select *from posts where sid='"+sid+"' order by pid desc";
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
              sql = "select username from users where uid='"+uid+"'";
              String username=sqlop.executeQuerySingle(sql, null).toString();

              out.print("<article class=\"blog-post span8\"><div class=\"block-grey\"><div class=\"block-light\"><div class=\"wrapper\">");
              out.print("<h2 class=\"post-title\"><a href=\"single.jsp?pid="+pid+"\">");
              out.print(title+"</a></h2>");
              out.print("<a href=\"#\" class=\"blog-comments\">"+cnum+"</a>");
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


