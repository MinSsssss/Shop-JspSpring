package com.sian.cart.service;

import java.util.List;

import com.sian.cart.dto.CartListDTO;
import com.sian.cart.dto.CartProductDTO;

public interface CartService {
	
	public boolean addCart(CartProductDTO cartProductDTO);
	
	public List<CartListDTO> cartList(String mem_id);
	
	public boolean cartModify(CartProductDTO cartProductDTO);
	
	public boolean cartDelete(CartProductDTO cartProductDTO);
}	
