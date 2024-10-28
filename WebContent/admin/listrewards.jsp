<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用后台管理系统</title>
<link rel="stylesheet" href="asset/page/css/style.default.css" type="text/css" />
<link rel="stylesheet" href="asset/page/css/responsive-tables.css">
<script type="text/javascript" src="asset/page/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="asset/page/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="mainwrapper">
		<div class="maincontent">
			<div class="maincontentinner">
				<h4 class="widgettitle">学生奖惩列表</h4>
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
							<th style="text-align: center;">操作</th>
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
							<td style="text-align: center;"><a href="rewards/getRewardsById.action?id=${rewards.rewardsid}">编辑</a>&nbsp;&nbsp;<a
								href="rewards/deleteRewards.action?id=${rewards.rewardsid}" onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">删除</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="dataTables_info" id="dyntable_info" style="text-align: right;">${html }</div>
			</div>
		</div>
	</div>
</body>
</html>

