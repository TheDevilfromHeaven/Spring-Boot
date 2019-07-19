package com.MysteryGame.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.MysteryGame.domain.New;

@Mapper
public interface NewMapper {
	@Select("select new_id,new_title from new")
	List<New> findNew();
	
	@Select("select * from new where new_id=#{new_id}")
	New findNewById(int new_id);
}
