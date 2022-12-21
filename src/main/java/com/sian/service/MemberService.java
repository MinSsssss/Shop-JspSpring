package com.sian.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;

import com.sian.domain.AuthVO;
import com.sian.domain.CartListDTO;
import com.sian.domain.CartProductDTO;
import com.sian.domain.MemberDTO;
import com.sian.domain.ProductDTO;
import com.sian.security.domain.CustomUser;

public interface MemberService {
	
	
	public void register(MemberDTO memberDTO,AuthVO authVO) throws Exception;
	
	public boolean memberDrop(MemberDTO memberDTO) throws Exception;
	
	public int idChk(MemberDTO memberDTO) throws Exception;
	
	public String getId(Authentication authentication) throws Exception;
	
	public String getPwd(Authentication authentication) throws Exception;
	
	public boolean pwdChk(MemberDTO memberDTO,Authentication authentication) throws Exception;
	
	public boolean memberModify(MemberDTO memberDTO) throws Exception;
	
	public List<ProductDTO> memberProductList(int category_no) throws Exception;
	
	public ProductDTO getProduct(int product_no) throws Exception;
	
	public int getProductNo(String product_name) throws Exception;
	
	public int addCart(CartProductDTO cartProductDTO) throws Exception;

	public int findCart(CartProductDTO cartProductDTO);
	
	public List<CartListDTO> cartList(String mem_id) throws Exception;
	
	public void cartModify(CartProductDTO cartProductDTO);
	
	public void cartRemove(String product_name) throws Exception;
}
