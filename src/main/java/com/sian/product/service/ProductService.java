package com.sian.product.service;

import java.util.List;

import com.sian.common.page.Criteria;
import com.sian.product.dto.ProductDTO;

public interface ProductService {
	
	
	public List<ProductDTO> memberProductList(int category_no);
	
	public int getTotal();
	
	public List<ProductDTO> getListPaging(Criteria cri);
	
	public ProductDTO getProduct(int product_no);
	
	public int getProductNo(String product_name);
	
	public void productRegister(ProductDTO productDTO) ;
	
	public List<ProductDTO> getProductList() ;
	
	
}
