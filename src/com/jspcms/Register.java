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
        //super.doPost(req, resp);
        String username = req.getParameter("username");
        String password =req.getParameter("password");
        String repassword = req.getParameter("repassword");
        String email = req.getParameter("email");
        resp.setContentType("text/html;charset=utf8");
        PrintWriter out = resp.getWriter();

        if(!password.equals(repassword)){
            String alter = "<script>"+
                           "console.log('2次密码不一样');"+
                           "</script>";
            //out.println(alter);
            //resp.sendRedirect("register.jsp");
            out.println("2次密码不一样");
        }else{
            SqlOperate sqlop = new SqlOperate();
            String sql ="insert into users(username,password,email,role) values('"+username+"', '"+password+"','"+email+"','subscriber')";
            if(sqlop.executeUpdate(sql,null) != 0){
                out.println("注册成功");
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

