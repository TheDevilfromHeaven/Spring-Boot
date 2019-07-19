package com.MysteryGame.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.MysteryGame.domain.UserInfo;
import com.MysteryGame.domain.Users;
import com.MysteryGame.service.UsersService;
import com.MysteryGame.utils.Md5;

@Controller
@RequestMapping("/LoginController")
public class LoginController {
//	@Autowired
//	private AdminService adminService;
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/Userslogin")
	public String Userslogin(HttpSession session,String user_id,String user_password){
		Users users = usersService.findByUserId(user_id);
		UserInfo userName = usersService.userName(user_id);
		String user_name = userName.getUser_name();
		String sql_password = users.getUser_password();
		if(Md5.validate(user_password, sql_password)) {
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", user_name);
			return "forward:/HomeController/hello";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public Object login(HttpSession session,String user_id,String user_password) {
		Users users = usersService.findByUserId(user_id);
		UserInfo userName = usersService.userName(user_id);
		String user_name = userName.getUser_name();
		String sql_password = users.getUser_password();
		if(Md5.validate(user_password, sql_password)) {
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", user_name);
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping("/outLogin")
	public String outLogin(HttpSession session) {
		session.invalidate();
		return "redirect:/HomeController/hello";
	}
	
	@RequestMapping("/out")
	@ResponseBody
	public Object out(HttpSession session) {
		session.invalidate();
		return true;
	}
}
