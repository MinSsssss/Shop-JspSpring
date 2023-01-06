package com.sian.wish.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sian.cart.dto.CartProductDTO;
import com.sian.wish.dao.WishListDAO;
import com.sian.wish.dto.WishListDTO;

import lombok.Setter;

@Service
public class WishListServiceImpl implements WishListService {
	@Setter(onMethod_ = @Autowired)
	private WishListDAO wishListMapper;
	
	
	@Override
	public int wishListInsert(WishListDTO wishListDTO) {
		
		return wishListMapper.insert(wishListDTO);
	}
	@Override
	public List<WishListDTO> wishList(String mem_id) {
		
		return wishListMapper.wishList(mem_id);
	}
	@Override
	public int wishDelete(WishListDTO wishListDTO) {
		
		
		return wishListMapper.wishDelete(wishListDTO);
		
	}
}
