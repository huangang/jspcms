package com.jspcms;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by huangang on 15/5/6.
 */
public class Update extends HttpServlet {

    SqlOperate sqlop = new SqlOperate();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String table = req.getParameter("table");
        if(table.equals("sort")) {
            String sid = req.getParameter("sid");
            String sname =req.getParameter("sname");
            String sql ="update sorts set sname='"+sname+"' where sid='"+sid+"'";
            int efn=sqlop.executeUpdate(sql,null);
            if(efn >= 1){
                out.println("<script>alert('修改成功');window.location.href='Manager/Sort/index.jsp';</script>");
            }else {
                out.print(sql);
                out.println("<script>alert('修改失败');window.location.href='Manager/Sort/index.jsp';</script>");
            }

        }else if(table.equals("user")) {
            String uid = req.getParameter("uid");
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String email = req.getParameter("email");
            String role = req.getParameter("role");
            String sql = "update users set username='" + username + "',password='" + password + "' ,email='" + email + "' ,role='" + role + "' where uid='" + uid + "'";
            int efn = sqlop.executeUpdate(sql, null);
            if (efn >= 1) {
                out.println("<script>alert('修改成功');window.location.href='Manager/User/index.jsp';</script>");
            } else {
                out.print(sql);
                out.println("<script>alert('修改失败');window.location.href='Manager/User/index.jsp';</script>");
            }
        }else if(table.equals("post")){
            String pid=req.getParameter("pid");
            String title=req.getParameter("title");
            String sid=req.getParameter("sid");
            String content = req.getParameter("content");
            String sql = "update posts set title='"+title+"', sid='"+sid+"',content='"+content+"' where pid='"+pid+"'";
            int efn =sqlop.executeUpdate(sql,null);
            if (efn >= 1) {
                out.println("<script>alert('修改成功');window.location.href='Manager/Post/index.jsp';</script>");
            } else {
                out.print(sql);
                out.println("<script>alert('修改失败');window.location.href='Manager/Post/index.jsp';</script>");
            }

        }



    }
}
