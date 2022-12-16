package com.sian.domain;

import lombok.Data;

@Data
public class CartProductDTO {
	private int product_no;
	private int cart_no;
	private int cart_qty;
	private int cart_price;
}
