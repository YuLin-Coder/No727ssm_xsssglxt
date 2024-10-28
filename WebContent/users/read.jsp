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
				<span><i></i>${article.bannername }</span>
				<p>
					<i></i>当前位置：<a href="index/index.action" style="color: #FFFFFF">网站首页</a> > <a href="index/article.action?id=${article.bannerid }" style="color: #FFFFFF">${article.bannername }</a>
					> ${article.title }
				</p>
			</h2>
			<div class="ne-tline none both"></div>

			<div class="ne-txt">
				<div class="ne-til" style="color: #333333">${article.title }</div>
				<div class="ne-ft" style="color: #333333">${article.addtime }&nbsp;&nbsp;&nbsp;&nbsp;发布：管理员&nbsp;&nbsp;&nbsp;&nbsp;浏览次数：${article.hits }次</div>
				<div class="ne-tline none both"></div>
				<div class="ne-txt" style="line-height: 40px;">
					<p>
						<img style="text-align: center; margin: 0px auto; display: block" border=0 src="${article.image }" width=650>
					</p>
					${article.contents }
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
