<%--
  Created by IntelliJ IDEA.
  User: huangang
  Date: 15/5/11
  Time: 上午8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.jspcms.SqlOperate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<% request.setCharacterEncoding("utf-8");  %>
<!-- sidebar -->
<aside id="sidebar" class="alignright span4">
  <!-- Search -->
  <section class="search clearfix">
    <form id="search" class="input-append" action="search.jsp" method="get"/>
    <input id="appendedInputButton" size="16" type="text" value="Search..." name="title" onkeyup="findTitles();"  onfocus="if(this.value=='Search...') this.value=''" onblur="if(this.value=='') this.value='Search...'" />
      <button class="btn search-bt" type="submit" ></button><br>
      <div id="popup" border="0" style="z-index:99;">
          <table id="complete_table" border="0" cellspacing="0" cellpadding="0" style="background-color: #cceeff;">
              <tbody id="complete_body">
              </tbody>
          </table>
      </div>
    </form>
  </section>
    <style>
        td{
            font-size: 20px;
        }
    </style>
    <script>
        var XMLHttpReq;
        var completeDiv;
        var inputField;
        var completeTable;
        var completeBody;
        //创建XMLHttpRequest对象
        function createXMLHttpRequest() {
            var o;
            if(window.XMLHttpRequest) { //Mozilla 浏览器
                o = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) { // IE浏览器
                try {
                    o = new ActiveXObject("Msxml2.XMLHTTP");
                } catch(e){
                    try{
                        o = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {}
                }
            }
            return o;
        }

        function findTitles() {
            inputField = document.getElementById("appendedInputButton");
            console.log(inputField.value);
            completeTable = document.getElementById("complete_table");
            completeDiv = document.getElementById("popup");
            completeBody = document.getElementById("complete_body");
            if (inputField.value.length > 0) {
                var o=createXMLHttpRequest();
                //var url = "/DoSearch?titles=" + escape(inputField.value);
                //此处escape函数可以去掉，escape是采用ISO Latin字符集对指定的字符串进行编码。
                var url = "/DoSearch?titles=" + inputField.value;
                o.open("POST", url, true);
                o.onreadystatechange = function(){
                    if (o.readyState == 4) { // 判断对象状态
                        if (o.status == 200) { // 信息已经成功返回，开始处理信息
                            setTitles(o.responseXML.getElementsByTagName("res"));
                        }else { //页面不正常
                            window.alert("您所请求的页面有异常。");
                        }
                    }

                };//指定响应函数
                o.send(null); // 发送请求
            } else {
                clearTitles();
            }
        }

        //生成与输入内容匹配行
        function setTitles(titles) {
            clearTitles();
            var size = titles.length;
            setOffsets();
            var row, cell, txtNode;
            for (var i = 0; i < size; i++) {
                var nextNode = titles[i].firstChild.data;
                row = document.createElement("tr");
                cell = document.createElement("td");
                cell.onmouseout = function () {
                    this.className = 'mouseOver';
                };
                cell.onmouseover = function () {
                    this.className = 'mouseOut';
                };
                cell.setAttribute("bgcolor", "#ffddcc");
                cell.setAttribute("border", "0");
                cell.setAttribute("width", inputField.offsetWidth + "px");
                cell.onclick = function () {
                    completeField(this);
                };
                txtNode = document.createTextNode(nextNode);
                cell.appendChild(txtNode);
                row.appendChild(cell);
                completeBody.appendChild(row);
            }
        }
        //设置显示位置
        function setOffsets() {
            completeTable.style.width = "auto";    //显示自动完成的提示框宽度自动伸展或缩小
            gettable(inputField);
        }
        //取绝对位置
        function getAbsPosition(obj) {
            var r = {
                left: obj.offsetLeft,
                top : obj.offsetTop
            };
            r.left = obj.offsetLeft;
            r.top  = obj.offsetTop;
            if(obj.offsetParent) {
                var tmp = getAbsPosition(obj.offsetParent);
                r.left += tmp.left;
                r.top  += tmp.top;
            }
            return r;
        }

        //为提示定位
        function gettable(obj) {
            var pos = getAbsPosition(obj);
            pos.top += obj.offsetHeight;
            completeDiv.style.top = pos.top + "px";
            completeDiv.style.left = pos.left + "px";
            completeDiv.style.width = obj.offsetWidth + "px";
            completeDiv.style.visibility = '';
        }

        //计算显示位置
        function calculateOffset(field, attr) {
            var offset = 0;
            while(field) {
                offset += field[attr];
                fieldfield = field.offsetParent;
            }
            return offset;
        }

        //填写输入框
        function completeField(cell) {
            inputField.value = cell.firstChild.nodeValue;
            clearTitles();
        }

        //清除自动完成行
        function clearTitles() {
            var ind = completeBody.childNodes.length;
            for (var i = ind - 1; i >= 0 ; i--) {
                completeBody.removeChild(completeBody.childNodes[i]);
            }
            completeDiv.style.border = "none";
        }
    </script>


  <!-- Advertisment -->
  <div class="title-divider">
    <h3>Advertisment</h3>
    <div class="divider-arrow"></div>
  </div>
  <section class="block-dark">
    <img src="images/adv.gif" alt="" />
  </section>
  <!-- Recent Posts -->
  <div class="title-divider">
    <h3>Recent Posts</h3>
    <div class="divider-arrow"></div>
  </div>
  <section class="post-widget block-grey">
    <ul class="clearfix block-light wrap15">
      <%
          SqlOperate sqlop = new SqlOperate();
          String sql = "select *from posts order by pid desc limit 0,5";
          List list = sqlop.excuteQuery(sql, null);
          int postNum = list.size();
          for(int i=0;i<postNum;i++) {
              Object ob = list.get(i);
              Map<String, Object> map = new HashMap<String, Object>();
              map = (HashMap)ob;
              String pid =map.get("pid").toString();
              sql = "select count(*) from comments where pid = '"+pid+"'";
              String cnum = sqlop.executeQuerySingle(sql, null).toString();
              String title = map.get("title").toString();
              String post_time = map.get("post_time").toString();
              out.print("<li>");
              out.print("<a href=\"single.jsp?pid="+pid+"\">"+title+"at</a>");
              out.print("<p><em>"+post_time.substring(0, post_time.length() - 2)+", "+cnum+" comments</em></p><div class=\"clear\"></div>");
              out.print("</li>");

          }

      %>
    </ul>
  </section>
</aside>