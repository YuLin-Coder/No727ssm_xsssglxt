package com.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.entity.Visit;
import com.service.VisitService;
import com.entity.Rooms;
import com.entity.Users;
import com.service.RoomsService;
import com.service.UsersService;
import com.util.PageHelper;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/visit", produces = "text/plain;charset=utf-8")
public class VisitController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private VisitService visitService;
	@Autowired
	private RoomsService roomsService;
	@Autowired
	private UsersService usersService;

	// 准备添加数据
	@RequestMapping("createVisit.action")
	public String createVisit() {
		String adminid = (String) this.getSession().getAttribute("adminid");
		Rooms rooms = new Rooms();
		rooms.setAdminid(adminid);
		List<Rooms> roomsList = this.roomsService.getRoomsByCond(rooms);
		this.getRequest().setAttribute("roomsList", roomsList);
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		return "admin/addvisit";
	}

	// 添加数据
	@RequestMapping("addVisit.action")
	public String addVisit(Visit visit) {
		visit.setThestart(VeDate.getStringDate());
		visit.setTheend("-");
		visit.setStatus("未离开");
		this.visitService.insertVisit(visit);
		return "redirect:/visit/createVisit.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteVisit.action")
	public String deleteVisit(String id) {
		this.visitService.deleteVisit(id);
		return "redirect:/visit/getAllVisit.action";
	}

	// 批量删除数据
	@RequestMapping("deleteVisitByIds.action")
	public String deleteVisitByIds() {
		String[] ids = this.getRequest().getParameterValues("visitid");
		if (ids != null) {
			for (String visitid : ids) {
				this.visitService.deleteVisit(visitid);
			}
		}
		return "redirect:/visit/getAllVisit.action";
	}

	// 更新数据
	@RequestMapping("updateVisit.action")
	public String updateVisit(Visit visit) {
		this.visitService.updateVisit(visit);
		return "redirect:/visit/getAllVisit.action";
	}

	// 更新状态
	@RequestMapping("status.action")
	public String status(String id) {
		String status = "离开";
		Visit visit = this.visitService.getVisitById(id);
		visit.setTheend(VeDate.getStringDate());
		visit.setStatus(status);
		this.visitService.updateVisit(visit);
		return "redirect:/visit/getAllVisit.action";
	}

	// 显示全部数据
	@RequestMapping("getAllVisit.action")
	public String getAllVisit(String number) {
		List<Visit> visitList = this.visitService.getAllVisit();
		PageHelper.getUserPage(visitList, "visit", "getAllVisit", 10, number, this.getRequest());
		return "admin/listvisit";
	}

	@RequestMapping("getMyVisit.action")
	public String getMyVisit(String number) {
		String adminid = (String) this.getSession().getAttribute("adminid");
		Visit visit = new Visit();
		visit.setEmployid(adminid);
		List<Visit> visitList = this.visitService.getVisitByCond(visit);
		PageHelper.getUserPage(visitList, "visit", "getMyVisit", 10, number, this.getRequest());
		return "admin/xlistvisit";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryVisitByCond.action")
	public String queryVisitByCond(String cond, String name, String number) {
		Visit visit = new Visit();
		if (cond != null) {
			if ("roomsid".equals(cond)) {
				visit.setRoomsid(name);
			}
			if ("usersid".equals(cond)) {
				visit.setUsersid(name);
			}
			if ("name".equals(cond)) {
				visit.setName(name);
			}
			if ("reason".equals(cond)) {
				visit.setReason(name);
			}
			if ("thestart".equals(cond)) {
				visit.setThestart(name);
			}
			if ("theend".equals(cond)) {
				visit.setTheend(name);
			}
			if ("status".equals(cond)) {
				visit.setStatus(name);
			}
			if ("memo".equals(cond)) {
				visit.setMemo(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.visitService.getVisitByLike(visit), "visit", nameList, valueList, 10, number, this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryvisit";
	}

	// 按主键查询数据
	@RequestMapping("getVisitById.action")
	public String getVisitById(String id) {
		Visit visit = this.visitService.getVisitById(id);
		this.getRequest().setAttribute("visit", visit);
		List<Rooms> roomsList = this.roomsService.getAllRooms();
		this.getRequest().setAttribute("roomsList", roomsList);
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		return "admin/editvisit";
	}

}
