package com.entity;

import com.util.VeDate;

public class Rewards {
	private String rewardsid = "R" + VeDate.getStringId();// 生成主键编号
	private String roomsid;// 宿舍
	private String usersid;// 学生
	private String cate;// 类型
	private String reason;// 原因
	private String ideas;// 处理意见
	private String addtime;// 日期
	private String adminid;// 经手人
	private String memo;// 备注
	private String roomsname;// 映射数据
	private String username;// 映射数据
	private String realname;// 映射数据

	public String getRewardsid() {
		return rewardsid;
	}

	public void setRewardsid(String rewardsid) {
		this.rewardsid = rewardsid;
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

	public String getCate() {
		return this.cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getIdeas() {
		return this.ideas;
	}

	public void setIdeas(String ideas) {
		this.ideas = ideas;
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

	public String getRoomsname() {
		return this.roomsname;
	}

	public void setRoomsname(String roomsname) {
		this.roomsname = roomsname;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
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
		return "Rewards [rewardsid=" + this.rewardsid + ", roomsid=" + this.roomsid + ", usersid=" + this.usersid
				+ ", cate=" + this.cate + ", reason=" + this.reason + ", ideas=" + this.ideas + ", addtime="
				+ this.addtime + ", adminid=" + this.adminid + ", memo=" + this.memo + ", roomsname=" + this.roomsname
				+ ", username=" + this.username + ", realname=" + this.realname + "]";
	}

}
