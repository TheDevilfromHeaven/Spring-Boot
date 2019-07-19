package com.MysteryGame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MysteryGame.domain.Games;
import com.MysteryGame.mapper.SearchMapper;

@Service
public class SearchService {
	@Autowired
	private SearchMapper searchMapper;
	
	public List<Games> Search(String game_name_cn){
		List<Games> search = searchMapper.Search(game_name_cn);
		return search;
	}

}
