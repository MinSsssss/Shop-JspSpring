package com.sian.wish.controller;

import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sian.cart.service.CartService;
import com.sian.member.service.MemberService;
import com.sian.product.service.ProductService;
import com.sian.wish.dto.WishDTO;
import com.sian.wish.service.WishService;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/wish")
public class WishController {
	
	private final WishService wishService;
	
	private final MemberService memberService;
	
	private final ProductService productService;
	
	/*
	 * ALL
	 */
	

	
	/*
	 * ADMIN ONLY
	 */
	
	/*
	 * MEMBER ONLY @PreAuthorize("hasRole('ROLE_MEMBER')")
	 */
	
	
	@GetMapping("/wishListView")
	public void wishList(Authentication authentication,Model model) {
		String mem_id = memberService.getId(authentication);
		model.addAttribute("wishList",wishService.wishList(mem_id));
		
	}
	
	@ResponseBody
	@PostMapping("/addWishList")
	public int addWishList(@RequestBody WishDTO wishListDTO, Authentication authentication) {
		try {
			return wishService.wishListInsert(wishListDTO);
		} catch (DataIntegrityViolationException e) {
			
			return 0;
		}
	}
	@ResponseBody
	@PostMapping("/wishDelete")
	public int wishDelete(@RequestBody WishDTO wishListDTO,
			Authentication authentication)  {

		wishListDTO.setMem_id(memberService.getId(authentication));
		if(wishService.wishDelete(wishListDTO)==1) {
			return 1;
		}
		else {
			return 0;
		}

		
	}
	
	@PostMapping("/wishSelectDelete")
	public String wishSelectDelete(@RequestParam(value = "cartIds", required = false) List<String> cartIds,
			WishDTO wishListDTO, Authentication authentication)  {

		for (int i = 0; i < cartIds.size(); i++) {
			System.out.println(cartIds);
			wishListDTO.setProduct_no(productService.getProductNo(cartIds.get(i)));
			wishListDTO.setMem_id(memberService.getId(authentication));
			wishService.wishDelete(wishListDTO);

		}

		return "redirect:/wish/wishListView";
	}
}
