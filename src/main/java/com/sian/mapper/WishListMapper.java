package com.sian.mapper;

import java.util.List;


import com.sian.domain.WishListDTO;

public interface WishListMapper {
	public int insert(WishListDTO wishListDTO);
	
	public List<WishListDTO> wishList(String mem_id);
	
	public int wishDelete(WishListDTO wishListDTO);
//	
//	
//
//	public int findCart(CartProductDTO cartProductDTO);
//	
//	public void cartModify(CartProductDTO cartProductDTO);
//	

	
	
}
