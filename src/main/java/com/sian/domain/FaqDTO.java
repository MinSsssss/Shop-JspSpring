package com.sian.domain;

import lombok.Data;

@Data
public class FaqDTO {
	private int faq_no;
	private int category_no;
	private String category_name;
	
	private String faq_title;
	private String faq_content;
	private Long faq_hit;

}
