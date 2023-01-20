package com.sian.product.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

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
import com.sian.product.dto.ProductAttachDTO;
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
	public void productList(@RequestParam(value = "category_no", required = false) int category_no, Model model) {
		model.addAttribute("categoryList", categoryService.getCategoryList("product"));
		model.addAttribute("category", categoryService.categoryRead(category_no));
		List<ProductDTO> productList = productService.memberProductList(category_no);
		
		for(ProductDTO product : productList) {
			product.setProduct_thumb_img(product.getProduct_thumb_img().replace("s_",""));
		}
		model.addAttribute("productList", productList);
	}

	@GetMapping({ "/product/productRead"})
	public void productRead(@RequestParam("product_no") int product_no, Model model) {
		ProductDTO product = productService.getProduct(product_no);
		
		String thumbImg = product.getProduct_thumb_img();
		String originImg = thumbImg.replace("s_","");
		
		List<String> images = productService.imgList(product_no);
		List<String> originImages = productService.originImgList(product_no);
		
		product.setProduct_thumb_img(originImg);

		product.setProduct_imgs(images);
		product.setOrigin_imgs(originImages);
		
		model.addAttribute("product",product);
		 
		model.addAttribute("category",categoryService.getCategoryList("product"));
		 
		model.addAttribute("reviewList", reviewService.getReviewList(product_no));
	}

	/*
	 * ADMIN ONLY
	 */

	@GetMapping("/admin/product/productList")
	public void adminProductList(@RequestParam("category_no")int category_no,Criteria cri,Model model) {
		 int total = 0;
		 if(category_no==0) {
			 model.addAttribute("productList",productService.productList(cri));
			 total = productService.getTotal();
		 }
		 else {
			 System.out.println("category : " + category_no);
			 model.addAttribute("productList",productService.productList(category_no,cri));
			 System.out.println("category : " + category_no);
			 total = productService.getTotal(category_no);
			 System.out.println("category : " + category_no);
			 
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

		if (productDTO.getAttachList() != null) {
			productDTO.getAttachList().forEach(attach -> System.out.println(attach));
		}

		productService.productRegister(productDTO);

		return "redirect:/admin/product/productList";
	}

	@PostMapping("/admin/product/productModifyProc")
	public String productModifyProc(ProductDTO productDTO) {
		System.out.println("카테고리이름" + productDTO.getCategory_name());
		System.out.println("카테고리번호" + productDTO.getCategory_no());
		
		productService.productModify(productDTO);

		return "redirect:/admin/product/productList";

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
