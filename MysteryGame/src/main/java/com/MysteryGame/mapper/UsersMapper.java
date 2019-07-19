package com.MysteryGame.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.MysteryGame.domain.UserInfo;
import com.MysteryGame.domain.UserInterest;
import com.MysteryGame.domain.Users;

@Mapper
public interface UsersMapper {
	@Select("select * from users")
	List<Users> findAll();
	
	@Select("select * from users where user_id = #{user_id}")
	Users findByUserId(String user_id);
	
	@Select("select user_id from users where user_id = #{user_id}")
	String Verification(String user_id);
	
	@Insert("insert into users(user_id,user_password) values(#{user_id},#{user_password})")
	boolean register(String user_id,String user_password);
	
	@Insert("insert into users_info(user_id,user_name) values(#{user_id},#{user_name})")
	boolean createUsersInfo(String user_id,String user_name);
	
	@Update("<script>"
			+ "update users_info"
			+ "<set> user_name = #{user_name},user_email = #{user_email},user_sex = #{user_sex} "
			+ "<if test='user_birthday != null'>,user_birthday = #{user_birthday}</if>"
			+ "</set>where user_id = #{user_id} </script>")
	boolean changeInfo(UserInfo changeInfo);
	
	@Select("select * from users_info where user_id = #{user_id}")
	UserInfo findUsersInfo(String user_id);
	
	@Select("select * from users where user_id = #{user_id}")
	@Results({
		@Result(id=true,column="user_id",property="user_id"),
		@Result(column="user_password",property="user_password"),
		@Result(column="register_time",property="register_time"),
		@Result(column="user_id",property="userInfo",
		one=@One(select="com.MysteryGame.mapper.UsersMapper.findUsersInfo"))
	})
	Users userInfo(String user_id);
	
	@Update("update users_info set user_head_img = #{user_head_img} where user_id = #{user_id}")
	boolean headImg(String user_id,String user_head_img);
	
	@Select("select * from interest where user_id = #{user_id}")
	List<UserInterest> interest(String user_id);
	
	@Select("select * from interest where user_id = #{user_id} and interest_game = #{interest_game}")
	UserInterest follow(String user_id,String interest_game);
	
	@Insert("insert into interest(user_id,interest_game) values (#{user_id},#{interest_game})")
	boolean addFollow(String user_id,String interest_game);
	
	@Delete("delete from interest where user_id = #{user_id} and interest_game = #{interest_game}")
	boolean delFollow(String user_id,String interest_game);
}
