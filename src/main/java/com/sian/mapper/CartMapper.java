package com.sian.mapper;

import java.util.List;

import com.sian.domain.CartDTO;
import com.sian.domain.CartListDTO;
import com.sian.domain.CartProductDTO;

public interface CartMapper {
	public void insert(CartDTO cartDTO) throws Exception;
		
	public int get(String mem_id) throws Exception;
	
	public List<CartListDTO> cartList(String mem_id) throws Exception;
	
	public void addCart(CartProductDTO cartProductDTO) throws Exception;
	
	
}
