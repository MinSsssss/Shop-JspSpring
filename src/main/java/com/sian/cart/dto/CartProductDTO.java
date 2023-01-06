package com.sian.cart.dto;

import lombok.Data;

@Data
public class CartProductDTO {
	private int product_no;
	private String product_name;
	private String mem_id;
	private int cart_qty;
	private int sub_total;
}
