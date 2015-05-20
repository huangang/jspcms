<%@ page import="com.jspcms.SqlOperate" %>
<%--
  Created by IntelliJ IDEA.
  User: huangang
  Date: 15/5/20
  Time: 上午10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
  String uidSession = request.getParameter("uidSession");
  if(uidSession.equals(session.getAttribute("uidSession"))){
    String uid = request.getParameter("uid");
    String email = request.getParameter("email");
    String sql = "update users set password='e10adc3949ba59abbe56e057f20f883e' where uid='"+uid+"'and email='"+email+"'";
    SqlOperate sqlop = new SqlOperate();
    int en = sqlop.executeUpdate(sql,null);
    if(en >= 0){
      out.print("<script>alert(\"密码已经重置为123456,请及时登陆修改您的密码\");window.location.href=\"/login.jsp\";</script>");
    }

  }else{
    out.print("<script>alert(\"链接已失效\");window.location.href=\"/backpassword.jsp\";</script>");
  }



%>
</body>
</html>
