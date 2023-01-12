package com.sian.cart.dto;

import lombok.Data;

@Data
public class CartListDTO {
	
	private int product_no;
	private String product_name;
	private int product_price;
	private int cart_qty;
	private int sub_total;
	private String product_s_thumb_img;
	private String product_thumb_img;
}
