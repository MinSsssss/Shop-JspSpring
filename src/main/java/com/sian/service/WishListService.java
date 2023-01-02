package com.sian.service;

import java.util.List;

import com.sian.domain.CartProductDTO;
import com.sian.domain.WishListDTO;

public interface WishListService {
	public int wishListInsert(WishListDTO wishListDTO);
	
	public List<WishListDTO> wishList(String mem_id);
	
	public int wishDelete(WishListDTO wishListDTO);
}
