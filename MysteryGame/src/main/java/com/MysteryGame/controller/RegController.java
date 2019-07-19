package com.MysteryGame.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.MysteryGame.service.UsersService;
import com.MysteryGame.utils.Md5;

@Controller
@RequestMapping("/RegController")
public class RegController {
//	@Autowired
//	private AdminService adminService;
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/UsersRegister")
	public String UsersRegister(HttpSession session,String user_id,String user_password,String user_name) {
		String encrypt = Md5.encrypt(user_password);
		usersService.register(user_id, encrypt);
		usersService.createUsersInfo(user_id,user_name);
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_name", user_name);
		return "forward:/HomeController/hello";
	}
	
	@RequestMapping("/Verification")
	@ResponseBody
	public Object Verification(String user_id) {
		Boolean verification = usersService.Verification(user_id);
		if(verification == true) {
			return true;
		}else {
			return false;
		}
	}
}
