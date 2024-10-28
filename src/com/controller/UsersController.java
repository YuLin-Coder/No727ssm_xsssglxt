package com.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.entity.Rooms;
import com.entity.Users;
import com.service.RoomsService;
import com.service.UsersService;
import com.util.Excel;
import com.util.PageHelper;
import com.util.VeDate;

import jxl.Sheet;
import jxl.Workbook;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/users", produces = "text/plain;charset=utf-8")
public class UsersController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private UsersService usersService;
	@Autowired
	private RoomsService roomsService;

	// 准备添加数据
	@RequestMapping("createUsers.action")
	public String createUsers() {
		return "admin/addusers";
	}

	@RequestMapping("batchUsers.action")
	@ResponseBody // 将java对象转为json格式的数据返回
	public String batchUsers(String url) {
		String path = this.getRequest().getSession().getServletContext().getRealPath("/") + url;
		int num = 0;
		try {
			Workbook book = Workbook.getWorkbook(new File(path));
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);
			// 得到单元格
			for (int j = 1; j < sheet.getRows(); j++) {
				Users users = new Users();
				users.setUsersid("" + UUID.randomUUID().toString().replace("-", ""));
				users.setUsername(sheet.getCell(0, j).getContents().toString());
				users.setPassword("000000");
				users.setRealname(sheet.getCell(1, j).getContents().toString());
				users.setSex(sheet.getCell(2, j).getContents().toString());
				users.setBirthday(sheet.getCell(3, j).getContents().toString());
				users.setContact(sheet.getCell(4, j).getContents().toString());
				users.setEmail(sheet.getCell(5, j).getContents().toString());
				users.setRoomsname(sheet.getCell(6, j).getContents().toString());
				users.setStatus(sheet.getCell(7, j).getContents().toString());
				users.setRegdate(VeDate.getStringDateShort());
				Rooms rooms = new Rooms();
				rooms.setRoomsname(users.getRoomsname());
				System.out.println(users.getRoomsname());
				List<Rooms> list = this.roomsService.getRoomsByCond(rooms);
				if (list.size() > 0) {
					Rooms x = list.get(0);
					users.setRoomsid(x.getRoomsid());
					num += this.usersService.insertUsers(users);
				}
			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		JSONObject json = new JSONObject();
		json.put("count", num);
		return json.toString();
	}

	// 添加数据
	@RequestMapping("addUsers.action")
	public String addUsers(Users users) {
		users.setStatus("");
		users.setRegdate(VeDate.getStringDateShort());
		this.usersService.insertUsers(users);
		return "redirect:/users/createUsers.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteUsers.action")
	public String deleteUsers(String id) {
		this.usersService.deleteUsers(id);
		return "redirect:/users/getAllUsers.action";
	}

	// 批量删除数据
	@RequestMapping("deleteUsersByIds.action")
	public String deleteUsersByIds() {
		String[] ids = this.getRequest().getParameterValues("usersid");
		if (ids != null) {
			for (String usersid : ids) {
				this.usersService.deleteUsers(usersid);
			}
		}
		return "redirect:/users/getAllUsers.action";
	}

	// 更新数据
	@RequestMapping("updateUsers.action")
	public String updateUsers(Users users) {
		this.usersService.updateUsers(users);
		return "redirect:/users/getAllUsers.action";
	}

	// 更新状态
	@RequestMapping("status.action")
	public String status(String id) {
		String status = "解锁";
		Users users = this.usersService.getUsersById(id);
		if (status.equals(users.getStatus())) {
			status = "锁定";
			users.setStatus(status);
			this.usersService.updateUsers(users);
		} else {
			users.setStatus(status);
			this.usersService.updateUsers(users);
		}
		return "redirect:/users/getAllUsers.action";
	}

	// 显示全部数据
	@RequestMapping("getAllUsers.action")
	public String getAllUsers(String number) {
		List<Users> usersList = this.usersService.getAllUsers();
		PageHelper.getUserPage(usersList, "users", "getAllUsers", 10, number, this.getRequest());
		Excel excel = new Excel();
		String banner = "学生用户信息";
		String s1 = "用户名,姓名,性别,出生日期,联系方式,电子邮件,所在宿舍,状态,注册日期";
		String[] strTitle = s1.split(",");
		List<String[]> strList = new ArrayList<String[]>();
		for (Users users : usersList) {
			String strTemp = users.getUsername() + "," + users.getRealname() + "," + users.getSex() + ","
					+ users.getBirthday() + "," + users.getContact() + "," + users.getEmail() + ","
					+ users.getRoomsname() + "," + users.getStatus() + "," + users.getRegdate();
			String[] str = strTemp.split(",");
			strList.add(str);
		}
		String paths = this.getRequest().getSession().getServletContext().getRealPath("/");
		String url = excel.getExcel(strList, strTitle, banner, paths);
		this.getRequest().setAttribute("url", url);
		return "admin/listusers";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryUsersByCond.action")
	public String queryUsersByCond(String cond, String name, String number) {
		Users users = new Users();
		if (cond != null) {
			if ("username".equals(cond)) {
				users.setUsername(name);
			}
			if ("password".equals(cond)) {
				users.setPassword(name);
			}
			if ("realname".equals(cond)) {
				users.setRealname(name);
			}
			if ("sex".equals(cond)) {
				users.setSex(name);
			}
			if ("birthday".equals(cond)) {
				users.setBirthday(name);
			}
			if ("contact".equals(cond)) {
				users.setContact(name);
			}
			if ("email".equals(cond)) {
				users.setEmail(name);
			}
			if ("roomsid".equals(cond)) {
				users.setRoomsid(name);
			}
			if ("status".equals(cond)) {
				users.setStatus(name);
			}
			if ("regdate".equals(cond)) {
				users.setRegdate(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.usersService.getUsersByLike(users), "users", nameList, valueList, 10, number,
				this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryusers";
	}

	// 按主键查询数据
	@RequestMapping("getUsersById.action")
	public String getUsersById(String id) {
		Users users = this.usersService.getUsersById(id);
		this.getRequest().setAttribute("users", users);
		List<Rooms> roomsList = this.roomsService.getAllRooms();
		this.getRequest().setAttribute("roomsList", roomsList);
		return "admin/editusers";
	}

}
