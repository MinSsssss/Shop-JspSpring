package com.sian.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sian.domain.ReviewDTO;
import com.sian.mapper.ReviewMapper;

import lombok.Setter;
@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;
	
	@Override
	public void reviewRegister(ReviewDTO reviewDTO) {
		reviewMapper.reviewRegister(reviewDTO);
		
	}

}
