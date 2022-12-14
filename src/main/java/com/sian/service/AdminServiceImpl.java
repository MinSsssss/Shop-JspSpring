package com.sian.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sian.domain.CategoryDTO;
import com.sian.domain.MemberDTO;
import com.sian.mapper.CategoryMapper;
import com.sian.mapper.MemberMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService{
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	@Setter(onMethod_ = @Autowired)
	private CategoryMapper categoryMapper;
	
	
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
	
}
