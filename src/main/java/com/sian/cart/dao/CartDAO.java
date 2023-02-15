package com.sian.cart.dao;

import java.util.List;

import com.sian.cart.dto.CartListDTO;
import com.sian.cart.dto.CartProductDTO;

public interface CartDAO {

	
	public List<CartListDTO> cartList(String mem_id);

	public int addCart(CartProductDTO cartProductDTO);

	public int cartModify(CartProductDTO cartProductDTO);
	
	public int cartDelete(CartProductDTO cartProductDTO);
	
	
}
