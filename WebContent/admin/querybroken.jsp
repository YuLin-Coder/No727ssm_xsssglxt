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
				<h4 class="widgettitle">学生报修查询</h4>
				<table id="dyntable" class="table table-bordered responsive">

					<thead>
						<tr>
							<th style="text-align: center;">&nbsp;</th>
							<th style="text-align: center;">报修单号</th>
							<th style="text-align: center;">学生</th>
							<th style="text-align: center;">宿舍</th>
							<th style="text-align: center;">原因</th>
							<th style="text-align: center;">日期</th>
							<th style="text-align: center;">状态</th>
							<th style="text-align: center;">备注</th>
						</tr>
					</thead>
					<c:forEach items="${brokenList}" var="broken">
						<tr style="text-align: center;">
							<td style="text-align: center;">&nbsp;</td>
							<td style="text-align: center;">${broken.bno}</td>
							<td style="text-align: center;">${broken.username}</td>
							<td style="text-align: center;">${broken.roomsname}</td>
							<td style="text-align: center;">${broken.reason}</td>
							<td style="text-align: center;">${broken.addtime}</td>
							<td style="text-align: center;">${broken.status}</td>
							<td style="text-align: center;">${broken.memo}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="dataTables_info" id="dyntable_info" style="text-align: right;">
					<form action="broken/queryBrokenByCond.action" name="myform" method="post">
						查询条件: <select name="cond" style="width: 100px">
							<option value="bno">按报修单号查询</option>
							<option value="usersid">按学生查询</option>
							<option value="roomsid">按宿舍查询</option>
							<option value="reason">按原因查询</option>
							<option value="addtime">按日期查询</option>
							<option value="status">按状态查询</option>
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

