package com.MysteryGame.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.MysteryGame.domain.UserInfo;
import com.MysteryGame.domain.UserInterest;
import com.MysteryGame.domain.Users;
import com.MysteryGame.service.UsersService;

@Controller
@RequestMapping("/UserInfoController")
public class UserInfoController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/UserInfo")
	public String UserInfo(String user_id,Model model) {
		Users user = usersService.userInfo(user_id);
		model.addAttribute("user", user);
		return "UserInfo";
	}
	
	@RequestMapping("/changeInfo")
	public String changeInfo(HttpSession session,UserInfo changeInfo) {
		String user_id = (String)session.getAttribute("user_id");
		usersService.changeInfo(changeInfo);
		session.setAttribute("user_name", changeInfo.getUser_name()); 
		return "redirect:/UserInfoController/UserInfo?user_id="+user_id;
	}
	
	@RequestMapping("/interest")
	@ResponseBody
	public Object interest(String user_id) {
		List<UserInterest> interest = usersService.interest(user_id);
		return interest;
	}
	
	@RequestMapping("/fileUpload")
	public String fileUpload(@RequestParam(value = "file") MultipartFile file,String user_id, Model model) {
        if (file.isEmpty()) {
            System.out.println("文件为空");
        }
        String fileName = file.getOriginalFilename();  // 文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
        String filePath = "F://ljh//workspace//MysteryGame//src//main//resources//static//img//head//"; // 上传后的路径
        String newFileName = UUID.randomUUID() + suffixName; // 新文件名
        File dest = new File(filePath + newFileName);
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
        } catch (IOException e) {
            e.printStackTrace();
        }
        usersService.headImg(user_id, newFileName);
        return "redirect:/UserInfoController/UserInfo?user_id="+user_id;
    }
	
	@RequestMapping("/delFollow")
	public String addFollow(HttpSession session,String game_name) {
		String user_id = (String)session.getAttribute("user_id");
		usersService.delFollow(user_id, game_name);
		return "redirect:/UserInfoController/UserInfo?user_id="+user_id;
	}
}
