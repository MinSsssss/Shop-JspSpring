package com.sian.review.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.sian.member.service.MemberService;

import com.sian.review.dto.ReviewDTO;
import com.sian.review.service.ReviewService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReviewController {
	
	private final ReviewService reviewService; 
	
	private final MemberService memberService;
	
	
	/*
	 * ALL
	 */
	

	
	/*
	 * ADMIN ONLY
	 */
	
	/*
	 * MEMBER ONLY @PreAuthorize("hasRole('ROLE_MEMBER')")
	 */
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/review/reviewWriteView")
	public String reviweWriteView(Long order_detail_no,
			Model model,RedirectAttributes rttr ) {
		System.out.println(reviewService.findReview(order_detail_no));
		if(reviewService.findReview(order_detail_no)!=0) {
			rttr.addFlashAttribute("msg","already");
			return "redirect:/order/orderList";
		}
		else {
			//model.addAttribute("reviewView",reviewService.getReviewView(order_detail_no));
			return "/review/reviewWriteView";
		}

	}
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/review/reviewModifyView")
	public String reviweModifyView(ReviewDTO reviewDTO,
			Model model,RedirectAttributes rttr ) {
		model.addAttribute("review",reviewService.getReview(reviewDTO));
		return "/review/reviewModifyView";

	}
	
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/review/reviewRegisterProc")
	public String reviewRegisterProc(ReviewDTO reviewDTO,Authentication authentication) {
		String mem_id = memberService.getId(authentication);
		reviewDTO.setMem_id(mem_id);
		
		System.out.println(reviewDTO);
		
		reviewService.reviewRegister(reviewDTO);
		
		return "redirect:/order/orderList";
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/review/reviewList")
	public void reviewList(Authentication authentication,Model model) {
		String mem_id = memberService.getId(authentication);
		
		model.addAttribute("reviewList", reviewService.reviewList(mem_id));
		
		
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/review/reviewModifyProc")
	public String reviewModifyProc(ReviewDTO reviewDTO,RedirectAttributes rttr) {
		
		if(reviewService.reviewModify(reviewDTO)) {
			rttr.addFlashAttribute("msg", "success");
		}
		else {
			rttr.addFlashAttribute("msg", "false");
		}
		return "redirect:/review/reviewList";
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@PostMapping("/review/reviewDelete")
	public void reviewDelete(@RequestParam("review_no")Long review_no) {
		
		reviewService.reviewDelete(review_no);
	}
}
