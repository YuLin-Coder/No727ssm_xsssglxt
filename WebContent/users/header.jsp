<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String path = request.getContextPath(); String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";%>
<link rel='stylesheet' href='themes/cms_red1/css/style_new.css' type='text/css'>
<!--页面CSS-->
<!--<link rel='stylesheet' href='css/animate.min.css' type='text/css'>-->
<!--CSS3动画-->
<script type='text/javascript' src='themes/cms_red1/js/jq.js'></script>
<script src='themes/cms_red1/js/type.js'></script>
<div class='top'></div>
<!--top-->
<div class='menu'>
	<div class='wid'>
		<ul>
			<li><a href='index/index.action'>网站首页</a></li>
			<c:forEach items='${bannerList}' var='banner'>
				<li id='nav1'><a href='index/article.action?id=${banner.bannerid}'>${banner.bannername }</a></li>
			</c:forEach>
			<c:if test='${sessionScope.userid != null }'>
				<li id='nav9'><a href='javasrcipt:void(0);'>用户菜单</a>
					<div class='sub-menu'>
						<a href='index/prePwd.action' style='font-family: "新宋体"'>修改密码</a> 
						<a href='index/userinfo.action' style='font-family: "新宋体"'>学生信息</a>
						<a href='index/preBroken.action' style='font-family: "新宋体"'>学生报修</a>
						<a href='index/myBroken.action' style='font-family: "新宋体"'>我的报修</a>
						<a href='index/myRewards.action' style='font-family: "新宋体"'>我的奖惩</a>
						<a href='index/mySignin.action' style='font-family: "新宋体"'>学生签到</a>
						<a href='index/myVisit.action' style='font-family: "新宋体"'>我的访客</a>
						<a href='index/myTopic.action' style='font-family: "新宋体"'>宿舍评分</a>
					</div></li>
				<li id='nav10'><a href='index/exit.action'>退出登录</a></li>
			</c:if>
			<c:if test='${sessionScope.userid == null }'>
				<li id='nav9'><a href='index/preReg.action'>学生注册</a></li>
				<li id='nav10'><a href='index/preLogin.action'>学生登录</a></li>
			</c:if>
		</ul>
	</div>
</div>

