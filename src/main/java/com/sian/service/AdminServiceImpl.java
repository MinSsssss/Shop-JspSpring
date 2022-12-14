package com.sian.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sian.domain.CategoryDTO;
import com.sian.domain.MemberDTO;
import com.sian.domain.ProductDTO;
import com.sian.mapper.CategoryMapper;
import com.sian.mapper.MemberMapper;
import com.sian.mapper.ProductMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService{
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	@Setter(onMethod_ = @Autowired)
	private CategoryMapper categoryMapper;
	@Setter(onMethod_ = @Autowired)
	private ProductMapper productMapper;
	
	
	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		return memberMapper.getList();
		
	}

	@Override
	public void categoryRegister(CategoryDTO categoryDTO) throws Exception {
		categoryMapper.insert(categoryDTO);
		
	}

	@Override
	public List<CategoryDTO> getCategoryList() throws Exception {
		
		return categoryMapper.getList();
	}

	@Override
	public int categoryRemove() throws Exception {
		
		return categoryMapper.delete();
	}

	@Override
	public CategoryDTO categoryRead(int category_no) throws Exception {
		
		return categoryMapper.categoryRead(category_no);
	}

	@Override
	public void productRegister(ProductDTO productDTO) throws Exception {
		productMapper.insert(productDTO);
		
	}

	@Override
	public List<ProductDTO> getProductList() throws Exception {
		
		return productMapper.getList();
	}
	
}
