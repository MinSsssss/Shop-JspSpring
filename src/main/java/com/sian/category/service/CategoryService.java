package com.sian.category.service;

import java.util.List;

import com.sian.category.dto.CategoryDTO;

public interface CategoryService {
	public void categoryRegister(CategoryDTO categoryDTO) ;
	
	public List<CategoryDTO> getCategoryList(String category_class) ;
	
	public int categoryDelete(int category_no);
	
	public String getCategoryClass(int category_no);
	
	public CategoryDTO categoryRead(int category_no);
}
