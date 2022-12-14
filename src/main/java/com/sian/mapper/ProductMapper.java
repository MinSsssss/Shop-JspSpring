package com.sian.mapper;

import java.util.List;

import com.sian.domain.ProductDTO;


public interface ProductMapper {
	public void insert(ProductDTO productDTO) throws Exception;
	
	public List<ProductDTO> getList() throws Exception;
/*
 * 
 * 
 * public CategoryDTO categoryRead(int category_no) throws Exception;
 * 
 * public int delete() throws Exception;
 */
}
