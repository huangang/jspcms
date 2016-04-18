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
 * Created by joya on 15/5/20.
 */
public class BackPassword  extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf8");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String incode = (String) req.getParameter("code");
        String rightcode = (String) session.getAttribute("rCode");
        if (incode != null && rightcode != null) {
            if (incode.equals(rightcode)) {
                String email = req.getParameter("email");
                String sql = "select *from users where email= '"+email+"'";
                SqlOperate sqlop = new SqlOperate();
                List list = sqlop.excuteQuery(sql, null);
                if (list.size() != 0) {
                    Object ob = list.get(0);
                    Map<String, Object> map = new HashMap<String, Object>();
                    map = (HashMap) ob;
                    String uid = map.get("uid").toString();

                    SenderWithSMTPVer sm=new   SenderWithSMTPVer();
                    sm.setHost("smtp.mxhichina.com");
                    sm.setAccount("jspcms@pupued.com", "2012810505joya");   //发送邮件的用户名、密码
                    MD5 getMD5 = new MD5();
                    String uidSession = getMD5.GetMD5Code(uid);
                    session.setAttribute("uidSession", uidSession);
                    String path = req.getContextPath();
                    String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+"/";
                    String url = basePath+"resetpassword.jsp?uidSession="+uidSession+"&uid="+uid+"&email="+email;
                    int a=sm.send("jspcms@pupued.com", email, "", "jspcms找回密码", "请点击找回密码"+url);//执行发送
                    System.out.println(a);
                    if(a>=1){
                        out.print("<script>alert(\"请到邮箱点击重置密码\");window.location.href=\"/login.jsp\";</script>");
                    }

                }else{
                    out.print("<script>alert(\"不存在该用户\");window.location.href=\"/backpassword.jsp\";</script>");
                }

            }else{
                out.print("<script>alert(\"验证码错误\");window.location.href=\"/backpassword.jsp\";</script>");
            }

        }else{
            out.print("<script>alert(\"验证码错误\");window.location.href=\"/backpassword.jsp\";</script>");
        }
    }
}
