package com.sian.domain;

import lombok.Data;

@Data
public class CartListDTO {
	private String image1;
	private String product_name;
	private int product_price;
	private int cart_qty;
	private int sub_total;
}
