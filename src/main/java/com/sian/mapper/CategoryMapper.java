package com.sian.mapper;

import java.util.List;

import com.sian.domain.CategoryDTO;

public interface CategoryMapper {
	public void insert(CategoryDTO categoryDTO);
	
	public List<CategoryDTO> getList() throws Exception;
}
