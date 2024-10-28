<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link rel="stylesheet" href="asset/layui/css/layui.css">
<script type="text/javascript" src="asset/layui/layui.js"></script>
<script type="text/javascript" src="asset/layui/tool.js"></script>
</head>
<body>
	<div class="mainwrapper">
		<div class="maincontent">
			<div class="maincontentinner">
				<div class="dataTables_info">
					<a class="btn btn-small btn-primary" onclick="openForm('导入宿舍信息','rooms/createRoom.action')" title="导入宿舍信息"><i class="layui-icon">&#xe67c;</i>
						数据导入</a> <a class="btn btn-small btn-info" href="${url }"><i class="layui-icon">&#xe601;</i> 数据导出</a>
				</div>
				<h4 class="widgettitle">宿舍列表</h4>
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
							<th style="text-align: center;">操作</th>
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
							<td style="text-align: center;"><a href="rooms/getRoomsById.action?id=${rooms.roomsid}">编辑</a>&nbsp;&nbsp;<a
								href="rooms/deleteRooms.action?id=${rooms.roomsid}" onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">删除</a></td>
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

