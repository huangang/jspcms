package com.jspcms;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by joya on 15/5/6.
 */
public class Add extends HttpServlet{


    SqlOperate sqlop = new SqlOperate();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String table = req.getParameter("table");

        PrintWriter out = resp.getWriter();
        if(table.equals("sort")){

            String sortname = req.getParameter("sortname");
            addSort(sortname, resp);
        }else if(table.equals("user")){
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String email = req.getParameter("email");
            String role = req.getParameter("role");
            addUser(username,password,email,role,resp);
        }else if (table.equals("post")){
            HttpSession session = req.getSession();
            String uid = session.getAttribute("uid").toString();
            String role = session.getAttribute("role").toString();
            String sid = req.getParameter("sid");
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            addPost(title,uid,sid,content,resp,role);

        }else if(table.equals("comment")){
            HttpSession session = req.getSession();
            String uid = session.getAttribute("uid").toString();
            String pid = req.getParameter("pid");
            String content = req.getParameter("message");
            String reply_id = req.getParameter("reply_id");
            addComment(uid, pid, reply_id,content, resp);
        }

    }


    public void addSort(String sortname,HttpServletResponse resp) throws ServletException, IOException{
        resp.setContentType("text/html;charset=utf8");
        PrintWriter out = resp.getWriter();
        String sql = "insert into sorts(sname) values('"+sortname+"')";

        if(sqlop.executeUpdate(sql,null) != 0){
            out.println("<script>alert('添加成功');window.location.href='Manager/Sort/index.jsp';</script>");
        }else{
            out.println("添加失败");
            out.print(sql);
        }
    }

    public void addUser(String username,String password,String email,String role,HttpServletResponse resp) throws ServletException, IOException{
        resp.setContentType("text/html;charset=utf8");
        PrintWriter out = resp.getWriter();

        String sqlEmail = "select *from users where email='"+email+"'";

        if(sqlop.executeQuerySingle(sqlEmail,null) != null){
            out.print("<script>alert(\"邮箱已存在\");window.location.href=\"/Manager/User/add.jsp\";</script>");
        }else {
            MD5 getMD5 = new MD5();
            password = getMD5.GetMD5Code( password );
            String sql = "insert into users(username,password,email,role) values('" + username + "','" + password + "','" + email + "','" + role + "')";

            if (sqlop.executeUpdate(sql, null) != 0) {
                out.println("<script>alert('添加成功');window.location.href='Manager/User/index.jsp';</script>");
            } else {
                out.println("添加失败");
                out.print(sql);
            }
        }
    }

    public void addPost(String title,String uid,String sid,String content,HttpServletResponse resp,String role) throws ServletException, IOException{
        resp.setContentType("text/html;charset=utf8");
        PrintWriter out = resp.getWriter();
        String sql = "insert into posts(title,uid,sid,content) values('"+title+"','"+uid+"','"+sid+"','"+content+"')";

        if(sqlop.executeUpdate(sql,null) != 0){
            if(role.equals("manager")) {
                out.println("<script>alert('添加成功');window.location.href='Manager/Post/index.jsp';</script>");
            }else if(role.equals("author")){
                out.println("<script>alert('添加成功');window.location.href='Author/Post/index.jsp';</script>");
            }
        }else{
            out.println("添加失败");
            out.print(sql);
        }
    }

    private void addComment(String uid, String pid, String reply_id, String content, HttpServletResponse resp) throws ServletException, IOException{
        resp.setContentType("text/html;charset=utf8");
        PrintWriter out = resp.getWriter();
        String sql = "insert into comments(pid,uid,reply_cid,content) values('"+pid+"','"+uid+"','"+reply_id+"','"+content+"')";

        if(sqlop.executeUpdate(sql,null) != 0){
            out.println("<script>alert('添加成功');window.location.href='single.jsp?pid="+pid+"';</script>");
        }else{
            out.println("<script>alert('添加失败');window.location.href='single.jsp?pid="+pid+"';</script>");
            out.println("<script>alert('" + sql + "');");
        }

    }


}
