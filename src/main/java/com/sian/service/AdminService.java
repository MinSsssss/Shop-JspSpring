package com.sian.service;

import java.util.List;

import com.sian.domain.CategoryDTO;
import com.sian.domain.FaqDTO;
import com.sian.domain.MemberDTO;
import com.sian.domain.NoticeDTO;
import com.sian.domain.ProductDTO;

public interface AdminService {
	public List<MemberDTO> getMemberList() throws Exception;
	
	public void categoryRegister(CategoryDTO categoryDTO) throws Exception;
	
	public List<CategoryDTO> getCategoryList(String category_class) throws Exception;
	
	public int categoryDelete(int category_no);
	
	public String getCategoryClass(int category_no);
	
	public CategoryDTO categoryRead(int category_no) throws Exception;
	
	public void productRegister(ProductDTO productDTO) throws Exception;
	
	public List<ProductDTO> getProductList() throws Exception;
	
	public int faqRegister(FaqDTO faqDTO);
	
	public List<FaqDTO> faqList();
	
	public List<FaqDTO> selectFaqList(int category_no);
	
	public FaqDTO getFaq(int faq_no);
	
	public int faqModify(FaqDTO faqDTO);
	
	public int faqDelete(int faq_no);
	
	public int noticeRegister(NoticeDTO noticeDTO);
	
	public List<NoticeDTO> noticeList();
	
	public NoticeDTO getNotice(int notice_no);
	
	public int noticeModify(NoticeDTO noticeDTO);
	
	public int noticeDelete(int notice_no);
	
	
}
