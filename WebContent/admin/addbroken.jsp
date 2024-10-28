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
<script type="text/javascript" src="js/broken.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>

	<div class="mainwrapper">
		<div class="maincontent">
			<div class="maincontentinner">
				<div class="widget" style="width: 65%; margin: 0 auto;">
					<h4 class="widgettitle">新增学生报修</h4>
					<div class="widgetcontent nopadding">
						<form class="stdform stdform2" method="post" action="broken/addBroken.action" name="myform" method="post">

							<p>
								<label>报修单号</label><span class="field"><input type="text" name="bno" class="input-xxlarge" style="width: 430px;" id="bno"
									placeholder="请输入报修单号" /></span>
							</p>
							<p>
								<label>原因</label><span class="field"><input type="text" name="reason" class="input-xxlarge" style="width: 430px;" id="reason"
									placeholder="请输入原因" /></span>
							</p>
							<p>
								<label>备注</label><span class="field"><input type="text" name="memo" class="input-xxlarge" style="width: 430px;" id="memo"
									placeholder="请输入备注" /></span>
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


