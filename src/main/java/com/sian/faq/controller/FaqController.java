package com.sian.faq.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	
	/*
	 * faq 리스트 조회
	 */
	@GetMapping({"/faq/faqList/{category_no}","/admin/faq/faqList/{category_no}"})
	 public String faqList(@PathVariable("category_no")int category_no,Criteria cri,
			 Model model,HttpServletRequest req) {
		 
		 
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
			
		 model.addAttribute("page",new PageDTO(cri, total));
		
		
		 model.addAttribute("category_no",category_no);
		
		
		 String uri = req.getRequestURI().toString().replace("/"+category_no, "");
		
		 return uri;
		
		
	 }
	@GetMapping({"/admin/faq/faqRead/{faq_no}","/admin/faq/faqModify/{faq_no}"})
	 public String faqRead(@PathVariable("faq_no")int faq_no,Model model,
			 HttpServletRequest req)  {
		
		model.addAttribute("faq",faqService.getFaq(faq_no));
		model.addAttribute("category",categoryService.getCategoryList("faq"));

		String uri = req.getRequestURI().toString().replace("/"+faq_no, "");
	
		return uri;
	 }	 
	
	
	/*
	 * ADMIN ONLY
	 */
	
	/*
	 * faq 조회 및 수정 페이지
	 */
	
	 
	 /*
	  * faq 생성 페이지
	  */
	 @GetMapping("/admin/faq/faqRegister")
	 public void faqRegister(Model model)  {
		 
		 model.addAttribute("category",categoryService.getCategoryList("faq"));
	 }
	 
	 /*
	  * faq 생성
	  */
	 @PostMapping("/admin/faq/faqRegisterProc")
	 public String faqRegisterProc(FaqDTO faqDTO,RedirectAttributes rttr) {
		 
		 if(faqService.faqRegister(faqDTO)) {
			 rttr.addFlashAttribute("msg","successRegister");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failRegister");
		 }
		
		 return "redirect:/admin/faq/faqRead/"+faqDTO.getFaq_no();
	 }
	 
	 /*
	  * faq 수정
	  */
	 @PostMapping("/admin/faq/faqModifyProc")
	 public String faqModifyProc(FaqDTO faqDTO,RedirectAttributes rttr) {
		 if(faqService.faqModify(faqDTO)) {
			 rttr.addFlashAttribute("msg","successModify");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failModify");
		 }
		 return "redirect:/admin/faq/faqRead/"+faqDTO.getFaq_no();
	 }
	 
	 /*
	  * faq 삭제
	  */
	 @PostMapping("/admin/faq/faqDeleteProc")
	 public String faqDeleteProc(int faq_no,RedirectAttributes rttr) {
		 
		 if(faqService.faqDelete(faq_no)) {
			 rttr.addFlashAttribute("msg","successDelete");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failDelete");
		 }
		 
		 return "redirect:/admin/faq/faqList/0?pageNum=0&amount=5";
	 }

	 
}
