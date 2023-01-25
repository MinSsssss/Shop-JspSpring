package com.sian.product.service;

import java.util.List;

import com.sian.common.page.Criteria;
import com.sian.product.dto.ProductAttachDTO;
import com.sian.product.dto.ProductDTO;

public interface ProductService {
	
	
	public List<ProductDTO> memberProductList(int category_no);
	
	public int getTotal(Criteria cri);
	
	public int getTotal(int category_no);
	
	public List<ProductDTO> productList(Criteria cri);
	
	public List<ProductDTO> productList(int category_no,Criteria cri);
	
	public ProductDTO getProduct(int product_no);
	
	public int getProductNo(String product_name);
	
	public void productRegister(ProductDTO productDTO) ;
	
	public List<ProductDTO> getProductList();
	
	public List<ProductAttachDTO> getAttachList(int product_no);
	
	public void productModify(ProductDTO productDTO);
	
	public List<String> imgList(int product_no);
	
	public List<String> originImgList(int product_no);
	
	public long productReadCount(int product_no);
}
