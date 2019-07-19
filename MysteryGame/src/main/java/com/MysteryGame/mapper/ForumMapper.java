package com.MysteryGame.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.MysteryGame.domain.Forum;

@Mapper
public interface ForumMapper {
	@Select("select * from forum")
	List<Forum> forums(); 
}
