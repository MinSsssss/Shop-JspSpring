package com.sian.qna.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sian.common.page.Criteria;
import com.sian.qna.dao.QnaDAO;
import com.sian.qna.dto.QnaDTO;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class QnaServiceImpl implements QnaService{
	private final QnaDAO qnaDAO;
	
	public long insertQna(QnaDTO qnaDTO) {
		
		return qnaDAO.insertQna(qnaDTO);
	}
	
	@Override
	public int getTotal() {
		
		return qnaDAO.getTotal();
	}
	
	@Override
	public List<QnaDTO> getQnaList(Criteria cri) {
		
		return qnaDAO.getQnaList(cri);
	}
	
	@Override
	public List<QnaDTO> qnaMemberList(String mem_id,Criteria cri) {
		
		return qnaDAO.qnaMemberList(mem_id,cri);
	}

	@Override
	public QnaDTO getQna(Long qna_no) {
		
		return qnaDAO.getQna(qna_no);
	}

	@Override
	public boolean qnaDelete(Long qna_no) {
		
		if(qnaDAO.qnaDelete(qna_no)==0) {
			return false;
		}
		return true;
		
	}

	

	
	
}
