<%--
Created by IntelliJ IDEA.
com.jspcms.User: huangang
Date: 15/5/6
Time: 下午4:16
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
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
    sql = "select username from users where uid='"+uid+"'";
    String username=sqlop.executeQuerySingle(sql, null).toString();
    String sid=map.get("sid").toString();
    sql = "select sname from sorts where sid='"+sid+"'";
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
                                <div class="wrapper">
                                    <h2 class="post-title"><a href="sort.jsp?sid=<%=sid%>"><%=sname%></a></h2>
                                    <%
                                        sql = "select *from comments where pid='"+pid+"' order by cid desc";
                                        List lists = sqlop.excuteQuery(sql, null);
                                        int commentNum = lists.size();
                                    %>
                                    <a href="#" class="blog-comments"><%=commentNum %></a>
                                    <%=content%>
                                    <hr />

                                    <!--comments-->
                                    <div class="title-divider">
                                        <h3><%=commentNum %> Comments</h3>
                                        <div class="divider-arrow"></div>
                                    </div>
                                    <div class="comments">
                                        <ul class="comments-list">
                                            <%
                                                for(int i = 0;i < commentNum; i ++) {
                                                    Object obs = lists.get(i);
                                                    Map<String, Object> maps = new HashMap<String, Object>();
                                                    maps = (HashMap)obs;
                                                    String cid = maps.get("cid").toString();
                                                    String uerid = maps.get("uid").toString();
                                                    sql = "select username from users where uid='"+uerid+"'";
                                                    username=sqlop.executeQuerySingle(sql, null).toString();
                                                    String reply_cid = maps.get("reply_cid").toString();
                                                    String ccontent = maps.get("content").toString();
                                                    String comment_time = maps.get("comment_time").toString();
                                                    out.print("<li class=\"clearfix comments_li\" ><div><img src=\"images/avatar.png\" alt=\"avatar\" class=\"avatar\" /></div><div class=\"textarea last\">");
                                                    if(!reply_cid.equals("0")){
                                                        sql = "select uid from comments where cid='"+reply_cid+"'";
                                                        Object r_uid = sqlop.executeQuerySingle(sql, null);
                                                        if(r_uid != null) {
                                                            String ruid = r_uid.toString();
                                                            sql = "select comment_time from comments where cid='" + reply_cid + "'";
                                                            String rcomment_time = sqlop.executeQuerySingle(sql, null).toString();
                                                            sql = "select username from users where uid='" + ruid + "'";
                                                            String rusername = sqlop.executeQuerySingle(sql, null).toString();

                                                            out.print("<p class=\"meta\"><a id=\"cid" + cid + "\">" + comment_time.substring(0, comment_time.length() - 2) + " " + username + "</a> reply: <a>" + rcomment_time.substring(0, rcomment_time.length() - 2) + " " + rusername + "</a></p>");
                                                        }else{
                                                            out.print("<p class=\"meta\"><a id=\"cid" + cid + "\">" + comment_time.substring(0, comment_time.length() - 2) + " " + username + "</a> says:</p>");
                                                        }

                                                    }else {
                                                        out.print("<p class=\"meta\"><a id=\"cid" + cid + "\">" + comment_time.substring(0, comment_time.length() - 2) + " " + username + "</a> says:</p>");
                                                    }
                                                    out.print("<p>"+ccontent+"</p>");
                                                    out.print("<a href=\"javascript:void(0);\" onclick=\"reply("+cid+")\">回复</a>");
                                                    out.print("</div></li>");
                                            }
                                            %>
                                             <script>
                                                 function reply(id){
                                                     $("#reply_id").val(id);
                                                     var reply_name = $("#cid"+id).text();
                                                     $("#reply_name").val("回复"+reply_name);
                                                     $("#reply_name").css("display","block");
                                                     $("#clear_btn").css("display","block");
                                                 }
                                                 function clear_reply(){
                                                     $("#reply_id").val("");
                                                     $("#reply_name").val("");
                                                     $("#reply_name").css("display","none");
                                                     $("#clear_btn").css("display","none");
                                                 }
                                             </script>

                                        </ul>
                                    </div>
                                    <hr />

                                    <!--commetns form-->
                                    <div class="title-divider">
                                        <h3>Leave A Reply</h3>
                                        <div class="divider-arrow"></div>
                                    </div>
                                    <form name="comment" method="post" action="/DoAdd" class="af-form" id="af-form" />
                                    <input type="hidden" name="table" value="comment"/>
                                    <input type="hidden" name="pid" value="<%=pid%>"/>
                                        <div class="af-outer af-required">
                                            <div class="af-inner">
                                                <label for="input-message" id="message_label">Your Message:</label>
                                                <input type="hidden" value="0" name="reply_id" id="reply_id"/>
                                                <input type="text" value="" name="reply_name" style="display: none;" id="reply_name" readOnly="true" />
                                                <input type="button" id="clear_btn" value="Clear" onclick="clear_reply()" style="display: none;" class="form-button btn" />
                                                <textarea name="message" id="input-message" cols="30" class="text-input"></textarea>
                                                <label class="error" for="input-message" id="message_error">Message is required.</label>
                                            </div>
                                        </div>
                                        <div class="af-outer af-required">
                                            <div class="af-inner">
                                                <%

                                                if(session.getAttribute("uid") != null){
                                                    out.print("<input type=\"submit\" name=\"submit\" class=\"form-button btn btn-large\" id=\"submit_btn\" value=\"Send Message!\" />");
                                                }else{
                                                    out.print("<input type=\"submit\" name=\"submit\" class=\"form-button btn btn-large\" id=\"submit_btn\" value=\"Send Message!\" disabled=\"disabled\" />");
                                                    out.print("<label class=\"error\" for=\"input-message\" id=\"message_error\">Please login.</label>");
                                                }
                                                %>

                                            </div>
                                        </div>
                                    </form>
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