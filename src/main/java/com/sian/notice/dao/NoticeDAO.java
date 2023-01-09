package com.sian.notice.dao;

import java.util.List;

import com.sian.common.page.Criteria;
import com.sian.notice.dto.NoticeDTO;

public interface NoticeDAO {
	public int noticeRegister(NoticeDTO noticeDTO);
	
	
	
	public List<NoticeDTO> getListPaging(Criteria cri);
	
	public int getTotal();
	
	public List<NoticeDTO> noticeList();
	
	public NoticeDTO getNotice(int notice_no);
	
	public int noticeModify(NoticeDTO noticeDTO);
	
	public int noticeDelete(int notice_no);
}
