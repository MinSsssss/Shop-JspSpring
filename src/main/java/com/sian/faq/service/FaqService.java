package com.sian.faq.service;

import java.util.List;

import com.sian.common.page.Criteria;
import com.sian.faq.dto.FaqDTO;

public interface FaqService {
	
	public boolean faqRegister(FaqDTO faqDTO);
	
	public int getTotal();
	
	public int getTotal(int category_no);

	public List<FaqDTO> faqList(Criteria cri);
	
	public List<FaqDTO> faqList(int category_no,Criteria cri);
	
	public FaqDTO getFaq(int faq_no);
	
	public boolean faqModify(FaqDTO faqDTO);
	
	public boolean faqDelete(int faq_no);
}
