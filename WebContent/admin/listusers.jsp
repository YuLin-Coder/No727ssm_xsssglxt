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
					<a class="btn btn-small btn-primary" onclick="openForm('导入学生信息','users/createUsers.action','',260)" title="导入学生信息"><i
						class="layui-icon">&#xe67c;</i> 数据导入</a> <a class="btn btn-small btn-info" href="${url }"><i class="layui-icon">&#xe601;</i> 数据导出</a>
				</div>
				<h4 class="widgettitle">学生用户列表</h4>
				<table id="dyntable" class="table table-bordered responsive">
					<thead>
						<tr>
							<th style="text-align: center;">&nbsp;</th>
							<th style="text-align: center;">用户名</th>
							<th style="text-align: center;">姓名</th>
							<th style="text-align: center;">性别</th>
							<th style="text-align: center;">出生日期</th>
							<th style="text-align: center;">联系方式</th>
							<th style="text-align: center;">电子邮件</th>
							<th style="text-align: center;">所在宿舍</th>
							<th style="text-align: center;">状态</th>
							<th style="text-align: center;">注册日期</th>
							<th style="text-align: center;">操作</th>
						</tr>
					</thead>
					<c:forEach items="${usersList}" var="users">
						<tr style="text-align: center;">
							<td style="text-align: center;">&nbsp;</td>
							<td style="text-align: center;">${users.username}</td>
							<td style="text-align: center;">${users.realname}</td>
							<td style="text-align: center;">${users.sex}</td>
							<td style="text-align: center;">${users.birthday}</td>
							<td style="text-align: center;">${users.contact}</td>
							<td style="text-align: center;">${users.email}</td>
							<td style="text-align: center;">${users.roomsname}</td>
							<td style="text-align: center;">${users.status}</td>
							<td style="text-align: center;">${users.regdate}</td>
							<td style="text-align: center;"><a href="users/status.action?id=${users.usersid}">${users.status == "解锁"?"锁定":"解锁"}</a>&nbsp;&nbsp;<a
								href="users/getUsersById.action?id=${users.usersid}">编辑</a>&nbsp;&nbsp;<a href="users/deleteUsers.action?id=${users.usersid}"
								onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">删除</a></td>
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

