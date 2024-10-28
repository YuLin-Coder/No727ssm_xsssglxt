package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Article;
import com.entity.Banner;
import com.entity.Broken;
import com.entity.Rewards;
import com.entity.Rooms;
import com.entity.Signin;
import com.entity.Topic;
import com.entity.Users;
import com.entity.Visit;
import com.service.ArticleService;
import com.service.BannerService;
import com.service.BrokenService;
import com.service.RewardsService;
import com.service.RoomsService;
import com.service.SigninService;
import com.service.TopicService;
import com.service.UsersService;
import com.service.VisitService;
import com.util.PageHelper;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/index")
public class IndexController extends BaseController {

	@Autowired
	private RoomsService roomsService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private BannerService bannerService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private SigninService signinService;
	@Autowired
	private RewardsService rewardsService;
	@Autowired
	private BrokenService brokenService;
	@Autowired
	private VisitService visitService;
	@Autowired
	private TopicService topicService;

	// TODO Auto-generated method stub
	// 公共方法 提供公共查询数据
	private void front() {
		this.getRequest().setAttribute("title", "学生宿舍管理系统");
		List<Banner> bannerList = this.bannerService.getAllBanner();
		this.getRequest().setAttribute("bannerList", bannerList);
	}

// 首页显示
	@RequestMapping("index.action")
	public String index() {
		this.front();
		List<Banner> bannerList = this.bannerService.getAllBanner();
		List<Banner> frontList = new ArrayList<Banner>();
		for (Banner banner : bannerList) {
			List<Article> articleList = this.articleService.getArticleByBanner(banner.getBannerid());
			banner.setArticleList(articleList);
			frontList.add(banner);
		}
		this.getRequest().setAttribute("frontList", frontList);
		List<Article> topList = this.articleService.getTopArticle();
		List<Article> favList = this.articleService.getFlvArticle();
		this.getRequest().setAttribute("topList", topList);
		this.getRequest().setAttribute("favList", favList);
		return "users/index";
	}

// 新闻公告
	@RequestMapping("article.action")
	public String article(String id, String number) {
		this.front();
		Article article = new Article();
		article.setBannerid(id);
		List<Article> articleList = this.articleService.getArticleByCond(article);
		PageHelper.getIndexPage(articleList, "article", "article", id, 10, number, this.getRequest());
		Banner banner = this.bannerService.getBannerById(id);
		this.getRequest().setAttribute("banner", banner);
		return "users/article";
	}

// 阅读公告
	@RequestMapping("read.action")
	public String read(String id) {
		this.front();
		Article article = this.articleService.getArticleById(id);
		article.setHits("" + (Integer.parseInt(article.getHits()) + 1));
		this.articleService.updateArticle(article);
		this.getRequest().setAttribute("article", article);
		return "users/read";
	}

// 准备登录
	@RequestMapping("preLogin.action")
	public String prelogin() {
		this.front();
		return "users/login";
	}

// 用户登录
	@RequestMapping("login.action")
	public String login() {
		this.front();
		String username = this.getRequest().getParameter("username");
		String password = this.getRequest().getParameter("password");
		Users u = new Users();
		u.setUsername(username);
		List<Users> usersList = this.usersService.getUsersByCond(u);
		if (usersList.size() == 0) {
			this.getSession().setAttribute("message", "用户名不存在");
			return "redirect:/index/preLogin.action";
		} else {
			Users users = usersList.get(0);
			if ("锁定".equals(users.getStatus())) {
				this.getSession().setAttribute("message", "账户被锁定");
				return "redirect:/index/preLogin.action";
			}
			if (password.equals(users.getPassword())) {
				this.getSession().setAttribute("userid", users.getUsersid());
				this.getSession().setAttribute("username", users.getUsername());
				this.getSession().setAttribute("users", users);
				this.getSession().setAttribute("roomsid", users.getRoomsid());
				return "redirect:/index/index.action";
			} else {
				this.getSession().setAttribute("message", "密码错误");
				return "redirect:/index/preLogin.action";
			}
		}
	}

// 准备注册
	@RequestMapping("preReg.action")
	public String preReg() {
		this.front();
		List<Rooms> roomsList = this.roomsService.getAllRooms();
		this.getRequest().setAttribute("roomsList", roomsList);
		return "users/register";
	}

// 用户注册
	@RequestMapping("register.action")
	public String register(Users users) {
		this.front();
		Users u = new Users();
		u.setUsername(users.getUsername());
		List<Users> usersList = this.usersService.getUsersByCond(u);
		if (usersList.size() == 0) {
			users.setStatus("解锁");
			users.setRegdate(VeDate.getStringDateShort());
			this.usersService.insertUsers(users);
		} else {
			this.getSession().setAttribute("message", "用户名已存在");
			return "redirect:/index/preReg.action";
		}

		return "redirect:/index/preLogin.action";
	}

// 退出登录
	@RequestMapping("exit.action")
	public String exit() {
		this.front();
		this.getSession().removeAttribute("userid");
		this.getSession().removeAttribute("username");
		this.getSession().removeAttribute("users");
		return "redirect:/index/index.action";
	}

// 准备修改密码
	@RequestMapping("prePwd.action")
	public String prePwd() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		return "users/editpwd";
	}

