<%--
  Created by IntelliJ IDEA.
  User: huangang
  Date: 15/5/16
  Time: 上午9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>error</title>
</head>
<body>
<H1>网页发生错误：</H1><%=exception%>

<% exception.printStackTrace(response.getWriter()); %>

<h1><a href="/index.jsp">返回首页</a></h1>
</body>
</html>
