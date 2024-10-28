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
<script type="text/javascript" src="js/topic.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>

	<div class="mainwrapper">
		<div class="maincontent">
			<div class="maincontentinner">
				<div class="widget" style="width: 65%; margin: 0 auto;">
					<h4 class="widgettitle">新增宿舍评分</h4>
					<div class="widgetcontent nopadding">
						<form class="stdform stdform2" method="post" action="topic/addTopic.action" name="myform" method="post">

							<p>
								<label>宿舍</label><span class="field"><select name="roomsid" class="input-xxlarge" style="width: 430px;" id="roomsid"><option
											value="">---请选择宿舍--</option>
										<c:forEach items="${roomsList}" var="rooms">
											<option value="${rooms.roomsid}">${rooms.roomsname }</option>
										</c:forEach></select></span>
							</p>
							<p>
								<label>分数</label><span class="field"><input type="radio" name="num" id="num" value="1"><img
									src="themes/images/stars1.gif" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="num" id="num" value="2"><img
									src="themes/images/stars2.gif" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="num" id="num" value="3"><img
									src="themes/images/stars3.gif" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="num" id="num" value="4"><img
									src="themes/images/stars4.gif" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="num" id="num" value="5" checked><img
									src="themes/images/stars5.gif" /></span>
							</p>
							<p>
								<label>内容</label><span class="field"><input type="text" name="contents" class="input-xxlarge" style="width: 430px;" id="contents"
									placeholder="请输入内容" /></span>
							</p>


							<p class="stdformbutton" align="center">
								<button class="btn btn-primary" type="submit" id="sub">确认保存</button>
								<button type="reset" class="btn" id="res">重新输入</button>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


