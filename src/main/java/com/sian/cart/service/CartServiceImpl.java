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
	public int addCart(CartProductDTO cartProductDTO)  {
		
		try {
			if(cartDAO.insert(cartProductDTO)) {
				return 1;
			}
			else {
				return 0;
			}
		} catch (DataIntegrityViolationException e) {
			return 0;
		}
		
	}

	
	@Override
	public List<CartListDTO> cartList(String mem_id)  {
		
		return cartDAO.cartList(mem_id);
	}
	
	@Override
	public void cartModify(CartProductDTO cartProductDTO) {
		
		cartDAO.cartModify(cartProductDTO);

	}
	
	@Override
	public int cartDelete(CartProductDTO cartProductDTO)  {
		
		
		return cartDAO.cartDelete(cartProductDTO);
	}
}
