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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class='main wid'>
		<div class='center_layout'>
			<h2>
				<span><i></i>我的访客</span>
				<p>
					<i></i>当前位置：<a href='index/index.action' style='color: #FFFFFF'>网站首页</a> > 我的访客
				</p>
			</h2>
			<div class='ne-tline none both'></div>
			<div class='ne-txt'>
				<div class='ne-form' align='center'>
					<table width="99%" border="0" cellpadding="5" cellspacing="1" bgcolor="#E0EDB7">
						<tr>
							<td height='30' colspan='9' align='left' background='themes/cms_red1/images/bg.png' class='white14B'>我的访客</td>
						</tr>
						<tr>
							<td align="center" bgcolor="#FFFFFF">宿舍</td>
							<td align="center" bgcolor="#FFFFFF">学生</td>
							<td align="center" bgcolor="#FFFFFF">访客姓名</td>
							<td align="center" bgcolor="#FFFFFF">来访原因</td>
							<td align="center" bgcolor="#FFFFFF">开始时间</td>
							<td align="center" bgcolor="#FFFFFF">结束时间</td>
							<td align="center" bgcolor="#FFFFFF">状态</td>
							<td align="center" bgcolor="#FFFFFF">备注</td>
						</tr>
						<c:forEach items="${visitList}" var="visit">
							<tr align="center" bgcolor="#FFFFFF">
								<td>${visit.roomsname}</td>
								<td>${visit.realname}</td>
								<td>${visit.name}</td>
								<td>${visit.reason}</td>
								<td>${visit.thestart}</td>
								<td>${visit.theend}</td>
								<td>${visit.status}</td>
								<td>${visit.memo}</td>
							</tr>
						</c:forEach>
						<tr align="center" bgcolor="#FFFFFF">
							<td height='30' colspan='9' align='center'>${html}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page='footer.jsp'></jsp:include>
</body>
</html>

