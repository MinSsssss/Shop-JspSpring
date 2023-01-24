package com.sian.wish.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sian.cart.dto.CartProductDTO;
import com.sian.cart.service.CartService;
import com.sian.member.service.MemberService;
import com.sian.product.service.ProductService;
import com.sian.wish.dao.WishDAO;
import com.sian.wish.dto.WishDTO;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RequiredArgsConstructor
@Service
public class WishServiceImpl implements WishService {
	
	private final WishDAO wishDAO;
	
	
	@Override
	public int wishListInsert(WishDTO wishListDTO) {
		
		return wishDAO.insert(wishListDTO);
	}
	@Override
	public List<WishDTO> wishList(String mem_id) {
		
		return wishDAO.wishList(mem_id);
	}
	@Override
	public int wishDelete(WishDTO wishListDTO) {
		
		
		return wishDAO.wishDelete(wishListDTO);
		
	}
	@Override
	public int wishChk(WishDTO wishDTO) {
		
		return wishDAO.wishChk(wishDTO);
	}
}
