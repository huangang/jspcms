package com.jspcms;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by huangang on 15/5/5.
 */
public class Register extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf8");
        PrintWriter out = resp.getWriter();
        String username = req.getParameter("username");
        String password =req.getParameter("password");
        String repassword = req.getParameter("repassword");
        String email = req.getParameter("email");
        SqlOperate sqlop = new SqlOperate();
        String sqlEmail = "select *from users where email='"+email+"'";
        if(sqlop.executeQuerySingle(sqlEmail,null) != null){
            out.print("<script>alert(\"邮箱已存在\");window.location.href=\"/register.jsp\";</script>");
        }


        if(!password.equals(repassword)){
            out.println("<script>alert(\"2次密码一样,请重新注册\");window.location.href=\"/register.jsp\";</script>");
        }else{
            MD5 getMD5 = new MD5();
            password = getMD5.GetMD5Code(password);
            String sql ="insert into users(username,password,email,role) values('"+username+"', '"+password+"','"+email+"','subscriber')";
            if(sqlop.executeUpdate(sql,null) != 0){
                out.print("<script>alert(\"注册成功,请登录\");window.location.href=\"/login.jsp\";</script>");
            }else{
                out.println("注册失败");
                out.print(sql);
            }



        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);

    }
}

