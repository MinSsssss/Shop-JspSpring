package com.sian.product.controller;


import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	@GetMapping("/product/productList")
	public void productList(@RequestParam(value = "category_no", required = false) int category_no, 
			Model model,Criteria cri,RedirectAttributes rttr) {
		List<ProductDTO> productList = null;
		if(cri.getKeyword()==null) {
			model.addAttribute("categoryList", categoryService.getCategoryList("product"));
			model.addAttribute("category", categoryService.categoryRead(category_no));
			productList = productService.memberProductList(category_no);
			
			
		}
		else {
			productList = productService.productList(cri);
			System.out.println(productList.size());
			if(productList.size() == 0) {
				model.addAttribute("searchNull" , "검색하신 상품을 찾을수 없습니다.");

			}

		}
		
		for(ProductDTO product : productList) {
			product.setProduct_thumb_img(product.getProduct_thumb_img().replace("s_",""));
		}
		model.addAttribute("productList", productList);
		
		
	}

	@GetMapping({ "/product/productRead"})
	public void productRead(@RequestParam("product_no") int product_no, Model model,
			   HttpServletRequest request,
               HttpServletResponse response) {
		
		Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	        }
	    }

	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + product_no + "]")) {
	            productService.productReadCount(product_no);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + product_no + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	productService.productReadCount(product_no);
	        Cookie newCookie = new Cookie("postView","[" + product_no + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
		
		
		
		ProductDTO product = productService.getProduct(product_no);
		
		String thumbImg = product.getProduct_thumb_img();
		System.out.println(thumbImg);
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
		
		 
		
		
	}

	/*
	 * ADMIN ONLY
	 */

	@GetMapping("/admin/product/productList")
	public void adminProductList(@RequestParam("category_no")int category_no,Criteria cri,Model model) {
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
		
		PageDTO page = new PageDTO(cri, total);
		
		model.addAttribute("page",page);
	}

	@GetMapping("/admin/product/productRegister")
	public void productRegister(Model model) {
		model.addAttribute("categoryList", categoryService.getCategoryList("product"));
	}

	@PostMapping("/admin/product/productRegisterProc")
	public String productRegisterProc(ProductDTO productDTO) {
		
//		if (productDTO.getAttachList() != null) {
//			productDTO.getAttachList().forEach(attach -> System.out.println(attach));
//		}

		productService.productRegister(productDTO);

		return "redirect:/admin/product/productList?category_no=0";
	}

	@PostMapping("/admin/product/productModifyProc")
	public String productModifyProc(ProductDTO productDTO) {
		System.out.println(productDTO);
		productService.productModify(productDTO);

		return "redirect:/admin/product/productList?category_no=0";

	}

	 @GetMapping({"/admin/product/productRead","/admin/product/productModify" })
	 public void productModify(@RequestParam("product_no")int product_no,Model model) {
		ProductDTO product = productService.getProduct(product_no);
		String thumbImg = product.getProduct_thumb_img();
		 	

		List<String> images = productService.imgList(product_no);
		
		
			/*
			 * productModify 대표사진위치변경
			 */
			
		images.remove(images.indexOf(thumbImg));
		images.add(0, thumbImg);
		product.setProduct_imgs(images);

		product.setAttachList(productService.getAttachList(product_no));

		model.addAttribute("product", product);

		model.addAttribute("categoryList", categoryService.getCategoryList("product"));

		model.addAttribute("reviewList", reviewService.getReviewList(product_no));

	
		 
	 }
	 
	 
	 
	/*
	 * MEMBER ONLY @PreAuthorize("hasRole('ROLE_MEMBER')")
	 */

}
