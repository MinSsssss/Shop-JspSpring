package com.sian.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sian.domain.CategoryDTO;
import com.sian.domain.FaqDTO;
import com.sian.domain.MemberDTO;
import com.sian.domain.NoticeDTO;
import com.sian.domain.ProductDTO;
import com.sian.mapper.CategoryMapper;
import com.sian.mapper.FaqMapper;
import com.sian.mapper.MemberMapper;
import com.sian.mapper.NoticeMapper;
import com.sian.mapper.ProductMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService{
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	@Setter(onMethod_ = @Autowired)
	private CategoryMapper categoryMapper;
	@Setter(onMethod_ = @Autowired)
	private ProductMapper productMapper;
	@Setter(onMethod_ = @Autowired)
	private FaqMapper faqMapper;
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper noticeMapper;
	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		return memberMapper.getList();
		
	}

	@Override
	public void categoryRegister(CategoryDTO categoryDTO) throws Exception {
		categoryMapper.insert(categoryDTO);
		
	}

	@Override
	public List<CategoryDTO> getCategoryList(String category_class) throws Exception {
		
		return categoryMapper.getList(category_class);
	}

	@Override
	public int categoryDelete(int category_no)  {
		
		return categoryMapper.categoryDelete(category_no);
	}

	@Override
	public CategoryDTO categoryRead(int category_no) throws Exception {
		
		return categoryMapper.categoryRead(category_no);
	}
	@Override
	public String getCategoryClass(int category_no) {
		
		return categoryMapper.getCategoryClass(category_no);
	}
	

	@Override
	public void productRegister(ProductDTO productDTO) throws Exception {
		productMapper.insert(productDTO);
		
	}

	@Override
	public List<ProductDTO> getProductList() throws Exception {
		
		return productMapper.getList();
	}

	@Override
	public int faqRegister(FaqDTO faqDTO) {
		return faqMapper.faqRegister(faqDTO);
		
		
	}

	@Override
	public List<FaqDTO> faqList() {
		
		return faqMapper.faqList();
	}

	@Override
	public List<FaqDTO> selectFaqList(int category_no) {
		
		return faqMapper.selectFaqList(category_no);
	}

	@Override
	public FaqDTO getFaq(int faq_no) {
		
		return faqMapper.getFaq(faq_no);
	}

	@Override
	public int faqModify(FaqDTO faqDTO) {
		
		return faqMapper.faqModify(faqDTO);
	}

	@Override
	public int faqDelete(int faq_no) {
		
		return faqMapper.faqDelete(faq_no);
	}

	@Override
	public int noticeRegister(NoticeDTO noticeDTO) {
		
		return noticeMapper.noticeRegister(noticeDTO);
	}

	@Override
	public List<NoticeDTO> noticeList() {
		
		return noticeMapper.noticeList();
	}

	@Override
	public NoticeDTO getNotice(int notice_no) {
		
		return noticeMapper.getNotice(notice_no);
	}

	@Override
	public int noticeModify(NoticeDTO noticeDTO) {
		
		return noticeMapper.noticeModify(noticeDTO);
	}

	@Override
	public int noticeDelete(int notice_no) {
		
		return noticeMapper.noticeDelete(notice_no);
	}


	
}
