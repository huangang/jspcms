<%--
  Created by IntelliJ IDEA.
  User: huangang
  Date: 15/5/17
  Time: 下午10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/bootstrap-responsive.css" />
  <link rel="stylesheet" type="text/css" href="../../CommonBackstage/Css/style.css" />
  <script type="text/javascript" src="../../CommonBackstage/Js/jquery.js"></script>
  <script type="text/javascript" src="../../CommonBackstage/Js/jquery.sorted.js"></script>
  <script type="text/javascript" src="../../CommonBackstage/Js/bootstrap.js"></script>
  <script type="text/javascript" src="../../CommonBackstage/Js/ckform.js"></script>
  <script type="text/javascript" src="../../CommonBackstage/Js/common.js"></script>


  <%request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8"); %>
  <style type="text/css">
    body {
      padding-bottom: 40px;
    }
    .sidebar-nav {
      padding: 9px 0;
    }

    @media (max-width: 980px) {
      /* Enable use of floated navbar text */
      .navbar-text.pull-right {
        float: none;
        padding-left: 5px;
        padding-right: 5px;
      }
    }


  </style>
</head>
<body>
<form action="/DoUpdate" method="post" class="definewidth m20">
  <table class="table table-bordered table-hover definewidth m10">
    <input type="hidden" name="table" value="changePassword" />
    <%
      String uid=session.getAttribute("uid").toString();
    %>
    <input type="hidden" name="uid" value="<%=uid%>" />
    <tr>
      <td class="tableleft">旧密码</td>
      <td><input type="password" name="password" value=""/></td>
    </tr>
    <tr>
      <td class="tableleft">新密码</td>
      <td><input type="password" name="nowPassword" value=""/></td>
    </tr>
    <tr>
      <td class="tableleft"></td>
      <td>
        <button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;
        <button type="button" class="btn btn-success" name="backid" id="backid">返回</button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<script>
  $(function () {
    $('#backid').click(function(){
      window.location.href="index.jsp";
    });

  });
</script>
