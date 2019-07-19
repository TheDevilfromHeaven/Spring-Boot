package com.MysteryGame.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.MysteryGame.domain.Games;

@Mapper
public interface GamesMapper {
	@Select("select * from("
			+ "select * from phone_game "
			+ "union select * from online_game "
			+ "union select * from single_play_game "
			+ "union select * from chess_game"
			+ ")t where game_name_cn like concat('%',#{game_name_cn},'%') ")
	Games game(@Param("game_name_cn")String game_name_cn);
	
	@Select("select game_name_cn from online_game")
	List<Games> OLgameName();
	
	@Select("select game_name_cn from phone_game")
	List<Games> PHgameName();
	
	@Select("select game_name_cn from single_play_game")
	List<Games> SPgameName();
	
	@Select("select * from phone_game")
	List<Games> phoneGame();
	
	@Select("select * from online_game")
	List<Games> onlineGame();
	
	@Select("select * from single_play_game")
	List<Games> singlePlayGame();
	
	@Select("select * from chess_game")
	List<Games> chessGame();
}
