package com.MysteryGame.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class Admin implements Serializable {
	private static final long serialVersionUID = -7565726939787014086L;
	private String admin_id;
	private String admin_password;
	private Date register_time;
	
}
