package com.MysteryGame.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MysteryGame.domain.New;
import com.MysteryGame.service.NewService;

@Controller
@RequestMapping("/NewController")
public class NewController {
	@Autowired
	private NewService newService;
	
	@RequestMapping("/findNew")
	public String findNew(int new_id,Model model) {
		New newPage = newService.findNewById(new_id);
		model.addAttribute("newPage", newPage);
		return "NewPage";
	}
}
