<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>">
<title>${title}</title>
<script type="text/javascript" src="themes/cms_red1/js/jq.js"></script>
<script type="text/javascript" src="js/pwd.js" charset="utf-8"></script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="main wid">
		<div class="center_layout">
			<h2>
				<span><i></i>修改密码</span>
				<p>
					<i></i>当前位置：<a href="index/index.action" style="color: #FFFFFF">网站首页</a> > 修改密码
				</p>
			</h2>
			<div class="ne-tline none both"></div>

			<div class="ne-txt">
				<div class="ne-form" align="center">
					<form action="index/editpwd.action" name="myform" method="post">
						<table width="56%" border="0" cellpadding="5" cellspacing="1" bgcolor="#E0EDB7">
							<tr>
								<td height="30" colspan="2" align="center" background="themes/cms_red1/images/bg.png" class="white14B">修改密码</td>
							</tr>
							<tr>
								<td width="80" height="50" align="right" bgcolor="#FFFFFF">用户账号：</td>
								<td bgcolor="#FFFFFF">${sessionScope.username }<input type="hidden" name="username" style="width: 260px; height: 30px" id="username"
									value="${sessionScope.username }" />
								</td>
							</tr>
							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">用户密码：</td>
								<td bgcolor="#FFFFFF"><input type="password" name="password" style="width: 260px; height: 30px" id="password" placeholder="请输入用户密码" /></td>
							</tr>
							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">新密码：</td>
								<td bgcolor="#FFFFFF"><input type="password" name="newpassword" style="width: 260px; height: 30px" id="newpassword" placeholder="请输入新密码" /></td>
							</tr>
							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">确认密码：</td>
								<td bgcolor="#FFFFFF"><input type="password" name="repassword" style="width: 260px; height: 30px" id="repassword" placeholder="请输入确认密码" /></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" colspan="2" align="center"><label> <input type="submit" id="sub" value="提交" /> &nbsp;&nbsp;&nbsp;&nbsp; <input
										type="reset" id="res" value="重置" />
								</label></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
