package com.MysteryGame.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	private Integer post_id;
	private Integer reply_id;
	private String reply_content;
	private Date reply_time;
	private String user_id;
	private String user_name;
	private String user_head_img;

}
