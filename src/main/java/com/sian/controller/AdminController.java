package com.sian.controller;



import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sian.domain.CategoryDTO;
import com.sian.domain.FaqDTO;
import com.sian.domain.NoticeDTO;
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
	public String categoryRegister(@RequestParam("category_class") String category_class,Model model) {
		if(category_class.equals("product")) {
			model.addAttribute("title", "상품");
		}
		else if(category_class.equals("faq")) {
			model.addAttribute("title", "FAQ");
		}
		
		model.addAttribute("category_class",category_class);
		return "/admin/categoryRegister";
	}
	
	@GetMapping("/categoryList")
	public void categoryList(Model model,@RequestParam("category_class") String category_class)throws Exception {
		System.out.println(category_class);
		if(category_class.equals("product")) {
			model.addAttribute("title", "상품");
			
		}
		else if(category_class.equals("faq")) {
			model.addAttribute("title", "FAQ");
		}
		model.addAttribute("category_class",category_class);
		model.addAttribute("categoryList",adminService.getCategoryList(category_class));
	}

	@PostMapping("/categoryRegisterProc")
	public String catrgoryRegisterProc(CategoryDTO categoryDTO) throws Exception {
		System.out.println(categoryDTO.getCategory_name());
		adminService.categoryRegister(categoryDTO);
		return "redirect:/admin";
	}

	
	@PostMapping("/categoryDeleteProc")
	 public String categoryDeleteProc(int category_no,RedirectAttributes rttr) {
		 String category_class= adminService.getCategoryClass(category_no);
		 
		 if(adminService.categoryDelete(category_no)==1) {
			 rttr.addFlashAttribute("msg","successDelete");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failDelete");
		 }
		 
		 return "redirect:/admin/categoryList?category_class="+category_class;
	 }
	
	@GetMapping("/categoryRead")
	public void categoryRead(@RequestParam("category_no")int category_no, Model model) throws Exception {
		System.out.println(category_no);
		model.addAttribute("category", adminService.categoryRead(category_no));
	}
	
	
	
	@GetMapping("/productRegister")
	public void productRegister(Model model) throws Exception{
		model.addAttribute("categoryList",adminService.getCategoryList("product"));
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
	

	 
	 
	 @GetMapping("/qnaList")
	 public void qnaList() {
		 
	 }
	 

	 
	 @GetMapping("/faqList")
	 public String faqList(@RequestParam("category_no")int category_no ,Model model) throws Exception{
		 
		 if(category_no==0) {
			 model.addAttribute("faqList",adminService.faqList());
		 }
		 else {
			 model.addAttribute("faqList",adminService.selectFaqList(category_no));
		 }
		 model.addAttribute("category",adminService.getCategoryList("faq"));
		 
		 return "/admin/faqList";
		 
	 }
	 @GetMapping({"/faqRead","/faqModify"})
	 public void faqRead(@RequestParam("faq_no")int faq_no,Model model) throws Exception {
		 
		 model.addAttribute("faq",adminService.getFaq(faq_no));
		 model.addAttribute("category",adminService.getCategoryList("faq"));
	 }	 
	 
	 
	 @GetMapping("/faqRegister")
	 public void faqRegister(Model model) throws Exception {
		 
		 model.addAttribute("category",adminService.getCategoryList("faq"));
	 }
	 
	 @PostMapping("/faqRegisterProc")
	 public String faqRegisterProc(FaqDTO faqDTO,RedirectAttributes rttr) {
		 
		 if(adminService.faqRegister(faqDTO)==1) {
			 rttr.addFlashAttribute("msg","successRegister");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failRegister");
		 }
		 
		 return "redirect:/admin/faqList?category_no=0";
	 }
	 
	 @PostMapping("/faqModifyProc")
	 public String faqModifyProc(FaqDTO faqDTO,RedirectAttributes rttr) {
		 if(adminService.faqModify(faqDTO)==1) {
			 rttr.addFlashAttribute("msg","successModify");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failModify");
		 }
		 return "redirect:/admin/faqList?category_no=0";
	 }
	 
	 @PostMapping("/faqDeleteProc")
	 public String faqDeleteProc(int faq_no,RedirectAttributes rttr) {
		 
		 if(adminService.faqDelete(faq_no)==1) {
			 rttr.addFlashAttribute("msg","successDelete");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failDelete");
		 }
		 
		 return "redirect:/admin/faqList?category_no=0";
	 }
	 
	 @GetMapping("/noticeList")
	 public String noticeList(Model model) {
		 
		 model.addAttribute("noticeList", adminService.noticeList());
		 
		 return "/admin/noticeList";
	 }
	 @GetMapping("/noticeRegister")
	 public void noticeRegister() {
		 
	 }
	 @GetMapping("/noticeRead")
	 public String noticeRead(@RequestParam("notice_no") int notice_no,Model model) {
		 model.addAttribute("notice", adminService.getNotice(notice_no));
		 return "/admin/noticeRead";
	 }
	 
	 @PostMapping("/noticeRegisterProc")
	 public String noticeRegisterProc(NoticeDTO noticeDTO,RedirectAttributes rttr) {
		 if(adminService.noticeRegister(noticeDTO)==1) {
			 rttr.addFlashAttribute("msg","successRegister");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failRegister");
		 }
		 return "redirect:/admin/noticeList";
	 }
	 @PostMapping("/noticeModifyProc")
	 public String noticeModifyProc(NoticeDTO noticeDTO,RedirectAttributes rttr) {
		 if(adminService.noticeModify(noticeDTO)==1) {
			 rttr.addFlashAttribute("msg","successModify");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failModify");
		 }
		 return "redirect:/admin/noticeList";
	 }
	 
	 @PostMapping("/noticeDeleteProc")
	 public String noticeDeleteProc(int notice_no,RedirectAttributes rttr) {
		 
		 if(adminService.noticeDelete(notice_no)==1) {
			 rttr.addFlashAttribute("msg","successDelete");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failDelete");
		 }
		 
		 return "redirect:/admin/noticeList";
	 }
	 
	 
	 
}
