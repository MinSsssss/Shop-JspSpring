package com.sian.mapper;

import java.util.List;

import com.sian.domain.ProductDTO;


public interface ProductMapper {
	public void insert(ProductDTO productDTO) ;
	
	public List<ProductDTO> getList() ;

	public List<ProductDTO> memberProductList(int category_no) ;
	
	public ProductDTO getProduct(int product_no) ;
	
	public int getProductNo(String product_name);
}
