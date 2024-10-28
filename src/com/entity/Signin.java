package com.entity;

import com.util.VeDate;

public class Signin {
	private String signinid = "S" + VeDate.getStringId();// 生成主键编号
	private String usersid;// 学生用户
	private String roomsid;// 宿舍
	private String addtime;// 日期
	private String realname;// 映射数据
	private String roomsname;// 映射数据

	public String getSigninid() {
		return signinid;
	}

	public void setSigninid(String signinid) {
		this.signinid = signinid;
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

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
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
		return "Signin [signinid=" + this.signinid + ", usersid=" + this.usersid + ", roomsid=" + this.roomsid
				+ ", addtime=" + this.addtime + ", realname=" + this.realname + ", roomsname=" + this.roomsname + "]";
	}

}
