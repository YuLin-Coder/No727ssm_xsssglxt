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
<link rel="stylesheet" href="asset/page/css/bootstrap-fileupload.min.css" type="text/css" />
<script type="text/javascript" src="asset/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>

	<div class="mainwrapper">
		<div class="maincontent">
			<div class="maincontentinner">
				<div class="widget" style="width: 99%; margin: 0 auto;">
					<h4 class="widgettitle">导入学生用户</h4>
					<div class="widgetcontent nopadding">
						<form class="stdform stdform2" method="post" action="users/addUsers.action" name="myform" method="post">
							<p>
								<label>文件</label><span class="field"><input class="input-xxlarge" style="width: 230px;" type="text" name="image" id="image"
									onclick="selimage();" placeholder="请选择文件" readonly="readonly" /></span>
							</p>
							<p class="stdformbutton" align="center">
								<button class="btn btn-primary" type="button" id="btn">确认保存</button>
							</p>
						</form>
						<input type="hidden" name="basepath" value="<%=basePath%>">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#btn').click(function() {
			var loc = $("input[name='basepath']").val();
			var image = $("input[name='image']").val();
			var url = loc + "users/batchUsers.action?url=" + image;
			$.ajax({
				type : "post",
				url : url,
				dataType : "json",
				success : function(json) {
					console.log(json.count);
					if (json.count > 0) {
						alert('导入成功');
						var index = parent.layer.getFrameIndex(window.name);
						parent.location.reload();
						parent.layer.close(index);
					} else {
						alert('导入失败请重试');
					}
				}
			});
		})
	</script>
</body>
</html>


