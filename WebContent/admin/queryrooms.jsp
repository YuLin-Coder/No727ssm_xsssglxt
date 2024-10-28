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
				<h4 class="widgettitle">宿舍查询</h4>
				<table id="dyntable" class="table table-bordered responsive">

					<thead>
						<tr>
							<th style="text-align: center;">&nbsp;</th>
							<th style="text-align: center;">宿舍号</th>
							<th style="text-align: center;">床位数</th>
							<th style="text-align: center;">宿舍面积</th>
							<th style="text-align: center;">朝向</th>
							<th style="text-align: center;">创建日期</th>
							<th style="text-align: center;">负责人</th>
							<th style="text-align: center;">备注</th>
						</tr>
					</thead>
					<c:forEach items="${roomsList}" var="rooms">
						<tr style="text-align: center;">
							<td style="text-align: center;">&nbsp;</td>
							<td style="text-align: center;">${rooms.roomsname}</td>
							<td style="text-align: center;">${rooms.num}</td>
							<td style="text-align: center;">${rooms.mianji}</td>
							<td style="text-align: center;">${rooms.chaoxiang}</td>
							<td style="text-align: center;">${rooms.addtime}</td>
							<td style="text-align: center;">${rooms.realname}</td>
							<td style="text-align: center;">${rooms.memo}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="dataTables_info" id="dyntable_info" style="text-align: right;">
					<form action="rooms/queryRoomsByCond.action" name="myform" method="post">
						查询条件: <select name="cond" style="width: 100px">
							<option value="roomsname">按宿舍号查询</option>
							<option value="num">按床位数查询</option>
							<option value="mianji">按宿舍面积查询</option>
							<option value="chaoxiang">按朝向查询</option>
							<option value="addtime">按创建日期查询</option>
							<option value="adminid">按负责人查询</option>
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

