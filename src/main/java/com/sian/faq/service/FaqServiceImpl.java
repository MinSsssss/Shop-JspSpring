package com.sian.faq.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.sian.common.page.Criteria;
import com.sian.faq.dao.FaqDAO;
import com.sian.faq.dto.FaqDTO;


import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class FaqServiceImpl implements FaqService{
	
	private final FaqDAO faqDAO;
	
	
	@Override
	public boolean faqRegister(FaqDTO faqDTO) {
		if(faqDAO.faqRegister(faqDTO)==1) {
			return true;
		}
		return false;

	}
	@Override
	public int getTotal() {
		return faqDAO.getTotal();
	}
	@Override
	public int getTotal(int category_no) {
		return faqDAO.getCategoryTotal(category_no);
	}
	
	
	@Override
	public List<FaqDTO> faqList(Criteria cri) {
		
		return faqDAO.faqList(cri);
	}

	@Override
	public List<FaqDTO> faqList(int category_no,Criteria cri) {
		
		return faqDAO.selectFaqList(category_no,cri.getPageNum(),cri.getAmount());
	}

	@Override
	public FaqDTO getFaq(int faq_no) {
		
		return faqDAO.getFaq(faq_no);
	}

	@Override
	public boolean faqModify(FaqDTO faqDTO) {
		if(faqDAO.faqModify(faqDTO)==1) {
			return true;
		}
		return false;
		
	}

	@Override
	public boolean faqDelete(int faq_no) {
		if(faqDAO.faqDelete(faq_no)==1) {
			return true;
		}
		return false;
	}
}
