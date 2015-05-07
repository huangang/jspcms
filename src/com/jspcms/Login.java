package com.jspcms;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huangang on 15/5/5.
 */
public class Login extends HttpServlet{
    User user = new User();
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
        if(list.size()!= 0) {
            out.print(list);
            Object ob = list.get(0);
            Map<String, Object> map = new HashMap<String, Object>();
            map = (HashMap) ob;
            user.setUid(Integer.parseInt(map.get("uid").toString()));
            user.setUsername(map.get("username").toString());
            user.setPassword(map.get("password").toString());
            user.setEmail(map.get("email").toString());
            user.setRole(map.get("role").toString());
            user.setRegister_time(map.get("register_time").toString());

            HttpSession session = req.getSession();
            session.setAttribute("uid", user.getUid());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("password", user.getPassword());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("role", user.getRole());
            session.setAttribute("register_time", user.getRegister_time());

            if (user.getRole().equals("manager")) {
                resp.sendRedirect("Manager/index.jsp");
            } else if (user.getRole().equals("author")) {
                resp.sendRedirect("Author/index.jsp");
            } else if (user.getRole().equals("subscriber")) {
                resp.sendRedirect("Subscriber/index.jsp");
            } else {
                out.print("<script>alert(\"登录错误,请重新登录\");window.location.href=\"/login.jsp\";</script>");
            }
        }else{
            out.print("<script>alert(\"登录错误,请重新登录\");window.location.href=\"/login.jsp\";</script>");
        }



    }


}
