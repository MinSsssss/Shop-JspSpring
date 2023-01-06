package com.sian.faq.dao;

import java.util.List;

import com.sian.faq.dto.FaqDTO;

public interface FaqDAO {
	public int faqRegister(FaqDTO faqDTO);
	
	public List<FaqDTO> faqList();
	
	public List<FaqDTO> selectFaqList(int catrgory_no);
	
	public FaqDTO getFaq(int faq_no);
	
	public int faqModify(FaqDTO faqDTO);
	
	public int faqDelete(int faq_no);
}
