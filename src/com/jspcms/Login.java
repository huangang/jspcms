package com.jspcms;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


        List list = sqlop.excuteQuery(sql, null);
        Object ob = list.get(0);
        Map<String, Object> map = new HashMap<String, Object>();
        map = (HashMap)ob;
        out.print(map.get("uid"));
        out.print(map.get("username"));
        out.print(map.get("password"));
        out.print(map.get("email"));
        out.print(map.get("role"));
        out.print(map.get("register_time"));






    }


}
