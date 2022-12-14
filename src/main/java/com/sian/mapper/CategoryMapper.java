package com.sian.mapper;

import java.util.List;

import com.sian.domain.CategoryDTO;

public interface CategoryMapper {
	public void insert(CategoryDTO categoryDTO);
	
	public List<CategoryDTO> getList() throws Exception;
	
	public CategoryDTO categoryRead(int category_no) throws Exception;
	
	public int delete() throws Exception;
}
