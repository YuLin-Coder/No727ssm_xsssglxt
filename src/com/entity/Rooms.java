package com.entity;

import com.util.VeDate;

public class Rooms {
	private String roomsid = "R" + VeDate.getStringId();// 生成主键编号
	private String roomsname;// 宿舍号
	private String num;// 床位数
	private String mianji;// 宿舍面积
	private String chaoxiang;// 朝向
	private String addtime;// 创建日期
	private String adminid;// 负责人
	private String memo;// 备注
	private String realname;// 映射数据

	public String getRoomsid() {
		return roomsid;
	}

	public void setRoomsid(String roomsid) {
		this.roomsid = roomsid;
	}

	public String getRoomsname() {
		return this.roomsname;
	}

	public void setRoomsname(String roomsname) {
		this.roomsname = roomsname;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getMianji() {
		return this.mianji;
	}

	public void setMianji(String mianji) {
		this.mianji = mianji;
	}

	public String getChaoxiang() {
		return this.chaoxiang;
	}

	public void setChaoxiang(String chaoxiang) {
		this.chaoxiang = chaoxiang;
	}

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getAdminid() {
		return this.adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
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
		return "Rooms [roomsid=" + this.roomsid + ", roomsname=" + this.roomsname + ", num=" + this.num + ", mianji="
				+ this.mianji + ", chaoxiang=" + this.chaoxiang + ", addtime=" + this.addtime + ", adminid="
				+ this.adminid + ", memo=" + this.memo + ", realname=" + this.realname + "]";
	}

}
