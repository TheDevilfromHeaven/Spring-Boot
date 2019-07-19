package com.MysteryGame.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MysteryGame.domain.Forum;
import com.MysteryGame.domain.Post;
import com.MysteryGame.service.ForumService;
import com.MysteryGame.service.PostService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/ForumController")
public class ForumController {
	@Autowired
	private ForumService forumService;
	
	@Autowired
	private PostService postService;
	
	@RequestMapping("/forum")
	public String forum(@RequestParam(defaultValue="1") Integer currentPage,Model model){
		List<Forum> forums = forumService.forums();
		PageHelper.startPage(currentPage, 20);
		List<Post> postRecommend = postService.PostRecommend();
		PageInfo<Post> pageInfo = new PageInfo<Post>(postRecommend, 5);
		model.addAttribute("forums", forums);
		model.addAttribute("postRecommend", postRecommend);
		model.addAttribute("forum_name", "post_recommend");
		model.addAttribute("pageInfo",pageInfo);
		return "forum";
	}
	
	@RequestMapping("/post_recommend")
	public String PostRecommend(@RequestParam(defaultValue="1") Integer currentPage,Model model){
		List<Forum> forums = forumService.forums();
		PageHelper.startPage(currentPage, 20);
		List<Post> postRecommend = postService.PostRecommend();
		PageInfo<Post> pageInfo = new PageInfo<Post>(postRecommend, 5);
		model.addAttribute("forums", forums);
		model.addAttribute("postRecommend", postRecommend);
		model.addAttribute("forum_name", "post_recommend");
		model.addAttribute("pageInfo",pageInfo);
		return "forum";
	}
	
	@RequestMapping("/post_online_game")
	public String PostOnlineGame(@RequestParam(defaultValue="1") Integer currentPage,Model model){
		List<Forum> forums = forumService.forums();
		PageHelper.startPage(currentPage, 20);
		List<Post> postRecommend = postService.PostOnlineGame();
		PageInfo<Post> pageInfo = new PageInfo<Post>(postRecommend, 5);
		model.addAttribute("forums", forums);
		model.addAttribute("postRecommend", postRecommend);
		model.addAttribute("forum_name", "post_online_game");
		model.addAttribute("pageInfo",pageInfo);
		return "forum";
	}

	@RequestMapping("/post_phone_game")
	public String PostPhoneGame(@RequestParam(defaultValue="1") Integer currentPage,Model model){
		List<Forum> forums = forumService.forums();
		PageHelper.startPage(currentPage, 20);
		List<Post> postRecommend = postService.PostPhoneGame();
		PageInfo<Post> pageInfo = new PageInfo<Post>(postRecommend, 5);
		model.addAttribute("forums", forums);
		model.addAttribute("postRecommend", postRecommend);
		model.addAttribute("forum_name", "post_phone_game");
		model.addAttribute("pageInfo",pageInfo);
		return "forum";
	}
	
	@RequestMapping("/post_single_play_game")
	public String PostSinglePlayGame(@RequestParam(defaultValue="1") Integer currentPage,Model model){
		List<Forum> forums = forumService.forums();
		PageHelper.startPage(currentPage, 20);
		List<Post> postRecommend = postService.PostSinglePlayGame();
		PageInfo<Post> pageInfo = new PageInfo<Post>(postRecommend, 5);
		model.addAttribute("forums", forums);
		model.addAttribute("postRecommend", postRecommend);
		model.addAttribute("forum_name", "post_single_play_game");
		model.addAttribute("pageInfo",pageInfo);
		return "forum";
	}
	
	@RequestMapping("/OLPost")
	public String OLPost(Post post,HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		post.setUser_id(user_id);
		postService.OLPost(post);
		return "redirect:/ForumController/post_online_game";
	}
	
	@RequestMapping("/PHPost")
	public String PHPost(Post post,HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		post.setUser_id(user_id);
		postService.PHPost(post);
		return "redirect:/ForumController/post_phone_game";
	}
	
	@RequestMapping("/SPPost")
	public String SPPost(Post post,HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		post.setUser_id(user_id);
		postService.SPPost(post);
		return "redirect:/ForumController/post_single_play_game";
	}
}
