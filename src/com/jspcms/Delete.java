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
public class Delete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String table = req.getParameter("table");

        if(table.equals("sort")){
            String sid = req.getParameter("sid");
            try {
                resp.setContentType("text/html");
                resp.setHeader("Cache-Control", "no-store");
                resp.setHeader("Pragma", "no-cache");
                resp.setDateHeader("Expires", 0);
                String sql = "delete from sorts where sid="+sid;
                SqlOperate sqlop = new SqlOperate();
                out.println(sqlop.executeUpdate(sql, null));
                sql = "delete from posts where sid='"+sid+"'";
                sqlop.executeUpdate(sql,null);
            } finally {
                out.close();
            }
        }else if(table.equals("comment")){
            String cid = req.getParameter("cid");
            try {
                resp.setContentType("text/html");
                resp.setHeader("Cache-Control", "no-store");
                resp.setHeader("Pragma", "no-cache");
                resp.setDateHeader("Expires", 0);
                String sql = "delete from comments where cid="+cid;
                SqlOperate sqlop = new SqlOperate();
                out.println(sqlop.executeUpdate(sql, null));
            } finally {
                out.close();
            }
        }else if(table.equals("user")){
            String uid = req.getParameter("uid");
            try {
                resp.setContentType("text/html");
                resp.setHeader("Cache-Control", "no-store");
                resp.setHeader("Pragma", "no-cache");
                resp.setDateHeader("Expires", 0);
                SqlOperate sqlop = new SqlOperate();
                String sql = "delete from users where uid=" + uid;
                out.println(sqlop.executeUpdate(sql, null));
                sql = "delete from posts where uid='"+uid+"'";
                sqlop.executeUpdate(sql,null);
                sql = "delete from comments where uid='"+uid+"'";
                sqlop.executeUpdate(sql,null);
            } finally {
                out.close();
            }
        }else if(table.equals("post")){
            String pid = req.getParameter("pid");
            try {
                resp.setContentType("text/html");
                resp.setHeader("Cache-Control", "no-store");
                resp.setHeader("Pragma", "no-cache");
                resp.setDateHeader("Expires", 0);
                String sql = "delete from posts where pid="+pid;
                SqlOperate sqlop = new SqlOperate();
                out.println(sqlop.executeUpdate(sql, null));
                sql = "delete from comments where pid='"+pid+"'";
                sqlop.executeUpdate(sql,null);
            } finally {
                out.close();
            }
        }



    }


}
