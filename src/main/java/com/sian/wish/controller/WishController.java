package com.sian.wish.controller;

import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.access.prepost.PreAuthorize;
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
@RequestMapping("/wish") //security:intercept-url ROLE_MEMBER 접근허용
public class WishController {
	
	private final WishService wishService;
	
	private final MemberService memberService;
	
	private final ProductService productService;
	

	
	/*
	 * MEMBER ONLY
	 */
	
	/*
	 * 찜리스트 조회
	 */
	@GetMapping("/wishListView")
	public void wishList(Authentication authentication,Model model) {
		String mem_id = memberService.getId(authentication);
		model.addAttribute("wishList",wishService.wishList(mem_id));
		
	}
	
	/*
	 * 찜하기
	 */
	@ResponseBody
	@PostMapping("/addWishList")
	public int addWishList(@RequestBody WishDTO wishListDTO, Authentication authentication) {
		try {
			return wishService.wishListInsert(wishListDTO);
		} catch (DataIntegrityViolationException e) {
			wishService.wishDelete(wishListDTO);
			return 0;
		}
	}
	
	/*
	 * 상품이 이미 찜리스트에 있는지 확인
	 */
	@ResponseBody
	@PostMapping("/wishChk")
	public int wishChk(@RequestBody WishDTO wishListDTO) {
		try {
			return wishService.wishChk(wishListDTO);
			
		} catch (DataIntegrityViolationException e) {
			System.out.println("catch : " + wishService.wishChk(wishListDTO));
			return 0;
		}
	}
	
	/*
	 * 찜리스트에서 상품 삭제
	 */
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
	
}
