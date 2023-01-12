package com.sian.review.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private Long review_no;
	private Long order_detail_no;
	private String mem_id;
	private String review_title;
	private String review_content;
	private Date review_date;
	private int review_star;
	private int review_hit;
	
	private String product_name;
	private String product_thumb_img;
	private String product_s_thumb_img;
	
}
