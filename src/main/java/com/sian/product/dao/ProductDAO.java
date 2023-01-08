package com.sian.product.dao;

import java.util.List;

import com.sian.product.dto.ProductDTO;


public interface ProductDAO {
	public void insert(ProductDTO productDTO) ;
	
	public List<ProductDTO> getList() ;

	public List<ProductDTO> memberProductList(int category_no) ;
	
	public ProductDTO getProduct(int product_no) ;
	
	public int getProductNo(String product_name);
	
	public int productModify(ProductDTO productDTO);
}