<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title}</title>
<script type='text/javascript' src='<%=basePath%>My97DatePicker/WdatePicker.js' charset='utf-8'></script>
<script type='text/javascript' src='themes/cms_red1/js/jq.js'></script>
<script type='text/javascript' src='js/selimage.js' charset='utf-8'></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class='main wid'>
		<div class='center_layout'>
			<h2>
				<span><i></i>学生信息</span>
				<p>
					<i></i>当前位置：<a href='index/personal.action' style='color: #FFFFFF'>网站首页</a> > 学生信息
				</p>
			</h2>
			<div class='ne-tline none both'></div>
			<div class='ne-txt'>
				<div class='ne-form' align='center'>
					<form action='index/personal.action' method='post' name='myform'>
						<table width='56%' border='0' cellpadding='5' cellspacing='1' bgcolor='#E0EDB7'>
							<tr>
								<td height='30' colspan='2' align='center' background='themes/cms_red1/images/bg.png' class='white14B'>学生信息</td>
							</tr>

							<tr>
								<td width="80" height="50" align="right" bgcolor="#FFFFFF">账号：</td>
								<td bgcolor="#FFFFFF">${sessionScope.users.username }<input type="hidden" name="username" id="username"
									value="${sessionScope.users.username }" /><input type="hidden" name="password" id="password" value="${sessionScope.users.password }" /><input
									type="hidden" name="usersid" id="usersid" value="${sessionScope.users.usersid }" /><input type="hidden" name="regdate" id="regdate"
									value="${sessionScope.users.regdate }" /><input type="hidden" name="status" id="status" value="${sessionScope.users.status }" /><input
									type="hidden" name="roomsid" id="roomsid" value="${sessionScope.users.roomsid }" />
								</td>
							</tr>
							<tr>
								<td width="80" height="50" align="right" bgcolor="#FFFFFF">姓名：</td>
								<td bgcolor="#FFFFFF"><input type="text" name="realname" style="width: 260px; height: 30px" id="realname"
									value="${sessionScope.users.realname }" /></td>
							</tr>
							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">性别：</td>
								<td bgcolor="#FFFFFF"><input type="radio" name="sex" id="sex" value="男" ${users.sex == "男"?"checked":""} />男 &nbsp;&nbsp; <input
									type="radio" name="sex" id="sex" value="女" ${users.sex == "女"?"checked":""} />女</td>
							</tr>
							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">出生日期：</td>
								<td bgcolor="#FFFFFF"><input type="text" name="birthday" onclick="WdatePicker()" readonly="readonly"
									style="width: 260px; height: 30px" id="birthday" value="${sessionScope.users.birthday }" /></td>
							</tr>
							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">所在宿舍：</td>
								<td bgcolor="#FFFFFF">${sessionScope.users.roomsname }</td>
							</tr>
							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">联系方式：</td>
								<td bgcolor="#FFFFFF"><input type="text" name="contact" style="width: 260px; height: 30px" id="contact"
									value="${sessionScope.users.contact }" /></td>
							</tr>
							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">电子邮件：</td>
								<td bgcolor="#FFFFFF"><input type="text" name="email" style="width: 260px; height: 30px" id="email"
									value="${sessionScope.users.email }" /></td>
							</tr>
							<tr>
								<td bgcolor='#FFFFFF' colspan='2' align='center'><input type='submit' id='sub' value='提交' /> &nbsp;&nbsp;&nbsp;&nbsp; <input
									type='reset' id='res' value='重置' /></td>
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



