package com.sian.notice.service;

import java.util.List;


import org.springframework.stereotype.Service;


import com.sian.notice.dao.NoticeDAO;
import com.sian.notice.dto.NoticeDTO;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class NoticeServiceImpl implements NoticeService{
	
	private final NoticeDAO noticeDAO;

	@Override
	public int noticeRegister(NoticeDTO noticeDTO) {
		
		return noticeDAO.noticeRegister(noticeDTO);
	}

	@Override
	public List<NoticeDTO> noticeList() {
		
		return noticeDAO.noticeList();
	}

	@Override
	public NoticeDTO getNotice(int notice_no) {
		
		return noticeDAO.getNotice(notice_no);
	}

	@Override
	public int noticeModify(NoticeDTO noticeDTO) {
		
		return noticeDAO.noticeModify(noticeDTO);
	}

	@Override
	public int noticeDelete(int notice_no) {
		
		return noticeDAO.noticeDelete(notice_no);
	}
}
