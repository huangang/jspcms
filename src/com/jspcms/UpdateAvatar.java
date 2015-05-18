package com.jspcms;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

/**
 * Created by huangang on 15/5/18.
 */
public class UpdateAvatar extends HttpServlet {

    SqlOperate sqlop = new SqlOperate();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();

        String id=null;//上传记录id
        String destinationfileName=null;//目标文件名
        int flag=0;//上传标志

        String uploadPath =req.getSession().getServletContext().getRealPath("/")+"upload/avatar/";//图片上传路径
        String tempPath = req.getSession().getServletContext().getRealPath("/")+"upload/temp/";//图片临时上传路径
        String imagePath=req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/"; //   图片网络相对路径
        if(!new File(uploadPath).isDirectory()) new File(uploadPath).mkdirs();//   文件夹不存在就自动创建：
        if(!new File(tempPath).isDirectory())new File(tempPath).mkdirs();
        try {
            DiskFileUpload fu = new DiskFileUpload();
            fu.setSizeMax(4194304);//   设置最大文件尺寸，这里是4MB
            fu.setSizeThreshold(4096);//   设置缓冲区大小，这里是4kb
            fu.setRepositoryPath(tempPath);//   设置临时目录：
            List fileItems = fu.parseRequest(req);//   得到所有的文件：
            Iterator i = fileItems.iterator();
            while(i.hasNext()) {//   依次处理表单中每个域
                FileItem file = (FileItem)i.next();//   获得用户上传时文件名
//                if (file.isFormField()){  //获得文本域表单数据
//                    if("author".equals(file.getFieldName())) author=codeToString(file.getString());
//
//                    if("title".equals(file.getFieldName())) title=codeToString(file.getString());
//                    continue;//非file域不处理
//                }
                String sourcefileName = file.getName();
                if( sourcefileName.endsWith(".jpg") || sourcefileName.endsWith(".JPG")){//生成上传后的文件名
                //if(true){//生成上传后的文件名
                    Random rd = new Random();
                    Calendar time = Calendar.getInstance();
                    id=String.valueOf(time.get(Calendar.YEAR))
                            + String.valueOf(time.get(Calendar.MONTH)+1)
                            + String.valueOf(time.get(Calendar.DAY_OF_MONTH))
                            + String.valueOf(time.get(Calendar.HOUR_OF_DAY))
                            + String.valueOf(time.get(Calendar.MINUTE))
                            + String.valueOf(time.get(Calendar.SECOND))
                            + String.valueOf(rd.nextInt(100));
                    destinationfileName=id+".jpg";
                    File fTmp=new File(uploadPath+destinationfileName);
                    file.write(fTmp);
                    //out.print("<img src=" + imagePath + "upload/avatar/" + destinationfileName+">");
                    flag=1;//上传成功标志1
                }
                else{
                    out.print("上传失败，只能上传jpg文件！");
                }
            }
            //out.print("<script>location.href=/"demo.jsp/";</script>");
        }catch (IOException e) {out.print("上传失败！");} catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        String avatar  = "upload/avatar/"+destinationfileName;
        String uid = session.getAttribute("uid").toString();
        String role = session.getAttribute("role").toString();
        String sql = "update users set avatar='" + avatar + "' where uid='" + uid + "'";
        int efn = sqlop.executeUpdate(sql, null);
        if (efn >= 1) {
            if(role.equals("manager")) {
                out.println("<script>alert('修改成功');window.location.href='Manager/UserCenter/index.jsp';</script>");
            }else if(role.equals("author")){
                out.println("<script>alert('修改成功');window.location.href='Author/UserCenter/index.jsp';</script>");
            }else if(role.equals("subscriber")){
                out.println("<script>alert('修改成功');window.location.href='Subscriber/UserCenter/index.jsp';</script>");
            }
        } else {
            out.print(sql);
            if(role.equals("manager")) {
                out.println("<script>alert('修改失败');window.location.href='Manager/UserCenter/index.jsp';</script>");
            }else if(role.equals("author")){
                out.println("<script>alert('修改失败');window.location.href='Author/UserCenter/index.jsp';</script>");
            }else if(role.equals("subscriber")){
                out.println("<script>alert('修改失败');window.location.href='Subscriber/UserCenter/index.jsp';</script>");
            }
        }

        out.flush();
        out.close();
    }
}
