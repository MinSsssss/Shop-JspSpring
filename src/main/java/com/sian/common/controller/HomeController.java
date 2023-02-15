package com.sian.common.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sian.category.dto.CategoryDTO;
import com.sian.category.service.CategoryService;
import com.sian.common.page.Criteria;
import com.sian.member.dto.AuthVO;
import com.sian.member.dto.MemberDTO;
import com.sian.member.service.MemberService;
import com.sian.order.dto.OrderDTO;
import com.sian.order.service.OrderService;
import com.sian.product.dto.ProductDTO;
import com.sian.product.service.ProductService;
import com.sian.qna.service.QnaService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Controller
public class HomeController {

	private final MemberService memberService;

	private final CategoryService categoryService;

	private final ProductService productService;
	
	private final OrderService orderService;
	
	private final QnaService qnaService;

	/*
	 * Index 페이지
	 */
	@GetMapping("/")
	public String memberIndex(HttpServletResponse response, Model model, Criteria cri) {
		List<CategoryDTO> categoryList = categoryService.getCategoryList("product");

		Cookie cookie = new Cookie("view", null);
		cookie.setComment("게시글 조회 확인");
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);

		int category_no = 0;
		CategoryDTO category = null;
		List<ProductDTO> productList = null;

		for (int i = 0; i < categoryList.size(); i++) {

			category = categoryList.get(i);
			category_no = category.getCategory_no();
			productList = productService.memberProductList(category_no);
			for (ProductDTO product : productList) {
				product.setProduct_thumb_img(product.getProduct_thumb_img().replace("s_", ""));
			}
			category.setProductList(productList);
		}

		model.addAttribute("categoryList", categoryList);
		return "/index";
	}

	
	/*
	 * 관리자 페이지
	 */
	@GetMapping("/admin")
	public String adminIndex(Model model) {
	
		model.addAttribute("orderList" ,orderService.recentOrder());
		model.addAttribute("qnaList",qnaService.recentQna());
		return "/admin/index";
	}


	/*
	 * 
	 */
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "Access Denied");
	}

	@GetMapping("/login")
	public void loginInput(HttpServletRequest request, String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);
		String referrer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referrer);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}

	@GetMapping("/registerAgree")
	public String registerAgree() {
		return "/registerAgree";
	}

	@PostMapping("/register")
	public String registerPage(@RequestParam(value = "agree1", defaultValue = "false") boolean agree1,
			@RequestParam(value = "agree2", defaultValue = "false") boolean agree2) {
		if (!agree1 || !agree2) {
			return "/registerAgree";
		}

		return "/register";
	}

	@PostMapping("/registerProc")
	public String registerAction(@Valid MemberDTO memberDTO, AuthVO authVO) throws Exception {
		String postcode = memberDTO.getPostcode();
		String address = memberDTO.getAddress();
		String detailAddress = memberDTO.getDetailAddress();
		String full_address = "[" + postcode + "] " + address + ", " + detailAddress;
		memberDTO.setFull_address(full_address);
		memberService.register(memberDTO, authVO);

		return "redirect:/login";
	}

	@ResponseBody
	@PostMapping("/idChk")
	public boolean idChk(@RequestParam String mem_id){

		return memberService.idChk(mem_id);
	}

}
