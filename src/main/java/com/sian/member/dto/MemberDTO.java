package com.sian.member.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberDTO {
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String mem_email;
	private String mem_tel;
	private Date mem_joindate;
	private boolean enabled;
	private String full_address;
	
	
	private String postcode;
	private String address;
	private String detailAddress;
	
	
	private List<AuthVO> authList;

	
	
}
