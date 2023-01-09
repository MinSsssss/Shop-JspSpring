package com.sian.notice.service;

import java.util.List;

import com.sian.common.page.Criteria;
import com.sian.notice.dto.NoticeDTO;


public interface NoticeService {
public int noticeRegister(NoticeDTO noticeDTO);
	
	public List<NoticeDTO> noticeList();
	
	public int getTotal();
	
	public List<NoticeDTO> getListPaging(Criteria cri);
	
	public NoticeDTO getNotice(int notice_no);
	
	public int noticeModify(NoticeDTO noticeDTO);
	
	public int noticeDelete(int notice_no);
}
