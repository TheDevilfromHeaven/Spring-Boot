package com.MysteryGame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MysteryGame.domain.Reply;
import com.MysteryGame.mapper.ReplyMapper;

@Service
public class ReplyService {
	@Autowired
	private ReplyMapper replyMapper;
	
	public List<Reply> RecommendReply(int post_id){
		List<Reply> reply = replyMapper.RecommendReply(post_id);
		return reply;
	}
	
	public List<Reply> OLReply(int post_id){
		List<Reply> reply = replyMapper.OLReply(post_id);
		return reply;
	}
	
	public List<Reply> PHReply(int post_id){
		List<Reply> reply = replyMapper.PHReply(post_id);
		return reply;
	}
	
	public List<Reply> SPReply(int post_id){
		List<Reply> reply = replyMapper.SPReply(post_id);
		return reply;
	}
	
	public boolean RecommendInfo(Reply reply) {
		replyMapper.RecommendInfo(reply);
		return true;
	}
	
	public boolean OLInfo(Reply reply) {
		replyMapper.OLInfo(reply);
		return true;
	}
	
	public boolean PHInfo(Reply reply) {
		replyMapper.PHInfo(reply);
		return true;
	}
	
	public boolean SPInfo(Reply reply) {
		replyMapper.SPInfo(reply);
		return true;
	}
}
