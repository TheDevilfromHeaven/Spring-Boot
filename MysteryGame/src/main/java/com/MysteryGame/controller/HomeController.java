package com.MysteryGame.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MysteryGame.domain.Games;
import com.MysteryGame.domain.New;
import com.MysteryGame.domain.RankingList;
import com.MysteryGame.service.GamesService;
import com.MysteryGame.service.NewService;
import com.MysteryGame.service.RankingListService;

@Controller
@RequestMapping("/HomeController")
public class HomeController {
	@Autowired
	private NewService newService;
	
	@Autowired
	private RankingListService rankingListService;
	
	@Autowired
	private GamesService gamesService;
	
	@RequestMapping("/hello")
	public String hello(Model model) {
		List<New> findNew = newService.findNew();
		List<RankingList> hot_game_list = rankingListService.hot_game_list();
		List<RankingList> new_game_list = rankingListService.new_game_list();
		List<Games> pHgameName = gamesService.PHgameName();
		model.addAttribute("phone_recommend", pHgameName);
		model.addAttribute("new_game", new_game_list);
		model.addAttribute("new", findNew);
		model.addAttribute("list", hot_game_list);
		return "MysteryGame";
	}
	
	@RequestMapping("/welcome")
	public String welcome() {
		return "welcome";
	}
}
