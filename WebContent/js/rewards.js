$(function() {

$("#roomsid").blur(
		function() {
			$("#roomsid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#roomsid").after("<span id='roomsid_msg' style='color: red'>宿舍不能为空</span>");
			}
	});

$("#usersid").blur(
		function() {
			$("#usersid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#usersid").after("<span id='usersid_msg' style='color: red'>学生不能为空</span>");
			}
	});

$("#reason").blur(
		function() {
			$("#reason_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#reason").after("<span id='reason_msg' style='color: red'>原因不能为空</span>");
			}
	});

$("#ideas").blur(
		function() {
			$("#ideas_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#ideas").after("<span id='ideas_msg' style='color: red'>处理意见不能为空</span>");
			}
	});

$("#adminid").blur(
		function() {
			$("#adminid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#adminid").after("<span id='adminid_msg' style='color: red'>经手人不能为空</span>");
			}
	});

$("#memo").blur(
		function() {
			$("#memo_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#memo").after("<span id='memo_msg' style='color: red'>备注不能为空</span>");
			}
	});







$('#sub').click(function(){
var roomsid = $("#roomsid").val();
var usersid = $("#usersid").val();
var reason = $("#reason").val();
var ideas = $("#ideas").val();
var adminid = $("#adminid").val();
var memo = $("#memo").val();
$("#roomsid_msg").empty();
$("#usersid_msg").empty();
$("#reason_msg").empty();
$("#ideas_msg").empty();
$("#adminid_msg").empty();
$("#memo_msg").empty();
if (roomsid == "" || roomsid == null) {
	$("#roomsid").after("<span id='roomsid_msg' style='color: red'>宿舍不能为空</span>");
	return false;
}
if (usersid == "" || usersid == null) {
	$("#usersid").after("<span id='usersid_msg' style='color: red'>学生不能为空</span>");
	return false;
}
if (reason == "" || reason == null) {
	$("#reason").after("<span id='reason_msg' style='color: red'>原因不能为空</span>");
	return false;
}
if (ideas == "" || ideas == null) {
	$("#ideas").after("<span id='ideas_msg' style='color: red'>处理意见不能为空</span>");
	return false;
}
if (adminid == "" || adminid == null) {
	$("#adminid").after("<span id='adminid_msg' style='color: red'>经手人不能为空</span>");
	return false;
}
if (memo == "" || memo == null) {
	$("#memo").after("<span id='memo_msg' style='color: red'>备注不能为空</span>");
	return false;
}
});
$('#res').click(function() {
$("#roomsid_msg").empty();
$("#usersid_msg").empty();
$("#reason_msg").empty();
$("#ideas_msg").empty();
$("#adminid_msg").empty();
$("#memo_msg").empty();
});

});
