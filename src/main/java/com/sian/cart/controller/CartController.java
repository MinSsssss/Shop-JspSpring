package com.sian.cart.controller;

import java.util.List;



import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sian.cart.dto.CartProductDTO;
import com.sian.cart.service.CartService;
import com.sian.member.service.MemberService;
import com.sian.order.dto.OrderDTO;
import com.sian.product.service.ProductService;


import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
@RequestMapping("/cart") //security:intercept-url ROLE_MEMBER 접근허용
public class CartController {
	
	private final CartService cartService;
	private final MemberService memberService;
	private final ProductService productService;
	
	/*
	 * 장바구니 추가
	 */
	@ResponseBody
	@PostMapping("/addCart")
	public boolean addCart(@RequestBody CartProductDTO cartProductDTO, Authentication authentication)  {

		cartProductDTO.setMem_id(memberService.getId(authentication));
		
		return cartService.addCart(cartProductDTO);
	}
	
	
	/*
	 * 본인 장바구니 조회
	 */
	@GetMapping("/cartView")
	public String cartView(Authentication authentication, Model model)  {
		
		
		model.addAttribute("cartList", cartService.cartList(memberService.getId(authentication)));
		
		return "/cart/cartView";
	}

	
	/*
	 * 장바구니에서 수량변경
	 */
	@PostMapping("/cartModify")
	public String cartModify(CartProductDTO cartProductDTO, Authentication authentication, Model model)
			 {
		int product_no = productService.getProductNo(cartProductDTO.getProduct_name());
		
		cartProductDTO.setProduct_no(product_no);
		cartProductDTO.setMem_id(memberService.getId(authentication));

		cartService.cartModify(cartProductDTO);

		return "redirect:/cart/cartView";
	}
	
	
	/*
	 * 장바구니에서 삭제
	 */
	@ResponseBody
	@PostMapping("/cartDelete")
	public boolean cartDelete(@RequestBody CartProductDTO cartProductDTO,
			Authentication authentication)  {

		cartProductDTO.setMem_id(memberService.getId(authentication));
		
		return cartService.cartDelete(cartProductDTO);
	}

	
	/*
	 * 장바구니에서 선택 상품 삭제
	 */
	@PostMapping("/cartSelectDelete")
	public String cartSelectDelete(@RequestParam(value = "cartIds", required = false) List<String> cartIds,
			CartProductDTO cartProductDTO, Authentication authentication)  {

		for (int i = 0; i < cartIds.size(); i++) {
			cartProductDTO.setProduct_no(productService.getProductNo(cartIds.get(i)));
			cartProductDTO.setMem_id(memberService.getId(authentication));
			cartService.cartDelete(cartProductDTO);

		}

		return "redirect:/cart/cartView";
	}

	/*
	 * 장바구니에서 선택한 물건 구매
	 */
	@PostMapping("/cartSelectOrder")
	public String cartSelectOrder(OrderDTO orderDTO, Model model, Authentication authentication)  {
		
		model.addAttribute("orderList", orderDTO.getOrderDetailList());
		return "/order/checkout";
	}
	

	
}
