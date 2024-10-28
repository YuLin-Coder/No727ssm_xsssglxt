<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>${title}</title>
<script type='text/javascript' src='<%=basePath%>My97DatePicker/WdatePicker.js' charset='utf-8'></script>
<script type='text/javascript' src='themes/cms_red1/js/jq.js'></script>
<script type='text/javascript' src='js/selimage.js' charset='utf-8'></script>
<script type='text/javascript' src='js/Goods.js' charset='utf-8'></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class='main wid'>
		<div class='center_layout'>
			<h2>
				<span><i></i>学生报修</span>
				<p>
					<i></i>当前位置：<a href='index/index.action' style='color: #FFFFFF'>网站首页</a> > 学生报修
				</p>
			</h2>
			<div class='ne-tline none both'></div>
			<div class='ne-txt'>
				<div class='ne-form' align='center'>
					<form action='index/addBroken.action' name='myform' method='post'>
						<table width='66%' border='0' cellpadding='5' cellspacing='1' bgcolor='#E0EDB7'>
							<tr>
								<td height='30' colspan='2' align='center' background='themes/cms_red1/images/bg.png' class='white14B'>产品</td>
							</tr>

							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">报修单号：</td>
								<td bgcolor="#FFFFFF"><input type="text" name="bno" style="width: 260px; height: 30px" required="required" id="bno" value="${bno }"
									readonly="readonly" /></td>
							</tr>
							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">故障原因：</td>
								<td bgcolor="#FFFFFF"><input type="text" name="reason" style="width: 260px; height: 30px" required="required" id="reason"
									placeholder="请输入故障原因" /></td>
							</tr>
							<tr>
								<td height="50" align="right" bgcolor="#FFFFFF">备注：</td>
								<td bgcolor="#FFFFFF"><input type="text" name="memo" style="width: 260px; height: 30px" required="required" id="memo"
									placeholder="请输入备注" /></td>
							</tr>

							<tr>
								<td bgcolor='#FFFFFF' colspan='2' align='center'><label> <input type='submit' name='Submit' value='提交' />
										&nbsp;&nbsp;&nbsp;&nbsp; <input type='reset' name='Submit2' value='重置' />
								</label></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
