package com.MysteryGame.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.MysteryGame.domain.Admin;

@Mapper
public interface AdminMapper {
	@Select("select * from admin")
	List<Admin> findAll();
	
	@Select("select * from admin where admin_id = #{admin_id}")
	Admin findByAdminId(String admin_id);
	
	@Insert("insert into admin(admin_id,admin_password) values(#{admin_id},#{admin_password})")
	boolean register(String admin_id,String admin_password);
}
