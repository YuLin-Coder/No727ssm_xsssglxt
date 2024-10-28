package com.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.entity.Topic;
import com.service.TopicService;
import com.entity.Rooms;
import com.service.RoomsService;
import com.util.PageHelper;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/topic", produces = "text/plain;charset=utf-8")
public class TopicController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private TopicService topicService;
	@Autowired
	private RoomsService roomsService;

	// 准备添加数据
	@RequestMapping("createTopic.action")
	public String createTopic() {
		String adminid = (String) this.getSession().getAttribute("adminid");
		Rooms rooms = new Rooms();
		rooms.setAdminid(adminid);
		List<Rooms> roomsList = this.roomsService.getRoomsByCond(rooms);
		this.getRequest().setAttribute("roomsList", roomsList);
		return "admin/addtopic";
	}

	// 添加数据
	@RequestMapping("addTopic.action")
	public String addTopic(Topic topic) {
		topic.setAddtime(VeDate.getStringDateShort());
		this.topicService.insertTopic(topic);
		return "redirect:/topic/createTopic.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteTopic.action")
	public String deleteTopic(String id) {
		this.topicService.deleteTopic(id);
		return "redirect:/topic/getAllTopic.action";
	}

	// 批量删除数据
	@RequestMapping("deleteTopicByIds.action")
	public String deleteTopicByIds() {
		String[] ids = this.getRequest().getParameterValues("topicid");
		if (ids != null) {
			for (String topicid : ids) {
				this.topicService.deleteTopic(topicid);
			}
		}
		return "redirect:/topic/getAllTopic.action";
	}

	// 更新数据
	@RequestMapping("updateTopic.action")
	public String updateTopic(Topic topic) {
		this.topicService.updateTopic(topic);
		return "redirect:/topic/getAllTopic.action";
	}

	// 显示全部数据
	@RequestMapping("getAllTopic.action")
	public String getAllTopic(String number) {
		List<Topic> topicList = this.topicService.getAllTopic();
		PageHelper.getUserPage(topicList, "topic", "getAllTopic", 10, number, this.getRequest());
		return "admin/listtopic";
	}
	@RequestMapping("getMyTopic.action")
	public String getMyTopic(String number) {
		List<Topic> topicList = this.topicService.getAllTopic();
		PageHelper.getUserPage(topicList, "topic", "getMyTopic", 10, number, this.getRequest());
		return "admin/xlisttopic";
	}
	

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryTopicByCond.action")
	public String queryTopicByCond(String cond, String name, String number) {
		Topic topic = new Topic();
		if (cond != null) {
			if ("roomsid".equals(cond)) {
				topic.setRoomsid(name);
			}
			if ("num".equals(cond)) {
				topic.setNum(name);
			}
			if ("contents".equals(cond)) {
				topic.setContents(name);
			}
			if ("addtime".equals(cond)) {
				topic.setAddtime(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.topicService.getTopicByLike(topic), "topic", nameList, valueList, 10, number,
				this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/querytopic";
	}

	// 按主键查询数据
	@RequestMapping("getTopicById.action")
	public String getTopicById(String id) {
		Topic topic = this.topicService.getTopicById(id);
		this.getRequest().setAttribute("topic", topic);
		List<Rooms> roomsList = this.roomsService.getAllRooms();
		this.getRequest().setAttribute("roomsList", roomsList);
		return "admin/edittopic";
	}

}
