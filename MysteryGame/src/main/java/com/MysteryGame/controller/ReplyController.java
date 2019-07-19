package com.MysteryGame.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MysteryGame.domain.Post;
import com.MysteryGame.domain.Reply;
import com.MysteryGame.service.PostService;
import com.MysteryGame.service.ReplyService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/ReplyController")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private PostService postService;
	
	@RequestMapping("/post_recommend")
	public String post_recommend(@RequestParam(defaultValue="1") Integer currentPage,int post_id,Model model) {
		PageHelper.startPage(currentPage, 15);
		List<Reply> reply = replyService.RecommendReply(post_id);
		PageInfo<Reply> pageInfo = new PageInfo<Reply>(reply, 5);
		Post recommendText = postService.RecommendText(post_id);
		model.addAttribute("reply", reply);
		model.addAttribute("post", recommendText);
		model.addAttribute("info", "RecommendInfo");
		model.addAttribute("forum_name", "post_recommend");
		model.addAttribute("pageInfo",pageInfo);
		return "reply";
	}
	
	@RequestMapping("/post_online_game")
	public String post_online_game(@RequestParam(defaultValue="1") Integer currentPage,int post_id,Model model) {
		PageHelper.startPage(currentPage, 15);
		List<Reply> reply = replyService.OLReply(post_id);
		PageInfo<Reply> pageInfo = new PageInfo<Reply>(reply, 5);
		Post olText = postService.OLText(post_id);
		model.addAttribute("reply", reply);
		model.addAttribute("post", olText);
		model.addAttribute("info", "OLInfo");
		model.addAttribute("forum_name", "post_online_game");
		model.addAttribute("pageInfo",pageInfo);
		return "reply";
	}
	
	@RequestMapping("/post_phone_game")
	public String post_phone_game(@RequestParam(defaultValue="1") Integer currentPage,int post_id,Model model) {
		PageHelper.startPage(currentPage, 15);
		List<Reply> reply = replyService.PHReply(post_id);
		PageInfo<Reply> pageInfo = new PageInfo<Reply>(reply, 5);
		Post phText = postService.PHText(post_id);
		model.addAttribute("reply", reply);
		model.addAttribute("post", phText);
		model.addAttribute("info", "PHInfo");
		model.addAttribute("forum_name", "post_phone_game");
		model.addAttribute("pageInfo",pageInfo);
		return "reply";
	}
	
	@RequestMapping("/post_single_play_game")
	public String post_single_play_game(@RequestParam(defaultValue="1") Integer currentPage,int post_id,Model model) {
		PageHelper.startPage(currentPage, 15);
		List<Reply> reply = replyService.SPReply(post_id);
		PageInfo<Reply> pageInfo = new PageInfo<Reply>(reply, 5);
		Post spText = postService.SPText(post_id);
		model.addAttribute("reply", reply);
		model.addAttribute("post", spText);
		model.addAttribute("info", "SPInfo");
		model.addAttribute("forum_name", "post_single_play_game");
		model.addAttribute("pageInfo",pageInfo);
		return "reply";
	}
	
	@RequestMapping("/RecommendInfo")
	public String RecommendInfo(Reply reply,HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		reply.setUser_id(user_id);
		replyService.RecommendInfo(reply);
		return "redirect:/ReplyController/post_recommend?post_id="+reply.getPost_id();
	}
	@RequestMapping("/OLInfo")
	public String OLInfo(Reply reply,HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		reply.setUser_id(user_id);
		replyService.OLInfo(reply);
		return "redirect:/ReplyController/post_online_game?post_id="+reply.getPost_id();
	}
	@RequestMapping("/PHInfo")
	public String PH(Reply reply,HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		reply.setUser_id(user_id);
		replyService.PHInfo(reply);
		return "redirect:/ReplyController/post_phone_game?post_id="+reply.getPost_id();
	}
	@RequestMapping("/SPInfo")
	public String SPInfo(Reply reply,HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		reply.setUser_id(user_id);
		replyService.SPInfo(reply);
		return "redirect:/ReplyController/post_single_play_game?post_id="+reply.getPost_id();
	}
}
