package com.sian.wish.dao;

import java.util.List;

import com.sian.wish.dto.WishDTO;

public interface WishDAO {
	public int insert(WishDTO wishDTO);
	
	public List<WishDTO> wishList(String mem_id);
	
	public int wishDelete(WishDTO wishDTO);
//	
//	
//
//	public int findCart(CartProductDTO cartProductDTO);
//	
//	public void cartModify(CartProductDTO cartProductDTO);
//	

	
	
}
