$(function() {

$("#usersid").blur(
		function() {
			$("#usersid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#usersid").after("<span id='usersid_msg' style='color: red'>学生用户不能为空</span>");
			}
	});

$("#roomsid").blur(
		function() {
			$("#roomsid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#roomsid").after("<span id='roomsid_msg' style='color: red'>宿舍不能为空</span>");
			}
	});







$('#sub').click(function(){
var usersid = $("#usersid").val();
var roomsid = $("#roomsid").val();
$("#usersid_msg").empty();
$("#roomsid_msg").empty();
if (usersid == "" || usersid == null) {
	$("#usersid").after("<span id='usersid_msg' style='color: red'>学生用户不能为空</span>");
	return false;
}
if (roomsid == "" || roomsid == null) {
	$("#roomsid").after("<span id='roomsid_msg' style='color: red'>宿舍不能为空</span>");
	return false;
}
});
$('#res').click(function() {
$("#usersid_msg").empty();
$("#roomsid_msg").empty();
});

});
