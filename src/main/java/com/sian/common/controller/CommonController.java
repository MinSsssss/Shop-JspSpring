package com.sian.common.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.sian.category.service.CategoryService;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@ControllerAdvice
public class CommonController {
	private final CategoryService categoryService;
	
	@ModelAttribute
	public void categoryAdvice(Model model) {
		model.addAttribute("categoryList",categoryService.getCategoryList("product"));
	}
}
