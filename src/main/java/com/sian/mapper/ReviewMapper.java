package com.sian.mapper;

import java.util.List;

import com.sian.domain.ReviewDTO;

public interface ReviewMapper {
	public void reviewRegister(ReviewDTO reviewDTO);
	
	public List<ReviewDTO> reviewList(String mem_id);
	
	public int findReview(Long order_detail_no);
	
	public ReviewDTO getReview(ReviewDTO reviewDTO);
}
