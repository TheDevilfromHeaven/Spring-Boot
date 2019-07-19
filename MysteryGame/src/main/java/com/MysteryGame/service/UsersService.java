package com.MysteryGame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MysteryGame.domain.UserInfo;
import com.MysteryGame.domain.UserInterest;
import com.MysteryGame.domain.Users;
import com.MysteryGame.mapper.UsersMapper;

@Service
public class UsersService {
	@Autowired
	private UsersMapper usersMapper;
	
	public List<Users> findAll(){
		List<Users> list = usersMapper.findAll();
		return list;
	}
	
	public Users findByUserId(String user_id) {
		Users findAll = usersMapper.findByUserId(user_id);
		return findAll;
	}
	
	public Boolean Verification(String user_id) {
		String sql_user_id = usersMapper.Verification(user_id);
		if(sql_user_id != null) {
			return true;
		}else {
			return false;
		}
	}
	
	public Users login(String user_id) {
		Users findAll = usersMapper.findByUserId(user_id);
		return findAll;
	}
	
	public boolean register(String user_id,String user_password) {
		usersMapper.register(user_id, user_password);
		return true;
	}
	
	public boolean createUsersInfo(String user_id,String user_name) {
		usersMapper.createUsersInfo(user_id,user_name);
		return true;
	}
	
	public boolean headImg(String user_id,String user_head_img) {
		usersMapper.headImg(user_id, user_head_img);
		return true;
	}
	
	public Boolean changeInfo(UserInfo changeInfo) {
		usersMapper.changeInfo(changeInfo);
		return true;
	}
	
	public Users userInfo(String user_id) {
		Users asdf = usersMapper.userInfo(user_id);
		return asdf;
	}
	
	public List<UserInterest> interest(String user_id){
		List<UserInterest> interest = usersMapper.interest(user_id);
		return interest;
	}
	
	public UserInterest follow(String user_id,String interest_game){
		UserInterest follow = usersMapper.follow(user_id,interest_game);
		return follow;
	}
	
	public UserInfo userName(String user_id) {
		UserInfo findUsersInfo = usersMapper.findUsersInfo(user_id);
		return findUsersInfo;
	}
	
	public boolean addFollow(String user_id,String game_name) {
		usersMapper.addFollow(user_id, game_name);
		return true;
	}
	
	public boolean delFollow(String user_id,String game_name) {
		usersMapper.delFollow(user_id, game_name);
		return true;
	}
}
