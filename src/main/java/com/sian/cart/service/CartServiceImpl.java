package com.sian.cart.service;

import java.util.List;


import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.sian.cart.dao.CartDAO;
import com.sian.cart.dto.CartListDTO;
import com.sian.cart.dto.CartProductDTO;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class CartServiceImpl implements CartService{
	
	private final CartDAO cartDAO;
	
	@Override
	public boolean addCart(CartProductDTO cartProductDTO)  {
		
		try {
			if(cartDAO.addCart(cartProductDTO)==1) {
				return true;
			}
			else {
				return false;
			}
		} catch (DataIntegrityViolationException e) {
			return false;
		}
		
	}

	
	@Override
	public List<CartListDTO> cartList(String mem_id)  {
		
		return cartDAO.cartList(mem_id);
	}
	
	@Override
	public boolean cartModify(CartProductDTO cartProductDTO) {
		if(cartDAO.cartModify(cartProductDTO)==1) {
			return true;
		}
		return false;
		

	}
	
	@Override
	public boolean cartDelete(CartProductDTO cartProductDTO)  {
		if(cartDAO.cartDelete(cartProductDTO)==1) {
			return true;
		}
		
		return false;
	}
}
