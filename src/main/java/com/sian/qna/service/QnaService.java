package com.sian.qna.service;

import java.util.List;

import com.sian.common.page.Criteria;
import com.sian.qna.dto.QnaDTO;

public interface QnaService {
	public long insertQna(QnaDTO qnaDTO);
	
	public int getTotal();
	
	public int getTotal(String mem_id);
	
	public List<QnaDTO> getQnaList(Criteria cri);
	
	public List<QnaDTO> qnaMemberList(String mem_id,Criteria cri);
	
	public QnaDTO getQna(Long qna_no);
	
	public boolean qnaDelete(Long qna_no);
	
	
}
