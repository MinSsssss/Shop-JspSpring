package com.sian.faq.service;

import java.util.List;


import org.springframework.stereotype.Service;


import com.sian.faq.dao.FaqDAO;
import com.sian.faq.dto.FaqDTO;


import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class FaqServiceImpl implements FaqService{
	
	private final FaqDAO faqDAO;
	
	
	@Override
	public int faqRegister(FaqDTO faqDTO) {
		return faqDAO.faqRegister(faqDTO);
		
		
	}

	@Override
	public List<FaqDTO> faqList() {
		
		return faqDAO.faqList();
	}

	@Override
	public List<FaqDTO> selectFaqList(int category_no) {
		
		return faqDAO.selectFaqList(category_no);
	}

	@Override
	public FaqDTO getFaq(int faq_no) {
		
		return faqDAO.getFaq(faq_no);
	}

	@Override
	public int faqModify(FaqDTO faqDTO) {
		
		return faqDAO.faqModify(faqDTO);
	}

	@Override
	public int faqDelete(int faq_no) {
		
		return faqDAO.faqDelete(faq_no);
	}
}
