<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="main-sidebar">
	<div class="sidebar">
		<ul class="sidebar-menu" id="sidebar-menu">
			<!--<li class="header">导航菜单</li>-->
			<c:if test="${sessionScope.adminname eq 'admin' }">
				<li class="treeview active"><a href="javascript:;"><i class="fa fa-desktop"></i><span>管理员信息</span><i
						class="fa fa-angle-left pull-right"></i></a>
					<ul class="treeview-menu">
						<li><a class="menuItem" href="admin/createAdmin.action"><i class="fa fa-sitemap"></i>新增管理员信息</a></li>
						<li><a class="menuItem" href="admin/getAllAdmin.action"><i class="fa fa-sitemap"></i>管理员信息列表</a></li>
						<li><a class="menuItem" href="admin/queryAdminByCond.action"><i class="fa fa-sitemap"></i>查询管理员</a></li>
					</ul></li>
			</c:if>
			<li class="treeview"><a href="javascript:;"><i class="fa fa-desktop"></i><span>学生用户信息</span><i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="menuItem" href="users/getAllUsers.action"><i class="fa fa-sitemap"></i>学生用户信息列表</a></li>
					<li><a class="menuItem" href="users/queryUsersByCond.action"><i class="fa fa-sitemap"></i>查询学生用户</a></li>
				</ul></li>

			<li class="treeview"><a href="javascript:;"><i class="fa fa-desktop"></i><span>宿舍信息</span><i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="menuItem" href="rooms/createRooms.action"><i class="fa fa-sitemap"></i>新增宿舍信息</a></li>
					<li><a class="menuItem" href="rooms/getAllRooms.action"><i class="fa fa-sitemap"></i>宿舍信息列表</a></li>
					<li><a class="menuItem" href="rooms/queryRoomsByCond.action"><i class="fa fa-sitemap"></i>查询宿舍</a></li>
				</ul></li>
			<li class="treeview"><a href="javascript:;"><i class="fa fa-desktop"></i><span>网站栏目信息</span><i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="menuItem" href="banner/createBanner.action"><i class="fa fa-sitemap"></i>新增网站栏目信息</a></li>
					<li><a class="menuItem" href="banner/getAllBanner.action"><i class="fa fa-sitemap"></i>网站栏目信息列表</a></li>
					<li><a class="menuItem" href="banner/queryBannerByCond.action"><i class="fa fa-sitemap"></i>查询网站栏目</a></li>
				</ul></li>

			<li class="treeview"><a href="javascript:;"><i class="fa fa-desktop"></i><span>网站内容信息</span><i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="menuItem" href="article/createArticle.action"><i class="fa fa-sitemap"></i>新增网站内容信息</a></li>
					<li><a class="menuItem" href="article/getAllArticle.action"><i class="fa fa-sitemap"></i>网站内容信息列表</a></li>
					<li><a class="menuItem" href="article/queryArticleByCond.action"><i class="fa fa-sitemap"></i>查询网站内容</a></li>
				</ul></li>

			<li class="treeview"><a href="javascript:;"><i class="fa fa-desktop"></i><span>学生签到信息</span><i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="menuItem" href="signin/getAllSignin.action"><i class="fa fa-sitemap"></i>学生签到信息列表</a></li>
					<li><a class="menuItem" href="signin/querySigninByCond.action"><i class="fa fa-sitemap"></i>查询学生签到</a></li>
				</ul></li>

			<li class="treeview"><a href="javascript:;"><i class="fa fa-desktop"></i><span>学生奖惩信息</span><i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="menuItem" href="rewards/createRewards.action"><i class="fa fa-sitemap"></i>新增学生奖惩信息</a></li>
					<li><a class="menuItem" href="rewards/getAllRewards.action"><i class="fa fa-sitemap"></i>学生奖惩信息列表</a></li>
					<li><a class="menuItem" href="rewards/queryRewardsByCond.action"><i class="fa fa-sitemap"></i>查询学生奖惩</a></li>
				</ul></li>

			<li class="treeview"><a href="javascript:;"><i class="fa fa-desktop"></i><span>学生报修信息</span><i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="menuItem" href="broken/getAllBroken.action"><i class="fa fa-sitemap"></i>学生报修信息列表</a></li>
					<li><a class="menuItem" href="broken/queryBrokenByCond.action"><i class="fa fa-sitemap"></i>查询学生报修</a></li>
				</ul></li>
			<li class="treeview"><a href="javascript:;"><i class="fa fa-desktop"></i><span>访客登记信息</span><i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="menuItem" href="visit/createVisit.action"><i class="fa fa-sitemap"></i>新增访客登记信息</a></li>
					<li><a class="menuItem" href="visit/getAllVisit.action"><i class="fa fa-sitemap"></i>访客登记信息列表</a></li>
					<li><a class="menuItem" href="visit/queryVisitByCond.action"><i class="fa fa-sitemap"></i>查询访客登记</a></li>
				</ul></li>
			<li class="treeview"><a href="javascript:;"><i class="fa fa-desktop"></i><span>宿舍评分信息</span><i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="menuItem" href="topic/createTopic.action"><i class="fa fa-sitemap"></i>新增宿舍评分信息</a></li>
					<li><a class="menuItem" href="topic/getAllTopic.action"><i class="fa fa-sitemap"></i>宿舍评分信息列表</a></li>
					<li><a class="menuItem" href="topic/queryTopicByCond.action"><i class="fa fa-sitemap"></i>查询宿舍评分</a></li>
				</ul></li>
		</ul>
	</div>
</div>
