package com.MysteryGame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MysteryGame.domain.Admin;
import com.MysteryGame.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired
	private AdminMapper adminMapper;
	
	public List<Admin> findAll(){
		List<Admin> list = adminMapper.findAll();
		return list;
	}
	
	public Admin findByAdminId(String admin_id) {
		Admin findAll = adminMapper.findByAdminId(admin_id);
		return findAll;
	}
	
	public boolean register(String admin_id,String admin_password) {
		adminMapper.register(admin_id, admin_password);
		return true;
	}
}
