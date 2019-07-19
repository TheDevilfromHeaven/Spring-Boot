package com.MysteryGame.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MysteryGame.domain.Admin;
import com.MysteryGame.service.AdminService;
import com.MysteryGame.utils.Md5;

@Controller
@RequestMapping("/AdminController")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/login")
	public String login(String admin_id,String admin_password){
		 Admin admin = adminService.findByAdminId(admin_id); 
		String sql_password = admin.getAdmin_password();
		if(Md5.validate(admin_password, sql_password)) {
			return "welcome";
		}else {
			return "error";
		}
	}
}
