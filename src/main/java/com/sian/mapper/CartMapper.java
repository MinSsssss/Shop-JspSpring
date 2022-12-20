package com.sian.mapper;

import java.util.List;

import com.sian.domain.CartListDTO;
import com.sian.domain.CartProductDTO;

public interface CartMapper {
//	
//		
//	public int get(String mem_id) throws Exception;
//	
	public List<CartListDTO> cartList(String mem_id) throws Exception;
//	
	public void insert(CartProductDTO cartProductDTO) throws Exception;

	public void cartModify(CartProductDTO cartProductDTO) ;
	
}
