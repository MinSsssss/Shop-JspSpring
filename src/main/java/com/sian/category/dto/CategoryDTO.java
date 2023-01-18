package com.sian.category.dto;

import java.util.List;

import com.sian.product.dto.ProductDTO;

import lombok.Data;

@Data
public class CategoryDTO {
	private int category_no;
	
	private String category_name;
	
	private String category_class;
	
	private List<ProductDTO> productList;
}
