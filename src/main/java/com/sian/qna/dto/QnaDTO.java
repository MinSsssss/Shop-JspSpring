package com.sian.qna.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QnaDTO {
	private long qna_no;
	private int category_no;
	private String category_name;
	private String mem_id;
	
	private Long order_no;
	private String qna_title;
	private String qna_pwd;
	private String qna_writer;
	private String qna_tel;
	private String qna_content;
	private String qna_status;
	private Date qna_date;
}
