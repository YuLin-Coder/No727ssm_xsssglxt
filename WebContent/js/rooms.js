$(function() {

$("#roomsname").blur(
		function() {
			$("#roomsname_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#roomsname").after("<span id='roomsname_msg' style='color: red'>宿舍号不能为空</span>");
			}
	});

$("#num").blur(
		function() {
			$("#num_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#num").after("<span id='num_msg' style='color: red'>床位数不能为空</span>");
			}
	});

$("#mianji").blur(
		function() {
			$("#mianji_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#mianji").after("<span id='mianji_msg' style='color: red'>宿舍面积不能为空</span>");
			}
	});

$("#chaoxiang").blur(
		function() {
			$("#chaoxiang_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#chaoxiang").after("<span id='chaoxiang_msg' style='color: red'>朝向不能为空</span>");
			}
	});

$("#adminid").blur(
		function() {
			$("#adminid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#adminid").after("<span id='adminid_msg' style='color: red'>负责人不能为空</span>");
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
var roomsname = $("#roomsname").val();
var num = $("#num").val();
var mianji = $("#mianji").val();
var chaoxiang = $("#chaoxiang").val();
var adminid = $("#adminid").val();
var memo = $("#memo").val();
$("#roomsname_msg").empty();
$("#num_msg").empty();
$("#mianji_msg").empty();
$("#chaoxiang_msg").empty();
$("#adminid_msg").empty();
$("#memo_msg").empty();
if (roomsname == "" || roomsname == null) {
	$("#roomsname").after("<span id='roomsname_msg' style='color: red'>宿舍号不能为空</span>");
	return false;
}
if (num == "" || num == null) {
	$("#num").after("<span id='num_msg' style='color: red'>床位数不能为空</span>");
	return false;
}
if (mianji == "" || mianji == null) {
	$("#mianji").after("<span id='mianji_msg' style='color: red'>宿舍面积不能为空</span>");
	return false;
}
if (chaoxiang == "" || chaoxiang == null) {
	$("#chaoxiang").after("<span id='chaoxiang_msg' style='color: red'>朝向不能为空</span>");
	return false;
}
if (adminid == "" || adminid == null) {
	$("#adminid").after("<span id='adminid_msg' style='color: red'>负责人不能为空</span>");
	return false;
}
if (memo == "" || memo == null) {
	$("#memo").after("<span id='memo_msg' style='color: red'>备注不能为空</span>");
	return false;
}
});
$('#res').click(function() {
$("#roomsname_msg").empty();
$("#num_msg").empty();
$("#mianji_msg").empty();
$("#chaoxiang_msg").empty();
$("#adminid_msg").empty();
$("#memo_msg").empty();
});

});
