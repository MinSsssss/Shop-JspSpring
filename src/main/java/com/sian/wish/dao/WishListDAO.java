package com.sian.wish.dao;

import java.util.List;

import com.sian.wish.dto.WishListDTO;

public interface WishListDAO {
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
