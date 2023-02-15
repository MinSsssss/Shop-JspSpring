package com.sian.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sian.common.page.Criteria;
import com.sian.common.page.PageDTO;
import com.sian.notice.dto.NoticeDTO;
import com.sian.notice.service.NoticeService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class NoticeController {
	private final NoticeService noticeService;
	
	/*
	 * ALL
	 */
	/*
	 * 공지사항 리스트 조회
	 */
	@GetMapping({"/admin/notice/noticeList","/notice/noticeList"})
	 public void noticeList(Model model,Criteria cri) {
		 
		model.addAttribute("noticeList", noticeService.getListPaging(cri));
		
		int total = noticeService.getTotal();
		
		PageDTO page = new PageDTO(cri, total);
		
		model.addAttribute("page",page);
	 }
	
	
	
	/*
	 * ADMIN ONLY
	 */
	/*
	 * 공지사항 등록 페이지
	 */
	@GetMapping("/admin/notice/noticeRegister")
	 public void noticeRegister() {
		 
	 }
	
	/*
	 * 공지사항 단일 조회 및 수정 페이지
	 */
	 @GetMapping({"/notice/noticeRead","/admin/notice/noticeRead","/admin/notice/noticeModify"})
	 public void noticeRead(@RequestParam("notice_no") int notice_no,Model model) {
		 model.addAttribute("notice", noticeService.getNotice(notice_no));
		 
	 }
	 
	 /*
	  * 공지사항 등록 
	  */
	 @PostMapping("/admin/notice/noticeRegisterProc")
	 public String noticeRegisterProc(NoticeDTO noticeDTO,RedirectAttributes rttr) {
		 if(noticeService.noticeRegister(noticeDTO)==1) {
			 rttr.addFlashAttribute("msg","successRegister");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failRegister");
		 }
		 return "redirect:/admin/notice/noticeList";
	 }
	 
	 /*
	  * 공지사항 수정
	  */
	 @PostMapping("/admin/notice/noticeModifyProc")
	 public String noticeModifyProc(NoticeDTO noticeDTO,RedirectAttributes rttr) {
		 if(noticeService.noticeModify(noticeDTO)) {
			 rttr.addFlashAttribute("msg","successModify");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failModify");
		 }
		 return "redirect:/admin/notice/noticeList";
	 } 
	 
	 /*
	  * 공지사항 삭제
	  */
	 @PostMapping("/admin/notice/noticeDeleteProc")
	 public String noticeDeleteProc(int notice_no,RedirectAttributes rttr) {
		 
		 if(noticeService.noticeDelete(notice_no)) {
			 rttr.addFlashAttribute("msg","successDelete");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failDelete");
		 }
		 
		 return "redirect:/admin/notice/noticeList";
	 }
	
}
