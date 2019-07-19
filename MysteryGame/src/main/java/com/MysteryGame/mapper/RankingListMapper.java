package com.MysteryGame.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.MysteryGame.domain.RankingList;

@Mapper
public interface RankingListMapper {
	@Select("select * from hot_game_list")
	List<RankingList> hot_game_list();
	
	@Select("select * from new_game_list")
	List<RankingList> new_game_list();
}
