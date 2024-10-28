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
				<span><i></i>我的宿舍评分</span>
				<p>
					<i></i>当前位置：<a href='index/index.action' style='color: #FFFFFF'>网站首页</a> > 我的宿舍评分
				</p>
			</h2>
			<div class='ne-tline none both'></div>
			<div class='ne-txt'>
				<div class='ne-form' align='center'>
					<table width="99%" border="0" cellpadding="5" cellspacing="1" bgcolor="#E0EDB7">
						<tr>
							<td height='30' colspan='9' align='left' background='themes/cms_red1/images/bg.png' class='white14B'>我的宿舍评分</td>
						</tr>
						<tr>
							<td align="center" bgcolor="#FFFFFF">宿舍</td>
							<td align="center" bgcolor="#FFFFFF">分数</td>
							<td align="center" bgcolor="#FFFFFF">内容</td>
							<td align="center" bgcolor="#FFFFFF">日期</td>
						</tr>
						<c:forEach items="${topicList}" var="topic">
							<tr align="center" bgcolor="#FFFFFF">
								<td>${topic.roomsname}</td>
								<td>${topic.num}</td>
								<td>${topic.contents}</td>
								<td>${topic.addtime}</td>
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

