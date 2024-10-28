package com.entity;

import com.util.VeDate;

public class Topic {
	private String topicid = "T" + VeDate.getStringId();// 生成主键编号
	private String roomsid;// 宿舍
	private String num;// 分数
	private String contents;// 内容
	private String addtime;// 日期
	private String roomsname;// 映射数据
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

	public String getTopicid() {
		return topicid;
	}

	public void setTopicid(String topicid) {
		this.topicid = topicid;
	}

	public String getRoomsid() {
		return this.roomsid;
	}

	public void setRoomsid(String roomsid) {
		this.roomsid = roomsid;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getContents() {
		return this.contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
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
		return "Topic [topicid=" + this.topicid + ", roomsid=" + this.roomsid + ", num=" + this.num + ", contents="
				+ this.contents + ", addtime=" + this.addtime + ", roomsname=" + this.roomsname + "]";
	}

}
