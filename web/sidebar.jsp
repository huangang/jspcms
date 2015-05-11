<%--
  Created by IntelliJ IDEA.
  User: huangang
  Date: 15/5/11
  Time: 上午8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- sidebar -->
<aside id="sidebar" class="alignright span4">
  <!-- Search -->
  <section class="search clearfix">
    <form id="search" class="input-append" action="search.jsp" method="get"/>
    <input class="" id="appendedInputButton" size="16" type="text" value="Search..." name="title" onfocus="if(this.value=='Search...') this.value=''" onblur="if(this.value=='') this.value='Search...'" />
    <input class="btn search-bt" type="submit" name="submit"/>
    </form>
  </section>



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
      <li>
        <a href="#"><img src="example/sidebar1.jpg" alt="photo" /></a>
        <a href="#">Ut in lacus rhoncus elit egesta sluctus. Nullam at</a>
        <p><em>12 Apr 2012, 3 comments</em></p>
        <div class="clear"></div>
      </li>
      <li>
        <a href="#"><img src="example/sidebar2.jpg" alt="photo" /></a>
        <a href="#">Ut in lacus rhoncus elit egesta sluctus. Nullam at</a>
        <p><em>12 Apr 2012, 3 comments</em></p>
        <div class="clear"></div>
      </li>
      <li>
        <a href="#"><img src="example/sidebar3.jpg" alt="photo" /></a>
        <a href="#">Ut in lacus rhoncus elit egesta sluctus. Nullam at</a>
        <p><em>12 Apr 2012, 3 comments</em></p>
        <div class="clear"></div>
      </li>
    </ul>
  </section>
</aside>