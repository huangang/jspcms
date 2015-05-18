<%--
  Created by IntelliJ IDEA.
  User: huangang
  Date: 15/5/18
  Time: 上午9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jspcms.SqlOperate" %>
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


  <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
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
<form action="/DoUpdateAvatar" method="post" class="definewidth m20" enctype="multipart/form-data" >
  <table class="table table-bordered table-hover definewidth m10">
    <%
      String uid=session.getAttribute("uid").toString();
      String sql = "select avatar from users where uid = '"+uid+"'";
      SqlOperate sqlop = new SqlOperate();
      String avatar = sqlop.executeQuerySingle(sql,null).toString();

    %>
    <tr>
      <td class="tableleft">头像</td>
      <td>
        <img src="<%=basePath+avatar%>" width="70" height="70"><br>
        <input type="file" name="avatar" value="<%=avatar%>" accept="image/jpg" />
      </td>
    </tr>
    <tr>
      <td class="tableleft"></td>
      <td>
        <button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;
        <button type="button" class="btn btn-success" name="backid" id="backid">返回</button>
      </td>
    </tr>
    <tr>
      <td class="tableleft"></td>
      <td>备注：上传的jpg图片（显示扩展名为.jpg）大小不能超过4M！</td>
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