// 修改密码
	@RequestMapping("editpwd.action")
	public String editpwd() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		String password = this.getRequest().getParameter("password");
		String repassword = this.getRequest().getParameter("repassword");
		Users users = this.usersService.getUsersById(userid);
		if (password.equals(users.getPassword())) {
			users.setPassword(repassword);
			this.usersService.updateUsers(users);
		} else {
			this.getSession().setAttribute("message", "旧密码错误");
			return "redirect:/index/prePwd.action";
		}
		this.getSession().setAttribute("message", "修改成功");
		return "redirect:/index/prePwd.action";
	}

	@RequestMapping("usercenter.action")
	public String usercenter() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		return "users/usercenter";
	}

	@RequestMapping("userinfo.action")
	public String userinfo() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		this.getSession().setAttribute("users", this.usersService.getUsersById(userid));
		return "users/userinfo";
	}

	@RequestMapping("personal.action")
	public String personal(Users users) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		this.usersService.updateUsers(users);
		this.getSession().setAttribute("message", "修改成功");
		return "redirect:/index/userinfo.action";
	}

	@RequestMapping("preBroken.action")
	public String preBroken() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		this.getRequest().setAttribute("bno", "B" + VeDate.getStringDatex());
		return "users/addBroken";
	}

	@RequestMapping("addBroken.action")
	public String addBroken(Broken broken) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		String roomsid = (String) this.getSession().getAttribute("roomsid");
		broken.setAddtime(VeDate.getStringDateShort());
		broken.setStatus("未处理");
		broken.setRoomsid(roomsid);
		broken.setUsersid(userid);
		this.brokenService.insertBroken(broken);
		return "redirect:/index/myBroken.action";
	}

	@RequestMapping("myBroken.action")
	public String myBroken(String number) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Broken broken = new Broken();
		broken.setUsersid(userid);
		List<Broken> brokenList = this.brokenService.getBrokenByCond(broken);
		PageHelper.getIndexPage(brokenList, "broken", "myBroken", null, 10, number, this.getRequest());
		return "users/myBroken";
	}

	@RequestMapping("mySignin.action")
	public String mySignin(String number) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Signin signin = new Signin();
		signin.setUsersid(userid);
		List<Signin> signinList = this.signinService.getSigninByCond(signin);
		PageHelper.getIndexPage(signinList, "signin", "mySignin", null, 10, number, this.getRequest());
		return "users/mySignin";
	}

	@RequestMapping("addSignin.action")
	public String addSignin() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		String roomsid = (String) this.getSession().getAttribute("roomsid");
		Signin signin = new Signin();
		signin.setUsersid(userid);
		signin.setRoomsid(roomsid);
		signin.setAddtime(VeDate.getStringDate());
		this.signinService.insertSignin(signin);
		return "redirect:/index/mySignin.action";
	}

	@RequestMapping("myRewards.action")
	public String myRewards() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Rewards rewards = new Rewards();
		rewards.setUsersid(userid);
		List<Rewards> rewardsList = this.rewardsService.getRewardsByCond(rewards);
		this.getRequest().setAttribute("rewardsList", rewardsList);
		return "users/myRewards";
	}

	@RequestMapping("myVisit.action")
	public String myVisit(String number) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Visit visit = new Visit();
		visit.setUsersid(userid);
		List<Visit> visitList = this.visitService.getVisitByCond(visit);
		PageHelper.getIndexPage(visitList, "visit", "myVisit", null, 10, number, this.getRequest());
		return "users/myVisit";
	}

	@RequestMapping("myTopic.action")
	public String myTopic(String number) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String roomsid = (String) this.getSession().getAttribute("roomsid");
		Topic topic = new Topic();
		topic.setRoomsid(roomsid);
		List<Topic> topicList = this.topicService.getTopicByCond(topic);
		PageHelper.getIndexPage(topicList, "topic", "myTopic", null, 10, number, this.getRequest());
		return "users/myTopic";
	}
	// TODO Auto-generated method stub
}
