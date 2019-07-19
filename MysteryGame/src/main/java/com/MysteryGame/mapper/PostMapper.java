package com.MysteryGame.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.MysteryGame.domain.Post;

@Mapper
public interface PostMapper {
	@Select("select post_recommend.*,users_info.user_name from post_recommend left join users_info on post_recommend.user_id = users_info.user_id ORDER BY post_id desc")
	List<Post> PostRecommend();
	
	@Select("select post_online_game.*,users_info.user_name from post_online_game left join users_info on post_online_game.user_id = users_info.user_id ORDER BY post_id desc")
	List<Post> PostOnlineGame();
	
	@Select("select post_phone_game.*,users_info.user_name from post_phone_game left join users_info on post_phone_game.user_id = users_info.user_id ORDER BY post_id desc")
	List<Post> PostPhoneGame();
	
	
	
	@Select("select post_single_play_game.*,users_info.user_name from post_single_play_game left join users_info on post_single_play_game.user_id = users_info.user_id ORDER BY post_id desc")
	List<Post> PostSinglePlayGame();
	
	@Insert("insert into post_online_game(bbs_id,game_name,post_name,post_content,user_id) values(#{bbs_id},#{game_name},#{post_name},#{post_content},#{user_id})")
	boolean OLPost(Post post);
	
	@Insert("insert into post_phone_game(bbs_id,game_name,post_name,post_content,user_id) values(#{bbs_id},#{game_name},#{post_name},#{post_content},#{user_id})")
	boolean PHPost(Post post);
	
	@Insert("insert into post_single_play_game(bbs_id,game_name,post_name,post_content,user_id) values(#{bbs_id},#{game_name},#{post_name},#{post_content},#{user_id})")
	boolean SPPost(Post post);
	
	
	
	@Select("select post_recommend.* ,users_info.user_name,users_info.user_head_img " 
			+ "from post_recommend " 
			+ "left join users_info "
			+ "on post_recommend.user_id = users_info.user_id "
			+ "where post_id = #{post_id}")
	Post RecommendText(int post_id);
	
	@Select("select post_online_game.* ,users_info.user_name,users_info.user_head_img " 
			+ "from post_online_game " 
			+ "left join users_info "
			+ "on post_online_game.user_id = users_info.user_id "
			+ "where post_id = #{post_id}")
	Post OLText(int post_id);
	
	@Select("select post_phone_game.* ,users_info.user_name,users_info.user_head_img " 
			+ "from post_phone_game " 
			+ "left join users_info "
			+ "on post_phone_game.user_id = users_info.user_id "
			+ "where post_id = #{post_id}")
	Post PHText(int post_id);
	
	@Select("select post_single_play_game.* ,users_info.user_name,users_info.user_head_img " 
			+ "from post_single_play_game " 
			+ "left join users_info "
			+ "on post_single_play_game.user_id = users_info.user_id "
			+ "where post_id = #{post_id}")
	Post SPText(int post_id);
}
