package com.jspcms;

/**
 * Created by huangang on 15/5/20.
 */
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
public class SenderWithSMTPVer
{
    String   host="";
    String   user="";
    String   password="";

    public void setHost(String   host)
    {
        this.host=host;
    }

    public void setAccount(String   user,String   password)
    {
        this.user=user;
        this.password=password;
    }

    public int send(String   from,String   to,String  cc,String   subject,String   content)
    {
        Properties   props   =   new   Properties();
        props.put("mail.smtp.host",   host);
        props.put("mail.smtp.auth",   "true");
        try
        {
            Session mailSession = Session.getDefaultInstance(props);
            mailSession.setDebug(true);
            Message message=new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(from));
            //处理收件人to
            if(to!="" && to!=null){
                String []tos=to.split(",");
                for(int i=0;i<tos.length;i++){
                    message.addRecipient(Message.RecipientType.TO,new   InternetAddress(tos[i]));
                }
            }

            if(cc!="" && cc!=null){
                String []ccs=cc.split(",");
                for(int i=0;i<ccs.length;i++){
                    message.addRecipient(Message.RecipientType.CC,new   InternetAddress(ccs[i]));
                }
            }
            message.setSubject(subject);
            message.setText(content);
            message.saveChanges();

            Transport   transport   =null;
            transport=mailSession.getTransport("smtp");
            if(transport==null)
            {
             //System.out.println("999999");
            }

            //Transport   transport   =   mailSession.getTransport("smtp");
            // System.out.println(host);
            //  System.out.println(user);
            // System.out.println(password);
            transport.connect(host,   user,   password);
            transport.sendMessage(message,   message.getAllRecipients());
            transport.close();
            return 1;
        }catch(Exception   e)
        {
            e.printStackTrace();
            return 0;   //邮件发送失败，地址错误
        }
    }

    public static void main(String   args[])
    {
        SenderWithSMTPVer sm=new   SenderWithSMTPVer();

        sm.setHost("smtp.mxhichina.com");
        sm.setAccount("jspcms@pupued.com","2012810505HuanGang");   //发送邮件的用户名、密码
        int a=sm.send("jspcms@pupued.com","354073277@qq.com", "", "java发送邮件测试", "测试数据");//执行发送
        System.out.println(a);
    }
}