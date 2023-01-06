package com.sian.mapper;

import java.util.List;

import com.sian.domain.CategoryDTO;

public interface CategoryMapper {
	public void insert(CategoryDTO categoryDTO);
	
	public List<CategoryDTO> getList(String category_class) ;
	
	public CategoryDTO categoryRead(int category_no) ;
	
	public int categoryDelete(int category_no);
	
	public String getCategoryClass(int category_no);
}
