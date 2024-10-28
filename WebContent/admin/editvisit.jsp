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
<script type="text/javascript" src="js/visit.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>

	<div class="mainwrapper">
		<div class="maincontent">
			<div class="maincontentinner">
				<div class="widget" style="width: 65%; margin: 0 auto;">
					<h4 class="widgettitle">编辑访客登记</h4>
					<div class="widgetcontent nopadding">
						<form class="stdform stdform2" method="post" action="visit/updateVisit.action" name="myform" method="post">

							<p>
								<label>宿舍</label><span class="field"><select name="roomsid" class="input-xxlarge" style="width: 430px;" id="roomsid"><c:forEach
											items="${roomsList}" var="rooms">
											<option value="${rooms.roomsid}" ${rooms.roomsid == visit.roomsid?"selected":"" }>${rooms.roomsname }</option>
										</c:forEach></select></span>
							</p>
							<p>
								<label>学生</label><span class="field"><select name="usersid" class="input-xxlarge" style="width: 430px;" id="usersid"><c:forEach
											items="${usersList}" var="users">
											<option value="${users.usersid}" ${users.usersid == visit.usersid?"selected":"" }>${users.realname }</option>
										</c:forEach></select></span>
							</p>
							<p>
								<label>访客姓名</label><span class="field"><input type="text" name="name" class="input-xxlarge" style="width: 430px;" id="name"
									value="${visit.name}" /></span>
							</p>
							<p>
								<label>来访原因</label><span class="field"><input type="text" name="reason" class="input-xxlarge" style="width: 430px;" id="reason"
									value="${visit.reason}" /></span>
							</p>
							<p>
								<label>备注</label><span class="field"><input type="text" name="memo" class="input-xxlarge" style="width: 430px;" id="memo"
									value="${visit.memo}" /></span>
							</p>

							<p class="stdformbutton" align="center">
								<input type="hidden" name="visitid" id="visitid" value="${visit.visitid}" /><input type="hidden" name="thestart" id="thestart"
									value="${visit.thestart}" /> <input type="hidden" name="theend" id="theend" value="${visit.theend}" /> <input type="hidden"
									name="status" id="status" value="${visit.status}" />

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


