package com.sian.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.sian.domain.CategoryDTO;
import com.sian.domain.ProductDTO;
import com.sian.service.AdminService;
import com.sian.service.MemberService;

import lombok.AllArgsConstructor;
@AllArgsConstructor
@Controller
@RequestMapping("/admin/**")
public class AdminController {
	private AdminService adminService;
	
	@GetMapping("/memberList")
	public void memberList(Model model) throws Exception{
		model.addAttribute("memberList",adminService.getMemberList());
	}
	@GetMapping("/categoryRegister")
	public void categoryRegister() {
		
	}
	@GetMapping("/categoryList")
	public void categoryList(Model model)throws Exception {
		model.addAttribute("categoryList",adminService.getCategoryList());
	}
	@PostMapping("/categoryRegisterProc")
	public String catrgoryRegisterProc(CategoryDTO categoryDTO) throws Exception {
		System.out.println(categoryDTO.getCategory_name());
		adminService.categoryRegister(categoryDTO);
		return "redirect:/admin";
	}
	@PostMapping("/categoryRemove")
	public int categoryRemove(CategoryDTO categoryDTO) throws Exception{
		return 1;
	}
	@GetMapping("/categoryRead")
	public void categoryRead(@RequestParam("category_no")int category_no, Model model) throws Exception {
		System.out.println(category_no);
		model.addAttribute("categoryRead", adminService.categoryRead(category_no));
	}
	
	@GetMapping("/productRegister")
	public void productRegister(Model model) throws Exception{
		model.addAttribute("categoryList",adminService.getCategoryList());
	}
	
	 @PostMapping("/productRegisterProc") 
	 public String productRegisterProc(ProductDTO productDTO) throws Exception{
		 adminService.productRegister(productDTO);
		 return "redirect:/admin";
	 }
	 @GetMapping("/productList")
	 public void productList(Model model)throws Exception {
		 model.addAttribute("productList",adminService.getProductList());
	 }
	
	
	
}
