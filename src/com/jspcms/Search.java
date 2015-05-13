package com.jspcms;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
/**
 * Created by huangang on 15/5/13.
 */
public class Search extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

        String key=new String(req.getParameter("titles").getBytes("iso-8859-1"),"utf-8");
        SqlOperate sqlop = new SqlOperate();
        String sql="SELECT * FROM posts WHERE title like '%"+key+"%' ";
        List list = sqlop.excuteQuery(sql, null);
        //获得数据结果集合
        resp.setContentType("application/xml;charset=UTF-8");
        out.println("<?xml version='1.0' encoding='UTF-8' ?>");
        out.println("<response>");
        int postNum = list.size();
        for(int i=0;i<postNum;i++) {
            Object ob = list.get(i);
            Map<String, Object> map = new HashMap<String, Object>();
            map = (HashMap) ob;
            String pid = map.get("pid").toString();
            String uid = map.get("uid").toString();
            String title = map.get("title").toString();
            String content = map.get("content").toString();
            // 输出每一个数据
            out.println("<res>"+title+"</res>");
            System.out.println(title);

        }

        out.println("</response>");



    }
}
