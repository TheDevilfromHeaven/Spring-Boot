package com.MysteryGame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MysteryGame.domain.Forum;
import com.MysteryGame.mapper.ForumMapper;

@Service
public class ForumService {
	@Autowired
	private ForumMapper forumMapper;
	
	public List<Forum> forums(){
		List<Forum> forums = forumMapper.forums();
		return forums;
	}
}
