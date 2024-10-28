package com.controller;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.entity.Rewards;
import com.service.RewardsService;
import com.entity.Rooms;
import com.entity.Users;
import com.entity.Admin;
import com.service.RoomsService;
import com.service.UsersService;
import com.service.AdminService;
import com.util.PageHelper;
import com.util.VeDate;
//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/rewards" , produces = "text/plain;charset=utf-8")
public class RewardsController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private RewardsService rewardsService;
	@Autowired
	private RoomsService roomsService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private AdminService adminService;

	// 准备添加数据
	@RequestMapping("createRewards.action")
	public String createRewards() {
		List<Rooms> roomsList = this.roomsService.getAllRooms();
		this.getRequest().setAttribute("roomsList", roomsList);
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		List<Admin> adminList = this.adminService.getAllAdmin();
		this.getRequest().setAttribute("adminList", adminList);
		return "admin/addrewards";
	}
	// 添加数据
	@RequestMapping("addRewards.action")
	public String addRewards(Rewards rewards) {
		rewards.setAddtime(VeDate.getStringDateShort());
		this.rewardsService.insertRewards(rewards);
		return "redirect:/rewards/createRewards.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteRewards.action")
	public String deleteRewards(String id) {
		this.rewardsService.deleteRewards(id);
		return "redirect:/rewards/getAllRewards.action";
	}

	// 批量删除数据
	@RequestMapping("deleteRewardsByIds.action")
	public String deleteRewardsByIds() {
		String[] ids = this.getRequest().getParameterValues("rewardsid");
		if (ids != null) {
			for (String rewardsid : ids) {
				this.rewardsService.deleteRewards(rewardsid);
			}
		}
		return "redirect:/rewards/getAllRewards.action";
	}

	// 更新数据
	@RequestMapping("updateRewards.action")
	public String updateRewards(Rewards rewards) {
		this.rewardsService.updateRewards(rewards);
		return "redirect:/rewards/getAllRewards.action";
	}

	// 显示全部数据
	@RequestMapping("getAllRewards.action")
	public String getAllRewards(String number) {
		List<Rewards> rewardsList = this.rewardsService.getAllRewards();
		PageHelper.getUserPage(rewardsList, "rewards", "getAllRewards", 10, number, this.getRequest());
		return "admin/listrewards";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryRewardsByCond.action")
	public String queryRewardsByCond(String cond, String name, String number) {
		Rewards rewards = new Rewards();
		if(cond != null){
			if ("roomsid".equals(cond)) {
				rewards.setRoomsid(name);
			}
			if ("usersid".equals(cond)) {
				rewards.setUsersid(name);
			}
			if ("cate".equals(cond)) {
				rewards.setCate(name);
			}
			if ("reason".equals(cond)) {
				rewards.setReason(name);
			}
			if ("ideas".equals(cond)) {
				rewards.setIdeas(name);
			}
			if ("addtime".equals(cond)) {
				rewards.setAddtime(name);
			}
			if ("adminid".equals(cond)) {
				rewards.setAdminid(name);
			}
			if ("memo".equals(cond)) {
				rewards.setMemo(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.rewardsService.getRewardsByLike(rewards), "rewards", nameList, valueList, 10, number, this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryrewards";
	}

	// 按主键查询数据
	@RequestMapping("getRewardsById.action")
	public String getRewardsById(String id) {
		Rewards rewards = this.rewardsService.getRewardsById(id);
		this.getRequest().setAttribute("rewards", rewards);
		List<Rooms> roomsList = this.roomsService.getAllRooms();
		this.getRequest().setAttribute("roomsList", roomsList);
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		List<Admin> adminList = this.adminService.getAllAdmin();
		this.getRequest().setAttribute("adminList", adminList);
		return "admin/editrewards";
	}


}
