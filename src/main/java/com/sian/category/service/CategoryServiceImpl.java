package com.sian.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sian.category.dao.CategoryDAO;
import com.sian.category.dto.CategoryDTO;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RequiredArgsConstructor
@Service
public class CategoryServiceImpl implements CategoryService{
	
	private final CategoryDAO categoryDAO;
	
	
	@Override
	public void categoryRegister(CategoryDTO categoryDTO)  {
		categoryDAO.insert(categoryDTO);
	}

	@Override
	public List<CategoryDTO> getCategoryList(String category_class)  {
		
		return categoryDAO.getList(category_class);
	}

	@Override
	public int categoryDelete(int category_no)  {
		
		return categoryDAO.categoryDelete(category_no);
	}

	@Override
	public CategoryDTO categoryRead(int category_no)  {
		
		return categoryDAO.categoryRead(category_no);
	}
	@Override
	public String getCategoryClass(int category_no) {
		
		return categoryDAO.getCategoryClass(category_no);
	}
}
