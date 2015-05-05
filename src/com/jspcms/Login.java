package com.jspcms;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by huangang on 15/5/5.
 */
public class Login extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
        String username = req.getParameter("username");
        String password =req.getParameter("password");
        resp.setContentType("text/html;charset=utf8");
        PrintWriter out = resp.getWriter();
        String sql ="select *from users where username='"+username+"' and password='"+password+"'";
        SqlOperate sqlop = new SqlOperate();
        ResultSet re = sqlop.executeQueryRS(sql, null);
        try {
            re.next();
            out.println(re.getObject(1));
            out.println(re.getObject(2));
            out.println(re.getObject(3));
            out.println(re.getObject(4));
            out.println(re.getObject(5));
            out.println(re.getObject(6));


        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


}
