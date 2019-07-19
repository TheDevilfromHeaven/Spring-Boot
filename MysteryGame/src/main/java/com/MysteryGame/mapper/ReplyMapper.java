package com.MysteryGame.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.MysteryGame.domain.Reply;

@Mapper
public interface ReplyMapper {
	@Select("select reply_recommend.* ,users_info.user_name,users_info.user_head_img " 
			+ "from reply_recommend " 
			+ "left join users_info "
			+ "on reply_recommend.user_id = users_info.user_id "
			+ "where post_id = #{post_id}")
	List<Reply> RecommendReply(int post_id);
	
	@Select("select reply_online.* ,users_info.user_name,users_info.user_head_img " 
			+ "from reply_online " 
			+ "left join users_info "
			+ "on reply_online.user_id = users_info.user_id "
			+ "where post_id = #{post_id}")
	List<Reply> OLReply(int post_id);
	
	@Select("select reply_phone.* ,users_info.user_name,users_info.user_head_img " 
			+ "from reply_phone " 
			+ "left join users_info "
			+ "on reply_phone.user_id = users_info.user_id "
			+ "where post_id = #{post_id}")
	List<Reply> PHReply(int post_id);
	
	@Select("select reply_single_play.* ,users_info.user_name,users_info.user_head_img " 
			+ "from reply_single_play " 
			+ "left join users_info "
			+ "on reply_single_play.user_id = users_info.user_id "
			+ "where post_id = #{post_id}")
	List<Reply> SPReply(int post_id);
	
	@Insert("insert into reply_recommend(post_id,reply_content,user_id) values(#{post_id},#{reply_content},#{user_id})")
	boolean RecommendInfo(Reply reply);
	
	@Insert("insert into reply_online(post_id,reply_content,user_id) values(#{post_id},#{reply_content},#{user_id})")
	boolean OLInfo(Reply reply);
	
	@Insert("insert into reply_phone(post_id,reply_content,user_id) values(#{post_id},#{reply_content},#{user_id})")
	boolean PHInfo(Reply reply);
	
	@Insert("insert into reply_single_play(post_id,reply_content,user_id) values(#{post_id},#{reply_content},#{user_id})")
	boolean SPInfo(Reply reply);
}
