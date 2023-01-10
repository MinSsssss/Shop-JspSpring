package com.sian.product.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sian.cart.service.CartService;
import com.sian.category.service.CategoryService;
import com.sian.common.page.Criteria;
import com.sian.common.page.PageDTO;
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
//	@GetMapping("/admin/product/productList")
//	public void adminProductList(Model model)  {
//		model.addAttribute("categoryList", categoryService.getCategoryList("product"));
//	
//		model.addAttribute("productList", productService.getProductList());
//	}
	@GetMapping("/admin/product/productList")
	public void adminProductList(Model model,Criteria cri)  {
		model.addAttribute("categoryList", categoryService.getCategoryList("product"));
		
		model.addAttribute("productList", productService.getListPaging(cri));
		
		int totaol = productService.getTotal();
		
		PageDTO page = new PageDTO(cri, totaol);
		
		model.addAttribute("page",page);
	}
	
	
	@GetMapping("/admin/product/productRegister")
	public void productRegister(Model model) {
		model.addAttribute("categoryList",categoryService.getCategoryList("product"));
	}
	
	
	 @PostMapping("/admin/product/productRegisterProc") 
		public String productRegisterProc(ProductDTO productDTO) {
		 	System.out.println(productDTO.getProduct_thumb_img());
		 	
		 	if(productDTO.getAttachList() != null) {
		 		productDTO.getAttachList().forEach(attach -> System.out.println(attach));
		 		
		 		
		 	}
		 	
		 	try {
				String deCoderThumbURL = URLDecoder.decode(productDTO.getProduct_thumb_img(),"UTF-8");
				
				productDTO.setProduct_thumb_img(deCoderThumbURL);
				productService.productRegister(productDTO);
				
			} catch (UnsupportedEncodingException e) {
				
				e.printStackTrace();
			}
		 	
		 	
			 
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
