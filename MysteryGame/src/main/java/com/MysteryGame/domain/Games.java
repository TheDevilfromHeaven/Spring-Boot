package com.MysteryGame.domain;

import lombok.Data;

@Data
public class Games {
	private int game_type_id;
	private String game_name_cn;
	private String game_name_original;
	private String game_name_other;
	private String game_type_name;
	private String game_platform;
	private String game_developers;
	private String game_publisher;
	private String game_lssue_date;
	private String game_player_number;
	private String game_screen;
	private String game_picture;
	private String game_describe;
}
