package com.MysteryGame.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserInfo {
	private String user_id;
	private String user_name;
	private String user_sex;
	private String user_email;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_birthday;
	private String user_head_img;
}
