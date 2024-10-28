package com.controller;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.entity.Signin;
import com.service.SigninService;
import com.entity.Users;
import com.entity.Rooms;
import com.service.UsersService;
import com.service.RoomsService;
import com.util.PageHelper;
import com.util.VeDate;
//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/signin" , produces = "text/plain;charset=utf-8")
public class SigninController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private SigninService signinService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private RoomsService roomsService;

	// 准备添加数据
	@RequestMapping("createSignin.action")
	public String createSignin() {
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		List<Rooms> roomsList = this.roomsService.getAllRooms();
		this.getRequest().setAttribute("roomsList", roomsList);
		return "admin/addsignin";
	}
	// 添加数据
	@RequestMapping("addSignin.action")
	public String addSignin(Signin signin) {
		signin.setAddtime(VeDate.getStringDateShort());
		this.signinService.insertSignin(signin);
		return "redirect:/signin/createSignin.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteSignin.action")
	public String deleteSignin(String id) {
		this.signinService.deleteSignin(id);
		return "redirect:/signin/getAllSignin.action";
	}

	// 批量删除数据
	@RequestMapping("deleteSigninByIds.action")
	public String deleteSigninByIds() {
		String[] ids = this.getRequest().getParameterValues("signinid");
		if (ids != null) {
			for (String signinid : ids) {
				this.signinService.deleteSignin(signinid);
			}
		}
		return "redirect:/signin/getAllSignin.action";
	}

	// 更新数据
	@RequestMapping("updateSignin.action")
	public String updateSignin(Signin signin) {
		this.signinService.updateSignin(signin);
		return "redirect:/signin/getAllSignin.action";
	}

	// 显示全部数据
	@RequestMapping("getAllSignin.action")
	public String getAllSignin(String number) {
		List<Signin> signinList = this.signinService.getAllSignin();
		PageHelper.getUserPage(signinList, "signin", "getAllSignin", 10, number, this.getRequest());
		return "admin/listsignin";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("querySigninByCond.action")
	public String querySigninByCond(String cond, String name, String number) {
		Signin signin = new Signin();
		if(cond != null){
			if ("usersid".equals(cond)) {
				signin.setUsersid(name);
			}
			if ("roomsid".equals(cond)) {
				signin.setRoomsid(name);
			}
			if ("addtime".equals(cond)) {
				signin.setAddtime(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.signinService.getSigninByLike(signin), "signin", nameList, valueList, 10, number, this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/querysignin";
	}

	// 按主键查询数据
	@RequestMapping("getSigninById.action")
	public String getSigninById(String id) {
		Signin signin = this.signinService.getSigninById(id);
		this.getRequest().setAttribute("signin", signin);
		List<Users> usersList = this.usersService.getAllUsers();
		this.getRequest().setAttribute("usersList", usersList);
		List<Rooms> roomsList = this.roomsService.getAllRooms();
		this.getRequest().setAttribute("roomsList", roomsList);
		return "admin/editsignin";
	}


}
