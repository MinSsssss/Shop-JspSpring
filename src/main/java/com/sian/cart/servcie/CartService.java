package com.sian.cart.servcie;

import java.util.List;

import com.sian.cart.dto.CartListDTO;
import com.sian.cart.dto.CartProductDTO;

public interface CartService {
public int addCart(CartProductDTO cartProductDTO);
	
	public List<CartListDTO> cartList(String mem_id);
	
	public void cartModify(CartProductDTO cartProductDTO);
	
	public int cartDelete(CartProductDTO cartProductDTO);
}	
