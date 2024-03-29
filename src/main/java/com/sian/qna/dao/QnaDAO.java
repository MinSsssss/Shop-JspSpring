package com.sian.qna.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sian.common.page.Criteria;
import com.sian.qna.dto.QnaDTO;

public interface QnaDAO {
	
	public long insertQna(QnaDTO qnaDTO);
	
	public int getTotal();
	
	public int getCategoryTotal(int category_no);
	
	public int getMemberTotal(String mem_id);
	
	public List<QnaDTO> getQnaList(Criteria cri);
	
	public List<QnaDTO> selectQnaList(@Param("category_no")int catrgory_no,
			@Param("pageNum") int pageNum,@Param("amount") int amount);
	
	public List<QnaDTO> qnaMemberList(@Param("mem_id") String mem_id,
			@Param("pageNum") int pageNum,@Param("amount") int amount);
	
	public QnaDTO getQna(Long qna_no);
	
	public int qnaDelete(Long qna_no);
	
	public int qnaAnswerRegister(QnaDTO qnaDTO);
	
	public List<QnaDTO> recentQna();
}
