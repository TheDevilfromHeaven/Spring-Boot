package com.MysteryGame.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserInterest {
	private String user_id;
	private String interest_game;
	private Date insert_time;
}
