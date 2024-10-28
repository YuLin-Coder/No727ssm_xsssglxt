package com.entity;

import com.util.VeDate;

public class Visit {
	private String visitid = "V" + VeDate.getStringId();// 生成主键编号
	private String roomsid;// 宿舍
	private String usersid;// 学生
	private String name;// 访客姓名
	private String reason;// 来访原因
	private String thestart;// 开始时间
	private String theend;// 结束时间
	private String status;// 状态
	private String memo;// 备注
	private String roomsname;// 映射数据
	private String realname;// 映射数据
	private String employid;
	private String adminid;

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getEmployid() {
		return employid;
	}

	public void setEmployid(String employid) {
		this.employid = employid;
	}

	public String getVisitid() {
		return visitid;
	}

	public void setVisitid(String visitid) {
		this.visitid = visitid;
	}

	public String getRoomsid() {
		return this.roomsid;
	}

	public void setRoomsid(String roomsid) {
		this.roomsid = roomsid;
	}

	public String getUsersid() {
		return this.usersid;
	}

	public void setUsersid(String usersid) {
		this.usersid = usersid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getThestart() {
		return this.thestart;
	}

	public void setThestart(String thestart) {
		this.thestart = thestart;
	}

	public String getTheend() {
		return this.theend;
	}

	public void setTheend(String theend) {
		this.theend = theend;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getRoomsname() {
		return this.roomsname;
	}

	public void setRoomsname(String roomsname) {
		this.roomsname = roomsname;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	// 重载方法 生成JSON类型字符串
	@Override
	public String toString() {
		return "Visit [visitid=" + this.visitid + ", roomsid=" + this.roomsid + ", usersid=" + this.usersid + ", name="
				+ this.name + ", reason=" + this.reason + ", thestart=" + this.thestart + ", theend=" + this.theend
				+ ", status=" + this.status + ", memo=" + this.memo + ", roomsname=" + this.roomsname + ", realname="
				+ this.realname + "]";
	}

}
