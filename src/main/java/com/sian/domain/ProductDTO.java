package com.sian.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int product_no;
	
	private int category_no;
	
	private String product_name;
	
	private String product_detail;
	
	private String product_image1;
	
	private Date product_regdate;
	
	private Date product_updateDate;
	
	private Long hit;
}
