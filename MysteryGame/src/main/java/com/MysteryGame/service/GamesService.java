package com.MysteryGame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MysteryGame.domain.Games;
import com.MysteryGame.mapper.GamesMapper;

@Service
public class GamesService {
	@Autowired
	private GamesMapper gamesMapper;
	
	public Games game(String game_name_cn){
		Games game = gamesMapper.game(game_name_cn);
		return game;
	}
	
	public List<Games> OLgameName(){
		List<Games> oLgameName = gamesMapper.OLgameName();
		return oLgameName;
	}
	
	public List<Games> PHgameName(){
		List<Games> pHgameName = gamesMapper.PHgameName();
		return pHgameName;
	}
	
	public List<Games> SPgameName(){
		List<Games> sPgameName = gamesMapper.SPgameName();
		return sPgameName;
	}
	
	public List<Games> phoneGame(){
		List<Games> phoneGame = gamesMapper.phoneGame();
		return phoneGame;
	}
	public List<Games> onlineGame(){
		List<Games> onlineGame = gamesMapper.onlineGame();
		return onlineGame;
	}
	public List<Games> singlePlayGame(){
		List<Games> singlePlayGame = gamesMapper.singlePlayGame();
		return singlePlayGame;
	}
	public List<Games> chessGame(){
		List<Games> chessGame = gamesMapper.chessGame();
		return chessGame;
	}
}
