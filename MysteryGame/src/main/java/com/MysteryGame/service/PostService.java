package com.MysteryGame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MysteryGame.domain.Post;
import com.MysteryGame.mapper.PostMapper;

@Service
public class PostService {
	@Autowired
	private PostMapper postMapper;
	
	public List<Post> PostRecommend(){
		List<Post> post = postMapper.PostRecommend();
		return post;
	}
	
	public List<Post> PostOnlineGame(){
		List<Post> post = postMapper.PostOnlineGame();
		return post;
	}
	
	public List<Post> PostPhoneGame(){
		List<Post> post = postMapper.PostPhoneGame();
		return post;
	}
	
	public List<Post> PostSinglePlayGame(){
		List<Post> post = postMapper.PostSinglePlayGame();
		return post;
	}
	
	public boolean OLPost(Post post) {
		postMapper.OLPost(post);
		return true;
	}
	
	public boolean PHPost(Post post) {
		postMapper.PHPost(post);
		return true;
	}
	
	public boolean SPPost(Post post) {
		postMapper.SPPost(post);
		return true;
	}
	
	public Post RecommendText(int post_id) {
		Post recommendText = postMapper.RecommendText(post_id);
		return recommendText;
	}
	public Post OLText(int post_id) {
		Post recommendText = postMapper.OLText(post_id);
		return recommendText;
	}
	public Post PHText(int post_id) {
		Post recommendText = postMapper.PHText(post_id);
		return recommendText;
	}
	public Post SPText(int post_id) {
		Post recommendText = postMapper.SPText(post_id);
		return recommendText;
	}
}
