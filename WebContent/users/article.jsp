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

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="main wid">
		<div class="center_layout">
			<h2>
				<span><i></i>${banner.bannername }</span>
				<p>
					<i></i>当前位置：<a href="index/index.action" style="color: #FFFFFF">网站首页</a> > <a href="" style="color: #FFFFFF">${banner.bannername }</a>
				</p>
			</h2>
			<div class="layout_news">
				<c:forEach items="${articleList}" var="article">
					<ul>
						<li><a href="index/read.action?id=${article.articleid }" title="${article.title }">${article.title }</a>
							<div style="float: right;">[${article.addtime }]</div></li>
					</ul>
				</c:forEach>
			</div>
			<div class="nav3 w both none"></div>

			<div style="clear: both; width: 100%"></div>
			<div class="megas512" style="text-align: center">
				<span class='disabled'>${html }</span>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
