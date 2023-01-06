package com.sian.cart.dao;

import java.util.List;

import com.sian.cart.dto.CartListDTO;
import com.sian.cart.dto.CartProductDTO;

public interface CartDAO {
//	
//		
//	public int get(String mem_id) throws Exception;
//	
	public List<CartListDTO> cartList(String mem_id);
//	
	public boolean insert(CartProductDTO cartProductDTO);

	
	
	public void cartModify(CartProductDTO cartProductDTO);
	
	public int cartDelete(CartProductDTO cartProductDTO);
	
	
}
