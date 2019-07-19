package com.MysteryGame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MysteryGame.domain.New;
import com.MysteryGame.mapper.NewMapper;

@Service
public class NewService {
	@Autowired
	private NewMapper newMapper;
	
	public List<New> findNew(){
		List<New> findNew = newMapper.findNew();
		return findNew;
	}
	
	public New findNewById(int new_id) {
		New newPage = newMapper.findNewById(new_id);
		return newPage;
	}
}
