<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%><!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>欢迎使用学生宿舍管理系统</title>
<link rel="stylesheet" href="asset/page/css/style.default.css" type="text/css" />
<link rel="stylesheet" href="asset/page/css/responsive-tables.css">
<script type="text/javascript" src="asset/page/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="asset/page/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="mainwrapper">
		<div class="maincontent">
			<div class="maincontentinner">
				<h4 class="widgettitle">学生奖惩查询</h4>
				<table id="dyntable" class="table table-bordered responsive">

					<thead>
						<tr>
							<th style="text-align: center;">&nbsp;</th>
							<th style="text-align: center;">宿舍</th>
							<th style="text-align: center;">学生</th>
							<th style="text-align: center;">类型</th>
							<th style="text-align: center;">原因</th>
							<th style="text-align: center;">处理意见</th>
							<th style="text-align: center;">日期</th>
							<th style="text-align: center;">经手人</th>
							<th style="text-align: center;">备注</th>
						</tr>
					</thead>
					<c:forEach items="${rewardsList}" var="rewards">
						<tr style="text-align: center;">
							<td style="text-align: center;">&nbsp;</td>
							<td style="text-align: center;">${rewards.roomsname}</td>
							<td style="text-align: center;">${rewards.username}</td>
							<td style="text-align: center;">${rewards.cate}</td>
							<td style="text-align: center;">${rewards.reason}</td>
							<td style="text-align: center;">${rewards.ideas}</td>
							<td style="text-align: center;">${rewards.addtime}</td>
							<td style="text-align: center;">${rewards.realname}</td>
							<td style="text-align: center;">${rewards.memo}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="dataTables_info" id="dyntable_info" style="text-align: right;">
					<form action="rewards/queryRewardsByCond.action" name="myform" method="post">
						查询条件: <select name="cond" style="width: 100px">
							<option value="roomsid">按宿舍查询</option>
							<option value="usersid">按学生查询</option>
							<option value="cate">按类型查询</option>
							<option value="reason">按原因查询</option>
							<option value="ideas">按处理意见查询</option>
							<option value="addtime">按日期查询</option>
							<option value="adminid">按经手人查询</option>
							<option value="memo">按备注查询</option>
						</select> &nbsp;&nbsp;&nbsp; 关键字: <input type="text" name="name" required style="width: 100px" />&nbsp;&nbsp;&nbsp; <input type="submit"
							value="查询" class="mws-button green" /> ${html }
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

