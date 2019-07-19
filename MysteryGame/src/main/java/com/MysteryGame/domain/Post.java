package com.MysteryGame.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Post {
	private Integer bbs_id;
	private String game_name;
	private Integer post_id;
	private String post_name;
	private String post_content;
	private Date post_time;
	private String user_id;
	private String user_name;
	private String user_head_img;
}
