package com.sian.notice.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private String notice_writer;
}
