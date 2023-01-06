package com.sian.category.dao;

import java.util.List;

import com.sian.category.dto.CategoryDTO;

public interface CategoryDAO {
	public void insert(CategoryDTO categoryDTO);
	
	public List<CategoryDTO> getList(String category_class) ;
	
	public CategoryDTO categoryRead(int category_no) ;
	
	public int categoryDelete(int category_no);
	
	public String getCategoryClass(int category_no);
}
