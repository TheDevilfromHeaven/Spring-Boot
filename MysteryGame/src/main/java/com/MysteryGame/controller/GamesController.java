package com.MysteryGame.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.MysteryGame.domain.Games;
import com.MysteryGame.domain.UserInterest;
import com.MysteryGame.service.GamesService;
import com.MysteryGame.service.UsersService;

@Controller
@RequestMapping("/GamesController")
public class GamesController {
	@Autowired
	private GamesService gamesService;
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/game")
	public String game(HttpSession session,String game_name_cn,Model model){
		Games game = gamesService.game(game_name_cn);
		String user_id = (String)session.getAttribute("user_id");
		if(user_id != null) {
			UserInterest follow = usersService.follow(user_id,game_name_cn);
			if(follow != null) {
				model.addAttribute("exist", "true");
			}else {
				model.addAttribute("exist", "false");
			}
		}else {
			model.addAttribute("exist", "false");
		}
		model.addAttribute("game", game);
		return "GameInfo";
	}
	
	@RequestMapping("/OLgameName")
	@ResponseBody
	public Object OLgameName() {
		List<Games> oLgameName = gamesService.OLgameName();
		return oLgameName;
	}
	
	@RequestMapping("/PHgameName")
	@ResponseBody
	public Object PHgameName() {
		List<Games> pHgameName = gamesService.PHgameName();
		return pHgameName;
	}
	
	@RequestMapping("/SPgameName")
	@ResponseBody
	public Object SPgameName() {
		List<Games> sPgameName = gamesService.SPgameName();
		return sPgameName;
	}
	
	@RequestMapping("/addFollow")
	@ResponseBody
	public Object addFollow(HttpSession session,String game_name) {
		String user_id = (String)session.getAttribute("user_id");
		usersService.addFollow(user_id, game_name);
		return true;
	}
}
