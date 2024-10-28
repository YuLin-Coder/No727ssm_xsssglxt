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
<script type="text/javascript" src="js/rooms.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>

	<div class="mainwrapper">
		<div class="maincontent">
			<div class="maincontentinner">
				<div class="widget" style="width: 65%; margin: 0 auto;">
					<h4 class="widgettitle">编辑宿舍</h4>
					<div class="widgetcontent nopadding">
						<form class="stdform stdform2" method="post" action="rooms/updateRooms.action" name="myform" method="post">

							<p>
								<label>宿舍号</label><span class="field"><input type="text" name="roomsname" class="input-xxlarge" style="width: 430px;"
									id="roomsname" value="${rooms.roomsname}" /></span>
							</p>
							<p>
								<label>床位数</label><span class="field"><input type="text" name="num" class="input-xxlarge" style="width: 430px;" id="num"
									value="${rooms.num}" /></span>
							</p>
							<p>
								<label>宿舍面积</label><span class="field"><input type="text" name="mianji" class="input-xxlarge" style="width: 430px;" id="mianji"
									value="${rooms.mianji}" /></span>
							</p>
							<p>
								<label>朝向</label><span class="field"><input type="text" name="chaoxiang" class="input-xxlarge" style="width: 430px;"
									id="chaoxiang" value="${rooms.chaoxiang}" /></span>
							</p>
							<p>
								<label>负责人</label><span class="field"><select name="adminid" class="input-xxlarge" style="width: 430px;" id="adminid"><c:forEach
											items="${adminList}" var="admin">
											<option value="${admin.adminid}" ${admin.adminid == rooms.adminid?"selected":"" }>${admin.realname }</option>
										</c:forEach></select></span>
							</p>
							<p>
								<label>备注</label><span class="field"><input type="text" name="memo" class="input-xxlarge" style="width: 430px;" id="memo"
									value="${rooms.memo}" /></span>
							</p>

							<p class="stdformbutton" align="center">
								<input type="hidden" name="roomsid" id="roomsid" value="${rooms.roomsid}" /><input type="hidden" name="addtime" id="addtime"
									value="${rooms.addtime}" />

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


