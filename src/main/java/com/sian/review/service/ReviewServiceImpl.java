package com.sian.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sian.cart.service.CartService;
import com.sian.member.service.MemberService;
import com.sian.product.service.ProductService;
import com.sian.review.dao.ReviewDAO;
import com.sian.review.dto.ReviewDTO;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RequiredArgsConstructor
@Service
public class ReviewServiceImpl implements ReviewService{
	
	
	private final ReviewDAO reviewDAO;
	
	@Override
	public void reviewRegister(ReviewDTO reviewDTO) {
		reviewDAO.reviewRegister(reviewDTO);
		
	}

	@Override
	public List<ReviewDTO> reviewList(String mem_id) {
		
		return reviewDAO.reviewList(mem_id);
	}

	@Override
	public int findReview(Long order_detail_no) {
		
		return reviewDAO.findReview(order_detail_no);
	}

	@Override
	public ReviewDTO getReview(ReviewDTO reviewDTO) {
		
		return reviewDAO.getReview(reviewDTO);
	}

	@Override
	public boolean reviewModify(ReviewDTO reviewDTO) {
		if(reviewDAO.reviewModify(reviewDTO)==0) {
			return false;
		}
		return true;
		
	}

	@Override
	public boolean reviewDelete(Long review_no) {
		if(reviewDAO.reviewDelete(review_no)==0) {
			return false;
		}
		return true;
	}

	@Override
	public List<ReviewDTO> getReviewList(int product_no) {
		
		return reviewDAO.getReviewList(product_no);
	}

	@Override
	public int reviewCount(int product_no) {
		
		return reviewDAO.reviewCount(product_no);
	}

	@Override
	public double reviewAvg(int product_no) {
		
		return reviewDAO.reviewAvg(product_no);
	}

}
