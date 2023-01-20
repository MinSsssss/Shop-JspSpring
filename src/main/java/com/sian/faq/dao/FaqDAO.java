package com.sian.faq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sian.common.page.Criteria;
import com.sian.faq.dto.FaqDTO;

public interface FaqDAO {
	public int faqRegister(FaqDTO faqDTO);
	
	public int getTotal();
	
	public int getCategoryTotal(int category_no);
	
	public List<FaqDTO> faqList(Criteria cri);	
	
	public List<FaqDTO> selectFaqList(@Param("category_no")int catrgory_no,
			@Param("pageNum") int pageNum,@Param("amount") int amount);
	
	public FaqDTO getFaq(int faq_no);
	
	public int faqModify(FaqDTO faqDTO);
	
	public int faqDelete(int faq_no);
}
