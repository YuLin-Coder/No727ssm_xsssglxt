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
import com.entity.Admin;
import com.entity.Rooms;
import com.service.AdminService;
import com.service.RoomsService;
import com.util.Excel;
import com.util.PageHelper;
import com.util.VeDate;

import jxl.Sheet;
import jxl.Workbook;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/rooms", produces = "text/plain;charset=utf-8")
public class RoomsController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private RoomsService roomsService;
	@Autowired
	private AdminService adminService;

	// 准备添加数据
	@RequestMapping("createRooms.action")
	public String createRooms() {
		List<Admin> adminList = this.adminService.getAllAdmin();
		this.getRequest().setAttribute("adminList", adminList);
		return "admin/addrooms";
	}

	@RequestMapping("createRoom.action")
	public String createRoom() {
		return "admin/addroom";
	}

	@RequestMapping("batchRooms.action")
	@ResponseBody // 将java对象转为json格式的数据返回
	public String batchRooms(String url) {
		String path = this.getRequest().getSession().getServletContext().getRealPath("/") + url;
		int num = 0;
		try {
			Workbook book = Workbook.getWorkbook(new File(path));
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);
			// 得到单元格
			for (int j = 1; j < sheet.getRows(); j++) {
				Rooms rooms = new Rooms();
				rooms.setRoomsid("" + UUID.randomUUID().toString().replace("-", ""));
				rooms.setRoomsname(sheet.getCell(0, j).getContents().toString());
				rooms.setNum(sheet.getCell(1, j).getContents().toString());
				rooms.setMianji(sheet.getCell(2, j).getContents().toString());
				rooms.setChaoxiang(sheet.getCell(3, j).getContents().toString());
				rooms.setAddtime(VeDate.getStringDateShort());
				rooms.setRealname(sheet.getCell(5, j).getContents().toString());
				rooms.setMemo(sheet.getCell(6, j).getContents().toString());
				Admin admin = new Admin();
				admin.setRealname(rooms.getRealname());
				List<Admin> list = this.adminService.getAdminByCond(admin);
				if (list.size() > 0) {
					Admin x = list.get(0);
					rooms.setAdminid(x.getAdminid());
					num += this.roomsService.insertRooms(rooms);
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
	@RequestMapping("addRooms.action")
	public String addRooms(Rooms rooms) {
		rooms.setAddtime(VeDate.getStringDateShort());
		this.roomsService.insertRooms(rooms);
		return "redirect:/rooms/createRooms.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteRooms.action")
	public String deleteRooms(String id) {
		this.roomsService.deleteRooms(id);
		return "redirect:/rooms/getAllRooms.action";
	}

	// 批量删除数据
	@RequestMapping("deleteRoomsByIds.action")
	public String deleteRoomsByIds() {
		String[] ids = this.getRequest().getParameterValues("roomsid");
		if (ids != null) {
			for (String roomsid : ids) {
				this.roomsService.deleteRooms(roomsid);
			}
		}
		return "redirect:/rooms/getAllRooms.action";
	}

	// 更新数据
	@RequestMapping("updateRooms.action")
	public String updateRooms(Rooms rooms) {
		this.roomsService.updateRooms(rooms);
		return "redirect:/rooms/getAllRooms.action";
	}

	// 显示全部数据
	@RequestMapping("getAllRooms.action")
	public String getAllRooms(String number) {
		List<Rooms> roomsList = this.roomsService.getAllRooms();
		PageHelper.getUserPage(roomsList, "rooms", "getAllRooms", 10, number, this.getRequest());
		Excel excel = new Excel();
		String banner = "宿舍信息";
		String s1 = "宿舍号,床位数,宿舍面积,朝向,创建日期,负责人,备注";
		String[] strTitle = s1.split(",");
		List<String[]> strList = new ArrayList<String[]>();
		for (Rooms rooms : roomsList) {
			String strTemp = rooms.getRoomsname() + "," + rooms.getNum() + "," + rooms.getMianji() + ","
					+ rooms.getChaoxiang() + "," + rooms.getAddtime() + "," + rooms.getRealname() + ","
					+ rooms.getMemo();
			String[] str = strTemp.split(",");
			strList.add(str);
		}
		String paths = this.getRequest().getSession().getServletContext().getRealPath("/");
		String url = excel.getExcel(strList, strTitle, banner, paths);
		this.getRequest().setAttribute("url", url);
		return "admin/listrooms";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryRoomsByCond.action")
	public String queryRoomsByCond(String cond, String name, String number) {
		Rooms rooms = new Rooms();
		if (cond != null) {
			if ("roomsname".equals(cond)) {
				rooms.setRoomsname(name);
			}
			if ("num".equals(cond)) {
				rooms.setNum(name);
			}
			if ("mianji".equals(cond)) {
				rooms.setMianji(name);
			}
			if ("chaoxiang".equals(cond)) {
				rooms.setChaoxiang(name);
			}
			if ("addtime".equals(cond)) {
				rooms.setAddtime(name);
			}
			if ("adminid".equals(cond)) {
				rooms.setAdminid(name);
			}
			if ("memo".equals(cond)) {
				rooms.setMemo(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.roomsService.getRoomsByLike(rooms), "rooms", nameList, valueList, 10, number,
				this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryrooms";
	}

	// 按主键查询数据
	@RequestMapping("getRoomsById.action")
	public String getRoomsById(String id) {
		Rooms rooms = this.roomsService.getRoomsById(id);
		this.getRequest().setAttribute("rooms", rooms);
		List<Admin> adminList = this.adminService.getAllAdmin();
		this.getRequest().setAttribute("adminList", adminList);
		return "admin/editrooms";
	}

}
