package com.sian.mapper;

import java.util.List;

import com.sian.domain.NoticeDTO;

public interface NoticeMapper {
	public int noticeRegister(NoticeDTO noticeDTO);
	
	public List<NoticeDTO> noticeList();
	
	public NoticeDTO getNotice(int notice_no);
	
	public int noticeModify(NoticeDTO noticeDTO);
	
	public int noticeDelete(int notice_no);
}
