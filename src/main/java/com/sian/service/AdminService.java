package com.sian.service;

import java.util.List;

import com.sian.domain.CategoryDTO;
import com.sian.domain.MemberDTO;
import com.sian.domain.ProductDTO;

public interface AdminService {
	public List<MemberDTO> getMemberList() throws Exception;
	
	public void categoryRegister(CategoryDTO categoryDTO) throws Exception;
	
	public List<CategoryDTO> getCategoryList() throws Exception;
	
	public int categoryRemove() throws Exception;
	
	public CategoryDTO categoryRead(int category_no) throws Exception;
	
	public void productRegister(ProductDTO productDTO) throws Exception;
	
	public List<ProductDTO> getProductList() throws Exception;
	
	
}
