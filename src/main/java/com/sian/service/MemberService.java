package com.sian.service;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;

import com.sian.domain.AuthVO;
import com.sian.domain.CartListDTO;
import com.sian.domain.CartProductDTO;
import com.sian.domain.MemberDTO;
import com.sian.domain.OrderDTO;
import com.sian.domain.OrderDetailDTO;
import com.sian.domain.ProductDTO;

public interface MemberService {
	
	
	public void register(MemberDTO memberDTO,AuthVO authVO) throws Exception;
	
	public boolean memberDrop(MemberDTO memberDTO) throws Exception;
	
	public int idChk(MemberDTO memberDTO) throws Exception;
	
	public String getId(Authentication authentication);
	
	public String getPwd(Authentication authentication) throws Exception;
	
	public boolean pwdChk(MemberDTO memberDTO,Authentication authentication) throws Exception;
	
	public boolean memberModify(MemberDTO memberDTO) throws Exception;
	
	public List<ProductDTO> memberProductList(int category_no) throws Exception;
	
	public ProductDTO getProduct(int product_no) throws Exception;
	
	public int getProductNo(String product_name);
	
	public int addCart(CartProductDTO cartProductDTO) throws Exception;

	public int findCart(CartProductDTO cartProductDTO);
	
	public List<CartListDTO> cartList(String mem_id) throws Exception;
	
	public void cartModify(CartProductDTO cartProductDTO);
	
	public int cartDelete(CartProductDTO cartProductDTO) throws Exception;
	
	public void orderInsert(OrderDTO orderDTO);
	
	public void orderDetailInsert(OrderDetailDTO orderDetailDTO);
	
	public void orderCartDelete(Map<String,Object>map);

	public Long getOrderNo(String mem_id);
	
	public OrderDTO getOrder(Long order_no);
	
	public List<OrderDTO> getOrderList(String mem_id);
	
	public List<OrderDetailDTO> getOrderDetailList(Long order_no);
	
	public int orderDelete(Long order_no);
}
