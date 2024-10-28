<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%><center>
	<div class="nav3 w both none"></div>
	<div class="bottom" style="float: center;">
		<div class="wid" style="float: center;">
			<div style="float: center;">
				<p style="float: center;"></p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p></p>
				<p>
					版权所有 &copy; <a href="<%=basePath%>admin/index.action" target="_blank"><font color="#FFF">后台管理员入口</font> </a>
				</p>
			</div>
		</div>
	</div>
</center>
<!--自定义封装函数-->

<script>
	tabs_cg(".notive .right_layout .tabs ul li", ".notive .right_layout .news_bok", "click", 'acti', "", "");
	two_scroll(".notive .left_layout ul li", "", "", ".notive .left_layout .cirl i", "");
	$(".menu ul li").hover(function() {
		var teoen = $(this).find('.sub-menu a').length;

		$(this).find('.sub-menu').height(teoen * 40);
	}, function() {
		$(this).find('.sub-menu').height(0);
	});
</script>
<%
	String message = (String) session.getAttribute("message");
if (message == null) {
	message = "";
}
if (!message.trim().equals("")) {
	out.println("<script language='javascript'>");
	out.println("alert('" + message + "');");
	out.println("</script>");
}
session.removeAttribute("message");
%>