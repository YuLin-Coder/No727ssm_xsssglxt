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
	<div class="notive wid1">
		<div class="left_layout">
			<div class="cirl">
				<c:forEach items="${favList}" var="article">
					<i></i>
				</c:forEach>
			</div>
			<ul>
				<c:forEach items="${favList}" var="article">
					<li><a href="index/read.action?id=${article.articleid }" title="${article.title }" target="_blank"><img src="${article.image }" alt="" width="487"
							height="331"></a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="right_layout">
			<div class="tabs">
				<ul>
					<li class="acti"><i></i>置顶公告<span></span></li>
				</ul>
			</div>
			<!--tabs-->
			<div class="news_bok">
				<ul>
					<c:forEach items="${topList}" var="article">
						<li><a href="index/read.action?id=${article.articleid }" title="${article.title }"><var>
									· ${article.title } <i class="i0"></i>
								</var><span>${article.addtime }</span></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="pict_ad">
		<div class="wid"></div>
	</div>


	<div class="quert" style="margin-bottom: -10px;">
		<div class="wid">
			<c:forEach items="${frontList}" var="article" varStatus="status">
				<c:if test="${status.count eq 1 || (status.count-1) % 2 eq 0}">
					<div class="news_bok ml0" style="width: 580px;">
						<h2>
							<i></i>${article.bannername } <a href="index/article.action?id=${article.bannerid }">+MORE </a>
						</h2>
						<ul>
							<c:forEach items="${article.articleList}" var="a">
								<li><a href="index/read.action?id=${a.articleid }" title="${a.title }"><var>·${a.title }</var><span>${a.addtime }</span></a></li>
							</c:forEach>
							<li></li>
						</ul>
					</div>
				</c:if>
				<c:if test="${status.count % 2 eq 0 || status.count eq 2}">
					<div class="news_bok ml1" style="width: 580px;">
						<h2>
							<i></i>${article.bannername } <a href="index/article.action?id=${article.bannerid }">+MORE </a>
						</h2>
						<ul>
							<c:forEach items="${article.articleList}" var="a">
								<li><a href="index/read.action?id=${a.articleid }" title="${a.title }"><var>·${a.title }</var><span>${a.addtime }</span></a></li>
							</c:forEach>
							<li></li>
						</ul>
					</div>
					<div class="pict_ad">
						<div class="wid"></div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
