package com.sian.cart.dto;

import lombok.Data;

@Data
public class CartListDTO {
	private String product_image1;
	private int product_no;
	private String product_name;
	private int product_price;
	private int cart_qty;
	private int sub_total;
}
