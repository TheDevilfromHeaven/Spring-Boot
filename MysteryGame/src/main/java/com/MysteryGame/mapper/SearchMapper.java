package com.MysteryGame.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.MysteryGame.domain.Games;

@Mapper
public interface SearchMapper {
	@Select("select * from("
			+ "select * from phone_game "
			+ "union select * from online_game "
			+ "union select * from single_play_game "
			+ "union select * from chess_game"
			+ ")t where game_name_cn like concat('%',#{game_name_cn},'%') ")
	List<Games> Search(@Param("game_name_cn")String game_name_cn);
}
