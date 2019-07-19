package com.MysteryGame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MysteryGame.domain.RankingList;
import com.MysteryGame.mapper.RankingListMapper;

@Service
public class RankingListService {
	@Autowired
	private RankingListMapper rankingListMapper;
	
	public List<RankingList> hot_game_list(){
		List<RankingList> hot_game_list = rankingListMapper.hot_game_list();
		return hot_game_list;
	}
	
	public List<RankingList> new_game_list(){
		List<RankingList> new_game_list = rankingListMapper.new_game_list();
		return new_game_list;
	}
}
