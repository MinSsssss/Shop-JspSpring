package com.sian.qna.dao;

import java.util.List;

import com.sian.common.page.Criteria;
import com.sian.qna.dto.QnaDTO;

public interface QnaDAO {
	
	public long insertQna(QnaDTO qnaDTO);
	
	public int getTotal();
	
	public List<QnaDTO> getQnaList(Criteria cri);
	
	public List<QnaDTO> qnaMemberList(String mem_id,Criteria cri);
	
	public QnaDTO getQna(Long qna_no);
	
	public int qnaDelete(Long qna_no);
	
	
}
