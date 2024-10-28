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
<link rel="stylesheet" href="asset/page/css/bootstrap-fileupload.min.css" type="text/css" />
<script type="text/javascript" src="asset/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/users.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>

	<div class="mainwrapper">
		<div class="maincontent">
			<div class="maincontentinner">
				<div class="widget" style="width: 65%; margin: 0 auto;">
					<h4 class="widgettitle">编辑学生用户</h4>
					<div class="widgetcontent nopadding">
						<form class="stdform stdform2" method="post" action="users/updateUsers.action" name="myform" method="post">

							<p>
								<label>用户名</label><span class="field"><input type="text" name="username" class="input-xxlarge" style="width: 430px;"
									id="username" value="${users.username}" readonly="readonly" /></span>
							</p>
							<p>
								<label>姓名</label><span class="field"><input type="text" name="realname" class="input-xxlarge" style="width: 430px;" id="realname"
									value="${users.realname}" /></span>
							</p>
							<p>
								<label>性别</label><span class="field"><input type="radio" name="sex" value="男" title="男" ${users.sex == "男"?"checked":""}>男
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女" title="女" ${users.sex == "女"?"checked":""}>女</span>
							</p>
							<p>
								<label>出生日期</label><span class="field"><input type="text" name="birthday" class="input-xxlarge" style="width: 430px;"
									id="birthday" value="${users.birthday}" onclick="WdatePicker()" readonly="readonly" /></span>
							</p>
							<p>
								<label>联系方式</label><span class="field"><input type="text" name="contact" class="input-xxlarge" style="width: 430px;" id="contact"
									value="${users.contact}" /></span>
							</p>
							<p>
								<label>电子邮件</label><span class="field"><input type="text" name="email" class="input-xxlarge" style="width: 430px;" id="email"
									value="${users.email}" /></span>
							</p>
							<p>
								<label>所在宿舍</label><span class="field"><select name="roomsid" class="input-xxlarge" style="width: 430px;" id="roomsid"><c:forEach
											items="${roomsList}" var="rooms">
											<option value="${rooms.roomsid}" ${rooms.roomsid == users.roomsid?"selected":"" }>${rooms.roomsname }</option>
										</c:forEach></select></span>
							</p>

							<p class="stdformbutton" align="center">
								<input type="hidden" name="usersid" id="usersid" value="${users.usersid}" /><input type="hidden" name="password" id="password"
									value="${users.password}" /> <input type="hidden" name="status" id="status" value="${users.status}" /> <input type="hidden"
									name="regdate" id="regdate" value="${users.regdate}" />

								<button class="btn btn-primary" type="submit" id="sub">确认保存</button>
								<button type="reset" class="btn">重新输入</button>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


