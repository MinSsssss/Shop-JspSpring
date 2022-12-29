package com.sian.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sian.domain.CartProductDTO;
import com.sian.domain.MemberDTO;
import com.sian.domain.OrderDTO;
import com.sian.domain.OrderDetailDTO;
import com.sian.service.AdminService;
import com.sian.service.MemberService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/member/**")
public class MemberController {

	private MemberService memberService;

	private AdminService adminService;

	@GetMapping("/")
	public String memberIndex(Model model) throws Exception {
		model.addAttribute("categoryList", adminService.getCategoryList());

		return "/member/index";
	}


	@GetMapping("/auth/wishList")
	public void wishList() {

	}

	@GetMapping("/auth/qnaList")
	public void qnaList() {

	}

	@GetMapping("/auth/memberModify")
	public void memberModify() {

	}

	@GetMapping("/auth/memberDrop")
	public void memberDrop() {

	}

	@PostMapping("/auth/logout")
	public String logoutPost() {

		return "redirect:/member";
	}

	@ResponseBody
	@PostMapping("/auth/pwdChk")
	public int pwdChk(@RequestBody MemberDTO memberDTO, Authentication authentication) throws Exception {
		boolean result = false;
		result = memberService.pwdChk(memberDTO, authentication);

		if (result) {
			System.out.println("성공");
			return 0;
		}
		System.out.println("실패");
		return 1;
	}

	@PostMapping("/auth/memberDropProc")
	public String memberDropProc(MemberDTO memberDTO, Authentication authentication, RedirectAttributes rttr)
			throws Exception {

		boolean pwdChk = false;
		pwdChk = memberService.pwdChk(memberDTO, authentication);

		if (pwdChk) {
			memberDTO.setMem_id(memberService.getId(authentication));
			if (memberService.memberDrop(memberDTO)) {

				System.out.println("성공");
				return "redirect:/member";
			} else {
				System.out.println("실패");

				return "redirect:/member/auth/memberDrop";
			}

		} else {
			System.out.println("실패 비번틀림");
			rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/member/auth/memberDrop";
		}
	}

	@PostMapping("/auth/memberModify")
	public String memberModifyPwdChk(MemberDTO memberDTO, Authentication authentication, RedirectAttributes rttr)
			throws Exception {
		if (!memberService.pwdChk(memberDTO, authentication)) {
			rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/member/auth/memberModify";
		} else {

			return "redirect:/member/auth/memberModifyNext";
		}

	}

	@GetMapping("/auth/memberModifyNext")
	public void memberModifyNext() {

	}

	@PostMapping("/auth/memberModifyNextProc")
	public String memberModifyNextProc(MemberDTO memberDTO, RedirectAttributes rttr) throws Exception {

		if (memberService.memberModify(memberDTO)) {

			return "redirect:/member/auth/orderList";
		}

		return "redirect:/member/auth/memberModifyNext";

	}

	// http://localhost:8090/member/productList?category_no=12
	@GetMapping("/productList")
	public void productList(@RequestParam("category_no") int category_no, Model model) throws Exception {
		model.addAttribute("categoryList", adminService.getCategoryList());
		model.addAttribute("category", adminService.categoryRead(category_no));
		System.out.println(category_no);
		model.addAttribute("productList", memberService.memberProductList(category_no));
	}

	@GetMapping("productRead")
	public void productRead(@RequestParam("product_no") int product_no, Model model) throws Exception {
		model.addAttribute("categoryList", adminService.getCategoryList());
		model.addAttribute("product", memberService.getProduct(product_no));

	}

	@ResponseBody
	@PostMapping("/auth/addCart")
	public int addCart(@RequestBody CartProductDTO cartProductDTO, Authentication authentication,
			RedirectAttributes rttr) throws Exception {

		cartProductDTO.setMem_id(memberService.getId(authentication));
		if (memberService.addCart(cartProductDTO) == 1) {
			return 1;
		} else {
			return 0;
		}
//	return "redirect:/member/auth/cartView";

	}

	@GetMapping("/auth/cartView")
	public void cartView(Authentication authentication, Model model) throws Exception {
//		cartProductDTO.setMem_id(memberService.getId(authentication));

		// memberService.cartList(memberService.getId(authentication));

		model.addAttribute("cartList", memberService.cartList(memberService.getId(authentication)));
	}

	@PostMapping("/auth/cartModify")
	public String cartModify(CartProductDTO cartProductDTO, Authentication authentication, Model model)
			throws Exception {
		int product_no = memberService.getProductNo(cartProductDTO.getProduct_name());

		cartProductDTO.setProduct_no(product_no);
		cartProductDTO.setMem_id(memberService.getId(authentication));

		memberService.cartModify(cartProductDTO);

		return "redirect:/member/auth/cartView";
	}

	@PostMapping("/auth/cartDelete")
	public String cartDelete(@RequestParam("product_name") String product_name, CartProductDTO cartProductDTO,
			Authentication authentication) throws Exception {

		cartProductDTO.setProduct_no(memberService.getProductNo(product_name));
		cartProductDTO.setMem_id(memberService.getId(authentication));
		memberService.cartDelete(cartProductDTO);

		return "redirect:/member/auth/cartView";
	}

	@PostMapping("/auth/cartSelectDelete")
	public String cartSelectDelete(@RequestParam(value = "cartIds", required = false) List<String> cartIds,
			CartProductDTO cartProductDTO, Authentication authentication) throws Exception {

		for (int i = 0; i < cartIds.size(); i++) {
			System.out.println(cartIds);
			cartProductDTO.setProduct_no(memberService.getProductNo(cartIds.get(i)));
			cartProductDTO.setMem_id(memberService.getId(authentication));
			memberService.cartDelete(cartProductDTO);

		}

		return "redirect:/member/auth/cartView";
	}

	@PostMapping("/auth/cartSelectOrder")
	public String cartSelectOrder(OrderDTO orderDTO, Model model, Authentication authentication) throws Exception {

		System.out.println(orderDTO.getOrderDetailList());

//		Calendar cal = Calendar.getInstance();
//		int year = cal.get(Calendar.YEAR);
//		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
//		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
//		String subNum = "";
//
//		for (int i = 1; i <= 6; i++) {
//			subNum += (int) (Math.random() * 10);
//		}
		model.addAttribute("orderList", orderDTO.getOrderDetailList());
		return "/member/auth/checkout";
	}

	@ResponseBody
	@PostMapping("/auth/checkout")
	public void checkout(@RequestBody OrderDTO orderDTO,
			Authentication authentication) throws Exception {
		String mem_id = memberService.getId(authentication);
		orderDTO.setMem_id(mem_id);
		memberService.orderInsert(orderDTO);
		
		
	}
	
	@PostMapping("/auth/orderDetails")
	public void orderDetails(@RequestParam HashMap<String, Object> orderDetailList,
			OrderDetailDTO orderDetailDTO,
			Authentication authentication) throws JsonMappingException, JsonProcessingException{
		String json = (String) orderDetailList.get("paramList");
		ObjectMapper mapper = new ObjectMapper();

		List<OrderDetailDTO> orderDetails = mapper.readValue(json, new TypeReference<List<OrderDetailDTO>>() {
		});
		String mem_id = memberService.getId(authentication);

		
		for (int i = 0; i < orderDetails.size(); i++) {
			System.out.println(orderDetails.size());
			Map<String,Object> map = new HashMap<String, Object>();
			int product_no = memberService.getProductNo(orderDetails.get(i).getProduct_name());
			
			orderDetails.get(i).setProduct_no(product_no);
			
			map.put("product_no", product_no);
			map.put("mem_id", mem_id);
			
			
			memberService.orderDetailInsert(orderDetails.get(i));
			memberService.orderCartDelete(map);
	
		}
		//return "redirect:/member/auth/cartView";
	}
//	@PostMapping("/auth/buyNow")
//	public void buyNow() {
//		
//	}
	
	@GetMapping("/auth/orderList")
	public void orderList() {
		
	}
}
