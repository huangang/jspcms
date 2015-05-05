<%--
  Created by IntelliJ IDEA.
  User: huangang
  Date: 15/5/4
  Time: 下午3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <h1>hello jspcms</h1>
<%
  String driverClass="com.mysql.jdbc.Driver";
  String url="jdbc:mysql://localhost:3306/jspcms";
  String username = "root";
  String password = "64314527Z";
  Class.forName(driverClass);	 // 加载数据库驱动
  Connection conn=DriverManager.getConnection(url, username, password);	//建立连接
  Statement stmt=conn.createStatement();
  ResultSet rs = stmt.executeQuery("select * from users");	//执行SQL语句
  while(rs.next()){
    out.println("<br>用户名："+rs.getString(2)+"	密码："+rs.getString(3));
  }
  rs.close();
  stmt.close();
  conn.close();
%>
  </body>
</html>
