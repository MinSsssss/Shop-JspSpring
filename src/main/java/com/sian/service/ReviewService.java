package com.sian.service;

import java.util.List;

import com.sian.domain.ReviewDTO;

public interface ReviewService {
	public void reviewRegister(ReviewDTO reviewDTO);
	
	public List<ReviewDTO> reviewList(String mem_id);
	
	public int findReview(Long order_detail_no);
	
	public ReviewDTO getReview(ReviewDTO reviewDTO);
	
	public boolean reviewModify(ReviewDTO reviewDTO);
	
	public boolean reviewDelete(Long review_no);
}
