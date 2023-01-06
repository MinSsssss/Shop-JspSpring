package com.sian.wish.service;

import java.util.List;

import com.sian.cart.dto.CartProductDTO;
import com.sian.wish.dto.WishListDTO;

public interface WishListService {
	public int wishListInsert(WishListDTO wishListDTO);
	
	public List<WishListDTO> wishList(String mem_id);
	
	public int wishDelete(WishListDTO wishListDTO);
}
