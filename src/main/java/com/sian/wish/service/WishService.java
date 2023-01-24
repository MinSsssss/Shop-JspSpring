package com.sian.wish.service;

import java.util.List;

import com.sian.cart.dto.CartProductDTO;
import com.sian.wish.dto.WishDTO;

public interface WishService {
	public int wishListInsert(WishDTO wishListDTO);
	
	public List<WishDTO> wishList(String mem_id);
	
	public int wishDelete(WishDTO wishListDTO);
	
	public int wishChk(WishDTO wishDTO);
}
