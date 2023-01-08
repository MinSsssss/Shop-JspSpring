package com.sian.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sian.cart.service.CartService;
import com.sian.category.service.CategoryService;
import com.sian.member.service.MemberService;
import com.sian.product.dto.ProductDTO;
import com.sian.product.service.ProductService;
import com.sian.review.service.ReviewService;
import com.sian.wish.service.WishService;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ProductController {
	private final ProductService productService;
	private final CategoryService categoryService;
	private final ReviewService reviewService;
	
	
	/*
	 * ALL
	 */
	@GetMapping("/product/productList")
	public void productList(@RequestParam(value="category_no",required = false) int category_no, Model model)  {
		model.addAttribute("categoryList", categoryService.getCategoryList("product"));
		model.addAttribute("category", categoryService.categoryRead(category_no));
		System.out.println(category_no);
		model.addAttribute("productList", productService.memberProductList(category_no));
	}
	 @GetMapping({"/product/productRead","/admin/product/productRead","/admin/product/productModify"})
	 public void productRead(@RequestParam("product_no")int product_no,Model model) {
		 ProductDTO product = productService.getProduct(product_no);
		 if(product.getCategory_name()==null) {
			 product.setCategory_name("카테고리없음");
		 }
		 model.addAttribute("product",product);
		 
		 model.addAttribute("category",categoryService.getCategoryList("product"));
		 
		 model.addAttribute("reviewList", reviewService.getReviewList(product_no));
		 
	 }

	
	/*
	 * ADMIN ONLY
	 */
	@GetMapping("/admin/product/productList")
	public void adminProductList(
			/* @RequestParam(value="category_no",required = false) int category_no, */Model model)  {
		model.addAttribute("categoryList", categoryService.getCategoryList("product"));
	
		model.addAttribute("productList", productService.getProductList());
	}
	
	@GetMapping("/admin/product/productRegister")
	public void productRegister(Model model) {
		model.addAttribute("categoryList",categoryService.getCategoryList("product"));
	}
	
	 @PostMapping("/admin/product/productRegisterProc") 
	 public String productRegisterProc(ProductDTO productDTO) {
		 
		 productService.productRegister(productDTO);
		 return "redirect:/admin/product/productList";
	 }

//	 @GetMapping({"/admin/product/productRead","/admin/product/productModify"})
//	 public void productRead(@RequestParam("product_no")int product_no,Model model) {
//		 ProductDTO product = productService.getProduct(product_no);
//		 if(product.getCategory_name()==null) {
//			 product.setCategory_name("카테고리없음");
//		 }
//		 model.addAttribute("product",product);
//		 
//		 model.addAttribute("category",categoryService.getCategoryList("product"));
//		 
//		 model.addAttribute("reviewList", reviewService.getReviewList(product_no));
//		 
//	 }
	/*
	 * MEMBER ONLY @PreAuthorize("hasRole('ROLE_MEMBER')")
	 */
	

	

	
}
