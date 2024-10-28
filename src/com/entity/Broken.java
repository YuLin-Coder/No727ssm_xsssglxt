package com.entity;

import com.util.VeDate;

public class Broken {
	private String brokenid = "B" + VeDate.getStringId();// 生成主键编号
	private String bno;// 报修单号
	private String usersid;// 学生
	private String roomsid;// 宿舍
	private String reason;// 原因
	private String addtime;// 日期
	private String status;// 状态
	private String memo;// 备注
	private String username;// 映射数据
	private String roomsname;// 映射数据

	public String getBrokenid() {
		return brokenid;
	}

	public void setBrokenid(String brokenid) {
		this.brokenid = brokenid;
	}

	public String getBno() {
		return this.bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getUsersid() {
		return this.usersid;
	}

	public void setUsersid(String usersid) {
		this.usersid = usersid;
	}

	public String getRoomsid() {
		return this.roomsid;
	}

	public void setRoomsid(String roomsid) {
		this.roomsid = roomsid;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
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

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRoomsname() {
		return this.roomsname;
	}

	public void setRoomsname(String roomsname) {
		this.roomsname = roomsname;
	}

	// 重载方法 生成JSON类型字符串
	@Override
	public String toString() {
		return "Broken [brokenid=" + this.brokenid + ", bno=" + this.bno + ", usersid=" + this.usersid + ", roomsid="
				+ this.roomsid + ", reason=" + this.reason + ", addtime=" + this.addtime + ", status=" + this.status
				+ ", memo=" + this.memo + ", username=" + this.username + ", roomsname=" + this.roomsname + "]";
	}

}
