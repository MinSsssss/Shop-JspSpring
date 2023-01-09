package com.sian.product.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int product_no;
	
	private int category_no;
	
	private String category_name;
	
	private String product_name;
	
	private int product_price;
	
	private String product_detail;
	
	private String product_image1;
	
	private String product_thumb_img;
	
	private Date product_regdate;
	
	private Date product_updateDate;
	
	private Long product_hit;
	
	
}
