package com.MysteryGame.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Users {
	private String user_id;
	private String user_password;
	private Date register_time;
	
	private UserInfo userInfo;
}
