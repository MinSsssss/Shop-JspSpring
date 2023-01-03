package com.sian.service;

import java.util.List;

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

	@Override
	public List<ReviewDTO> reviewList(String mem_id) {
		
		return reviewMapper.reviewList(mem_id);
	}

	@Override
	public int findReview(Long order_detail_no) {
		
		return reviewMapper.findReview(order_detail_no);
	}

	@Override
	public ReviewDTO getReview(ReviewDTO reviewDTO) {
		
		return reviewMapper.getReview(reviewDTO);
	}

	@Override
	public boolean reviewModify(ReviewDTO reviewDTO) {
		if(reviewMapper.reviewModify(reviewDTO)==0) {
			return false;
		}
		return true;
		
	}

	@Override
	public boolean reviewDelete(Long review_no) {
		if(reviewMapper.reviewDelete(review_no)==0) {
			return false;
		}
		return true;
	}

}
