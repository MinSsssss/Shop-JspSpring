package com.sian.category.controller;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sian.category.dto.CategoryDTO;
import com.sian.category.service.CategoryService;



import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	
	private final CategoryService categoryService;
	
	/*
	 * 카테고리 리스트 조회 
	 */
	@GetMapping("/categoryList/{category_class}")
	public String categoryList(Model model,@PathVariable("category_class") String category_class) {
		
		if(category_class.equals("product")) {
			model.addAttribute("title", "상품");
			
		}
		else if(category_class.equals("faq")) {
			model.addAttribute("title", "FAQ");
		}
		else if(category_class.equals("qna")) {
			model.addAttribute("title","QNA");
		}
		
		model.addAttribute("category_class",category_class);
		model.addAttribute("categoryList",categoryService.getCategoryList(category_class));
		
		return "/admin/category/categoryList";
	}
	
	/*
	 * 단일 카테고리 조회
	 */
	@GetMapping("/categoryRead/{category_no}")
	public String categoryRead(@PathVariable("category_no") int category_no, Model model)  {
		
		model.addAttribute("category", categoryService.categoryRead(category_no));
		
		return "/admin/category/categoryRead";
	}
	
	/*
	 * 카테고리 생성 페이지
	 */
	@GetMapping("/categoryRegister/{category_class}")
	public String categoryRegister(
		@PathVariable("category_class") String category_class,Model model) {
		
		if(category_class.equals("product")) {
			model.addAttribute("title", "상품");
		}
		else if(category_class.equals("faq")) {
			model.addAttribute("title", "FAQ");
		}
		else if(category_class.equals("qna")) {
			model.addAttribute("title","QNA");
		}
		
		model.addAttribute("category_class",category_class);
		return "/admin/category/categoryRegister";
	}
	
	/*
	 *  카테고리 생성
	 */
	@PostMapping("/categoryRegisterProc")
	public String catrgoryRegisterProc(
			CategoryDTO categoryDTO,RedirectAttributes rttr){
		
		String category_class=categoryDTO.getCategory_class();
		try {
			categoryService.categoryRegister(categoryDTO);
			rttr.addFlashAttribute("msg","successRegister");
			return "redirect:/admin/category/categoryRead/"+categoryDTO.getCategory_no();
			
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg","uniqueRegister");
			return "redirect:/admin/category/categoryRegister/"+category_class;
		}

	}
	
	
	
	/*
	 * 카테고리 삭제
	 */

	@PostMapping("/categoryDeleteProc")
	 public String categoryDeleteProc(int category_no,RedirectAttributes rttr) {
		 String category_class= categoryService.getCategoryClass(category_no);
		 
		 if(categoryService.categoryDelete(category_no)==1) {
			 rttr.addFlashAttribute("msg","successDelete");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failDelete");
		 }
		 
		 return "redirect:/admin/category/categoryList/"+category_class;
	 }
	
	
	
	

}
