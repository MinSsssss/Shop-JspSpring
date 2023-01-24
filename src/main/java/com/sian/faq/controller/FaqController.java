package com.sian.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.sian.category.service.CategoryService;
import com.sian.common.page.Criteria;
import com.sian.common.page.PageDTO;
import com.sian.faq.dto.FaqDTO;
import com.sian.faq.service.FaqService;


import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class FaqController {
	
	private final FaqService faqService;
	
	private final CategoryService categoryService;
	
	/*
	 * ALL
	 */
	@GetMapping({"/faq/faqList","/admin/faq/faqList"})
	 public void faqList(@RequestParam("category_no")int category_no,Criteria cri,Model model) {
		
		 int total = 0;
		 if(category_no==0) {
			 model.addAttribute("faqList",faqService.faqList(cri));
			 total = faqService.getTotal();
			 
		 }
		 else {
			 
			 model.addAttribute("faqList",faqService.faqList(category_no,cri));
			 total = faqService.getTotal(category_no);
			 
		 }
		 model.addAttribute("category",categoryService.getCategoryList("faq"));
		
		PageDTO page = new PageDTO(cri, total);
			
		model.addAttribute("page",page);
	 }

	
	/*
	 * ADMIN ONLY
	 */
	@GetMapping({"/admin/faq/faqRead","/admin/faq/faqModify"})
	 public void faqRead(@RequestParam("faq_no")int faq_no,Model model)  {
		 
		 model.addAttribute("faq",faqService.getFaq(faq_no));
		 model.addAttribute("category",categoryService.getCategoryList("faq"));
	 }	 
	 
	 
	 @GetMapping("/admin/faq/faqRegister")
	 public void faqRegister(Model model)  {
		 
		 model.addAttribute("category",categoryService.getCategoryList("faq"));
	 }
	 
	 @PostMapping("/admin/faq/faqRegisterProc")
	 public String faqRegisterProc(FaqDTO faqDTO,RedirectAttributes rttr) {
		 
		 if(faqService.faqRegister(faqDTO)==1) {
			 rttr.addFlashAttribute("msg","successRegister");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failRegister");
		 }
		 
		 return "redirect:/admin/faq/faqList?category_no=0";
	 }
	 
	 @PostMapping("/admin/faq/faqModifyProc")
	 public String faqModifyProc(FaqDTO faqDTO,RedirectAttributes rttr) {
		 if(faqService.faqModify(faqDTO)==1) {
			 rttr.addFlashAttribute("msg","successModify");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failModify");
		 }
		 return "redirect:/admin/faq/faqList?category_no=0";
	 }
	 
	 @PostMapping("/admin/faq/faqDeleteProc")
	 public String faqDeleteProc(int faq_no,RedirectAttributes rttr) {
		 
		 if(faqService.faqDelete(faq_no)==1) {
			 rttr.addFlashAttribute("msg","successDelete");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failDelete");
		 }
		 
		 return "redirect:/admin/faq/faqList?category_no=0";
	 }
	/*
	 * MEMBER ONLY @PreAuthorize("hasRole('ROLE_MEMBER')")
	 */
	
	
	 
}
