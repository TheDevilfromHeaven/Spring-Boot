package com.MysteryGame.domain;

import java.util.Date;

import lombok.Data;

@Data
public class New {
	private Integer new_id;
	private String new_title;
	private String new_content;
	private String new_img;
	private String new_author;
	private Date new_time;
 
}
