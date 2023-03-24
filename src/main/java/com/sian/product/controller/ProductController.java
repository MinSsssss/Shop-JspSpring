package com.sian.product.controller;


import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sian.category.service.CategoryService;
import com.sian.common.page.Criteria;
import com.sian.common.page.PageDTO;

import com.sian.product.dto.ProductDTO;
import com.sian.product.service.ProductService;
import com.sian.review.dto.ReviewDTO;
import com.sian.review.service.ReviewService;

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
	/*
	 * 상품 리스트 조회
	 */
	@GetMapping("/product/productList/{category_no}")
	public String productList(@PathVariable("category_no") int category_no, 
			Model model,Criteria cri,RedirectAttributes rttr) {
		List<ProductDTO> productList = null;
		if(cri.getKeyword()==null) {
			
			model.addAttribute("category", categoryService.categoryRead(category_no));
			productList = productService.memberProductList(category_no);
			
			
		}
		else {
			productList = productService.productList(cri);
			System.out.println(cri);
			if(productList.size() == 0) {
				model.addAttribute("searchNull" , "검색하신 상품을 찾을수 없습니다.");

			}

		}
		
		for(ProductDTO product : productList) {
			product.setProduct_thumb_img(product.getProduct_thumb_img().replace("s_",""));
		}
		model.addAttribute("productList", productList);
		
		return "/product/productList";		
	}
	/*
	 * 상품 단일 조회
	 */
	@GetMapping("/product/productRead/{product_no}")
	public String productRead(HttpServletResponse response,
			@PathVariable("product_no") int product_no, Model model,
			@CookieValue(name = "view") String cookie
			) throws ClassNotFoundException, SQLException {
	
		if(!(cookie.contains(String.valueOf(product_no)))) {
			cookie += product_no + "/";
			productService.productReadCount(product_no);
			
		}
		response.addCookie(new Cookie("view",cookie));
		
		ProductDTO product = productService.getProduct(product_no);
		
		String thumbImg = product.getProduct_thumb_img();
		
		String originImg = thumbImg.replace("s_","");
		
		List<String> images = productService.imgList(product_no);
		List<String> originImages = productService.originImgList(product_no);
		
		images.remove(images.indexOf(thumbImg));
		images.add(0, thumbImg);
		
		originImages.remove(originImages.indexOf(originImg));
		originImages.add(0, originImg);
		
		product.setProduct_thumb_img(originImg);

		product.setProduct_imgs(images);
		product.setOrigin_imgs(originImages);
		
		List<ReviewDTO> reviewList = reviewService.getReviewList(product_no);
		product.setReviewList(reviewList);
		
		product.setReviewCount(reviewList.size());
		
		double total = 0;
		for(ReviewDTO review :reviewList) {
			total += review.getReview_star();	
		}
		if(reviewList.size()!=0) {
			
			product.setReviewAvg((double)(total/reviewList.size()));
		}	
		
		model.addAttribute("product",product);
		 
		model.addAttribute("category",categoryService.getCategoryList("product"));
		
		
		return "/product/productRead";
	}

	
	
	
	/*
	 * ADMIN ONLY
	 */
	
	/*
	 * 상품 리스트 조회  
	 */
	@GetMapping("/admin/product/productList/{category_no}")
	public String adminProductList(@PathVariable("category_no")int category_no,Criteria cri,Model model) {
		 int total = 0;
		 if(category_no==0) {
			 model.addAttribute("productList",productService.productList(cri));
			 total = productService.getTotal(cri);
		 }
		 else {
			 
			 model.addAttribute("productList",productService.productList(category_no,cri));
			 
			 total = productService.getTotal(category_no); 
		 }
		 
		 model.addAttribute("category",categoryService.getCategoryList("product"));
			
		 model.addAttribute("category_no",category_no);
		 
		 model.addAttribute("page",new PageDTO(cri, total));
		 
		 return "/admin/product/productList";
	}

	/*
	 * 상품 등록 페이지
	 */
	@GetMapping("/admin/product/productRegister")
	public void productRegister(Model model) {
		model.addAttribute("categoryList",categoryService.getCategoryList("product"));
	}
	
	/*
	 * 상품 등록
	 */
	@PostMapping("/admin/product/productRegisterProc")
	public String productRegisterProc(ProductDTO productDTO,RedirectAttributes rttr) {
		
		try {
			productService.productRegister(productDTO);
			rttr.addFlashAttribute("msg","successRegister");
			
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg","uniqueRegister");
			return "redirect:/admin/product/productRegister";
		}
		
		
		return "redirect:/admin/product/productRead/"+productDTO.getProduct_no();
	}
	
	
	
	/*
	 * 상품 단일 조회 및 상품 수정 페이지
	 */
	 @GetMapping({"/admin/product/productRead/{product_no}",
		 		  "/admin/product/productModify/{product_no}" })
	 public String productModify(@PathVariable("product_no")int product_no,Model model,
			 HttpServletRequest req) {
		ProductDTO product = productService.getProduct(product_no);
		String thumbImg = product.getProduct_thumb_img();
		 

		List<String> images = productService.imgList(product_no);
		
			
		images.remove(images.indexOf(thumbImg));
		images.add(0, thumbImg);
		product.setProduct_imgs(images);

		product.setAttachList(productService.getAttachList(product_no));
		
		model.addAttribute("categoryList",categoryService.getCategoryList("product"));
		
		model.addAttribute("product", product);

		String uri = req.getRequestURI().toString().replace("/"+product_no, "");
		
		return uri;
 
	 }
	 
 	/*
	 * 상품 수정
	 */
	@PostMapping("/admin/product/productModifyProc")
	public String productModifyProc(ProductDTO productDTO,RedirectAttributes rttr) {
		try {
			productService.productModify(productDTO);
			rttr.addFlashAttribute("msg","successModify");
			
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg","uniqueRegister");
			return "redirect:/admin/product/productModify/"+productDTO.getProduct_no();
		}
		
		return "redirect:/admin/product/productRead/"+productDTO.getProduct_no();

	}
	/*
	 * 상품 삭제
	 */
	
	@PostMapping("/admin/product/productDeleteProc")
	public String productDeleteProc(int product_no,RedirectAttributes rttr) {
		if(!productService.productDelete(product_no)) {
			rttr.addFlashAttribute("msg","failDelete");
			return "redirect:/admin/product/productRead/"+product_no;
		}
		rttr.addFlashAttribute("msg","successDelete");
		return "redirect:/admin/product/productList/0?pageNum=0&amount=5";
	}
		
}
