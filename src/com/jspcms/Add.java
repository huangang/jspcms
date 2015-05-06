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
        }

    }

    public void addSort(String sortname,HttpServletResponse resp) throws ServletException, IOException{
        resp.setContentType("text/html;charset=utf8");
        PrintWriter out = resp.getWriter();
        String sql = "insert into sorts(sname) values('"+sortname+"')";
        out.print(sql);

        if(sqlop.executeUpdate(sql,null) != 0){
            out.println("<script>alert('添加成功');window.location.href='Manager/Sort/index.jsp';</script>");
        }else{
            out.println("添加失败");
            out.print(sql);
        }
    }
}
