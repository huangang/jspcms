<%--
Created by IntelliJ IDEA.
com.jspcms.User: huangang
Date: 15/5/6
Time: 下午4:16
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<%@ page import="com.jspcms.SqlOperate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%
    String pid=request.getParameter("pid");
    String user_id;
    if(session.getAttribute("uid") != null) {
        user_id = session.getAttribute("uid").toString();
    }else{
        user_id = "0";
    }
    if(pid == null){
        response.sendRedirect("index.jsp");
    }
    SqlOperate sqlop = new SqlOperate();
    String sql = "select *from posts where pid='"+pid+"'";
    List list = sqlop.excuteQuery(sql, null);
    Object ob = list.get(0);
    Map<String, Object> map = new HashMap<String, Object>();
    map = (HashMap)ob;
    String uid=map.get("uid").toString();
    String title = map.get("title").toString();
    String content = map.get("content").toString();
    sql = "select username from users where uid='"+uid+"'";
    String username=sqlop.executeQuerySingle(sql, null).toString();
    String sid=map.get("sid").toString();
    sql = "select sname from sorts where sid='"+sid+"'";
    String sname=sqlop.executeQuerySingle(sql, null).toString();

%>
<jsp:include page="header.jsp" flush="true" />

<!-- container -->
<section id="container">
    <div class="container">
        <div class="row">
            <!-- page content -->
            <section id="page-sidebar" class="alignleft span8">
                <!-- content -->
                <div class="row">
                    <div class="span8">
                        <div class="title-divider">
                            <h3><%=title%></h3>
                            <title><%=title%></title>
                            <div class="divider-arrow"></div>
                        </div>
                    </div>
                    <article class="blog-post span8">
                        <div class="block-grey">
                            <div class="block-light">
                                <div class="wrapper">
                                    <h2 class="post-title"><a href="sort.jsp?sid=<%=sid%>"><%=sname%></a></h2>
                                    <%
                                        sql = "select *from comments where pid='"+pid+"' order by cid desc";
                                        List lists = sqlop.excuteQuery(sql, null);
                                        int commentNum = lists.size();
                                    %>
                                    <a href="#" class="blog-comments"><%=commentNum %></a>
                                    <%=content%>
                                    <hr />

                                    <!--comments-->
                                    <div class="title-divider">
                                        <h3><%=commentNum %> Comments</h3>
                                        <div class="divider-arrow"></div>
                                    </div>
                                    <div class="comments">
                                        <ul class="comments-list">
                                            <%
                                                for(int i = 0;i < commentNum; i ++) {
                                                    Object obs = lists.get(i);
                                                    Map<String, Object> maps = new HashMap<String, Object>();
                                                    maps = (HashMap)obs;
                                                    String cid = maps.get("cid").toString();
                                                    String userid = maps.get("uid").toString();
                                                    sql = "select username from users where uid='"+userid+"'";
                                                    username=sqlop.executeQuerySingle(sql, null).toString();
                                                    sql = "select avatar from users where uid='"+userid+"'";
                                                    String avatar=sqlop.executeQuerySingle(sql, null).toString();
                                                    String reply_cid = maps.get("reply_cid").toString();
                                                    String ccontent = maps.get("content").toString();
                                                    String comment_time = maps.get("comment_time").toString();
                                                    out.print("<li class=\"clearfix comments_li\" ><div><img width=\"70\" height=\"70\" src=\""+avatar+"\" alt=\"avatar\" class=\"avatar\" /></div><div class=\"textarea last\">");
                                                    if(!reply_cid.equals("0")){
                                                        sql = "select uid from comments where cid='"+reply_cid+"'";
                                                        Object r_uid = sqlop.executeQuerySingle(sql, null);
                                                        if(r_uid != null) {
                                                            String ruid = r_uid.toString();
                                                            sql = "select comment_time from comments where cid='" + reply_cid + "'";
                                                            String rcomment_time = sqlop.executeQuerySingle(sql, null).toString();
                                                            sql = "select username from users where uid='" + ruid + "'";
                                                            String rusername = sqlop.executeQuerySingle(sql, null).toString();

                                                            out.print("<p class=\"meta\"><a id=\"cid" + cid + "\">" + comment_time.substring(0, comment_time.length() - 2) + " " + username + "</a> reply: <a>" + rcomment_time.substring(0, rcomment_time.length() - 2) + " " + rusername + "</a></p>");
                                                        }else{
                                                            out.print("<p class=\"meta\"><a id=\"cid" + cid + "\">" + comment_time.substring(0, comment_time.length() - 2) + " " + username + "</a> says:</p>");
                                                        }

                                                    }else {
                                                        out.print("<p class=\"meta\"><a id=\"cid" + cid + "\">" + comment_time.substring(0, comment_time.length() - 2) + " " + username + "</a> says:</p>");
                                                    }
                                                    out.print("<p>"+ccontent+"</p>");
                                                    out.println("<a href=\"javascript:void(0);\" onclick=\"reply(" + cid + ")\">回复</a>");
                                                    if(userid.equals(user_id)){
                                                        out.println("<a href=\"#\" onclick='del("+cid+")' >删除</a>");
                                                        out.println("<script>\n" +
                                                                "\n" +
                                                                "    function del(id){\n" +
                                                                "        var xmlhttp;\n" +
                                                                "        var status=\"\";\n" +
                                                                "        try{\n" +
                                                                "            xmlhttp=new ActiveXObject('Msxml2.XMLHTTP');\n" +
                                                                "        } catch(e){\n" +
                                                                "            try{\n" +
                                                                "                xmlhttp=new ActiveXObject('Microsoft.XMLHTTP');\n" +
                                                                "            } catch(e){\n" +
                                                                "                try{\n" +
                                                                "                    xmlhttp=new XMLHttpRequest();\n" +
                                                                "                }catch(e){}\n" +
                                                                "            }\n" +
                                                                "        }\n" +
                                                                "\n" +
                                                                "\n" +
                                                                "        if(confirm(\"确定要删除吗？\"))\n" +
                                                                "        {\n" +
                                                                "\n" +
                                                                "            xmlhttp.open(\"GET\",\"/DoDelete?table=comment&cid=\"+id,true);\n" +
                                                                "            xmlhttp.onreadystatechange=function(){\n" +
                                                                "                if (xmlhttp.readyState==4)\n" +
                                                                "                //xmlhttp.status==404 代表 没有发现该文件\n" +
                                                                "                    if (xmlhttp.status==200)\n" +
                                                                "                    {\n" +
                                                                "                        //alert(xmlhttp.status);\n" +
                                                                "                        status=xmlhttp.responseText;\n" +
                                                                "                        console.log(status);\n" +
                                                                "                    } else\n" +
                                                                "                    {\n" +
                                                                "                        alert(\"发生错误：\"+xmlhttp.status);\n" +
                                                                "                    }\n" +
                                                                "\n" +
                                                                "            }\n" +
                                                                "            xmlhttp.send(null);\n" +
                                                                "            window.location.href=\"single.jsp?pid="+pid+"\";\n" +
                                                                "\n" +
                                                                "        }\n" +
                                                                "\n" +
                                                                "    }\n" +
                                                                "\n" +
                                                                "</script>");
                                                    }
                                                    out.print("</div></li>");
                                            }
                                            %>
                                             <script>
                                                 function reply(id){
                                                     $("#reply_id").val(id);
                                                     var reply_name = $("#cid"+id).text();
                                                     $("#reply_name").val("回复"+reply_name);
                                                     $("#reply_name").css("display","block");
                                                     $("#clear_btn").css("display","block");
                                                 }
                                                 function clear_reply(){
                                                     $("#reply_id").val("");
                                                     $("#reply_name").val("");
                                                     $("#reply_name").css("display","none");
                                                     $("#clear_btn").css("display","none");
                                                 }
                                             </script>

                                        </ul>
                                    </div>
                                    <hr />

                                    <!--commetns form-->
                                    <div class="title-divider">
                                        <h3>Leave A Reply</h3>
                                        <div class="divider-arrow"></div>
                                    </div>
                                    <form name="comment" method="post" action="/DoAdd" class="af-form" id="af-form" />
                                    <input type="hidden" name="table" value="comment"/>
                                    <input type="hidden" name="pid" value="<%=pid%>"/>
                                        <div class="af-outer af-required">
                                            <div class="af-inner">
                                                <label for="input-message" id="message_label">Your Message:</label>
                                                <input type="hidden" value="0" name="reply_id" id="reply_id"/>
                                                <input type="text" value="" name="reply_name" style="display: none;" id="reply_name" readOnly="true" />
                                                <input type="button" id="clear_btn" value="Clear" onclick="clear_reply()" style="display: none;" class="form-button btn" />

                                                <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
                                                <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
                                                <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
                                                <%--<textarea name="message" id="input-message" cols="30" class="text-input"></textarea>--%>
                                                <script type="text/plain" id="input-message" style="width:100%;height:240px;" name="message">
                                                </script>
                                                <script type="text/javascript">
                                                    var ue = UE.getEditor('input-message',{
                                                        toolbars: [
                                                            [
                                                                'anchor', //锚点
                                                                'bold', //加粗
                                                                'indent', //首行缩进
                                                                'italic', //斜体
                                                                'underline', //下划线
                                                                'strikethrough', //删除线
                                                                'subscript', //下标
                                                                'fontborder', //字符边框
                                                                'superscript', //上标
                                                                'formatmatch', //格式刷
                                                                'source', //源代码
                                                                'blockquote', //引用
                                                                'pasteplain', //纯文本粘贴模式
                                                                'selectall', //全选
                                                                'print', //打印
                                                                'preview', //预览
                                                                'horizontal', //分隔线
                                                                'removeformat', //清除格式
                                                                'time', //时间
                                                                'date', //日期
                                                                'cleardoc', //清空文档
                                                                'insertcode', //代码语言
                                                                'fontfamily', //字体
                                                                'fontsize', //字号
                                                                'paragraph', //段落格式
                                                                'simpleupload', //单图上传
                                                                'insertimage', //多图上传
                                                                'link', //超链接
                                                                'unlink', //取消链接
                                                                'emotion', //表情
                                                                'spechars', //特殊字符
                                                                'searchreplace', //查询替换
                                                                'map', //Baidu地图
                                                                'insertvideo', //视频
                                                                'help', //帮助
                                                                'justifyleft', //居左对齐
                                                                'justifyright', //居右对齐
                                                                'justifycenter', //居中对齐
                                                                'justifyjustify', //两端对齐
                                                                'forecolor', //字体颜色
                                                                'backcolor', //背景色
                                                                'directionalityltr', //从左向右输入
                                                                'directionalityrtl', //从右向左输入
                                                                'rowspacingtop', //段前距
                                                                'rowspacingbottom', //段后距
                                                                'pagebreak', //分页
                                                                'attachment', //附件
                                                                'lineheight', //行间距
                                                                'edittip ', //编辑提示
                                                                'customstyle', //自定义标题
                                                                'autotypeset', //自动排版
                                                                'webapp', //百度应用
                                                                'touppercase', //字母大写
                                                                'tolowercase', //字母小写
                                                                'background', //背景
                                                                'template', //模板
                                                                'scrawl', //涂鸦
                                                                'music', //音乐
                                                            ]
                                                        ],
//                                                        autoHeightEnabled: true,
//                                                        autoFloatEnabled: true
                                                    });
                                                </script>
                                                <label class="error" for="input-message" id="message_error">Message is required.</label>
                                            </div>
                                        </div>
                                        <div class="af-outer af-required">
                                            <div class="af-inner">
                                                <%

                                                if(session.getAttribute("uid") != null){
                                                    out.print("<input type=\"submit\" name=\"submit\" class=\"form-button btn btn-large\" id=\"submit_btn\" value=\"Send Message!\" />");
                                                }else{
                                                    out.print("<input type=\"submit\" name=\"submit\" class=\"form-button btn btn-large\" id=\"submit_btn\" value=\"Send Message!\" disabled=\"disabled\" />");
                                                    out.print("<label class=\"error\" for=\"input-message\" id=\"message_error\">Please login.</label>");
                                                }
                                                %>

                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
            <jsp:include page="sidebar.jsp" flush="true"/>

        </div>
    </div>
</section>

<jsp:include page="footer.jsp" flush="true"/>