package com.MysteryGame.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MysteryGame.domain.Games;
import com.MysteryGame.service.GamesService;
import com.MysteryGame.service.SearchService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/SearchController")
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private GamesService gamesService;
	
	@RequestMapping("/Search")
	public String Search(@RequestParam(defaultValue="1") Integer currentPage,String keyword,Model model) {
		PageHelper.startPage(currentPage, 8);
		List<Games> search = searchService.Search(keyword);
		PageInfo<Games> pageInfo = new PageInfo<Games>(search, 5);
		model.addAttribute("search", search);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("keyword",keyword);
		model.addAttribute("type", "search");
		return "search";
	}
	
	@RequestMapping("/phoneGame")
	public String phoneGame(@RequestParam(defaultValue="1") Integer currentPage,Model model) {
		PageHelper.startPage(currentPage, 8);
		List<Games> phoneGame = gamesService.phoneGame();
		PageInfo<Games> pageInfo = new PageInfo<Games>(phoneGame, 5);
		model.addAttribute("search", phoneGame);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("type", "phoneGame");
		return "search";
	}
	
	@RequestMapping("/onlineGame")
	public String onlineGame(@RequestParam(defaultValue="1") Integer currentPage,Model model) {
		PageHelper.startPage(currentPage, 8);
		List<Games> onlineGame = gamesService.onlineGame();
		PageInfo<Games> pageInfo = new PageInfo<Games>(onlineGame, 5);
		model.addAttribute("search", onlineGame);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("type", "onlineGame");
		return "search";
	}
	
	@RequestMapping("/singlePlayGame")
	public String singlePlayGame(@RequestParam(defaultValue="1") Integer currentPage,Model model) {
		PageHelper.startPage(currentPage, 8);
		List<Games> singlePlayGame = gamesService.singlePlayGame();
		PageInfo<Games> pageInfo = new PageInfo<Games>(singlePlayGame, 5);
		model.addAttribute("search", singlePlayGame);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("type", "phoneGame");
		return "search";
	}
	
	@RequestMapping("/chessGame")
	public String chessGame(@RequestParam(defaultValue="1") Integer currentPage,Model model) {
		PageHelper.startPage(currentPage, 8);
		List<Games> chessGame = gamesService.chessGame();
		PageInfo<Games> pageInfo = new PageInfo<Games>(chessGame, 5);
		model.addAttribute("search", chessGame);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("type", "phoneGame");
		return "search";
	}
}
