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
//	@GetMapping({"/admin/notice/noticeList","/notice/noticeList"})
//	 public void noticeList(Model model) {
//		 
//		 model.addAttribute("noticeList", noticeService.noticeList());
//	 }
	@GetMapping({"/admin/notice/noticeList","/notice/noticeList"})
	 public void noticeList(Model model,Criteria cri) {
		 
		model.addAttribute("noticeList", noticeService.getListPaging(cri));
		
		int totaol = noticeService.getTotal();
		
		PageDTO page = new PageDTO(cri, totaol);
		
		model.addAttribute("page",page);
	 }
	
	/*
	 * ADMIN ONLY
	 */
	@GetMapping("/admin/notice/noticeRegister")
	 public void noticeRegister() {
		 
	 }
	 @GetMapping({"/admin/notice/noticeRead","/admin/notice/noticeModify"})
	 public void noticeRead(@RequestParam("notice_no") int notice_no,Model model) {
		 model.addAttribute("notice", noticeService.getNotice(notice_no));
		 
	 }
	 
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
	 
	 
	 @PostMapping("/admin/notice/noticeModifyProc")
	 public String noticeModifyProc(NoticeDTO noticeDTO,RedirectAttributes rttr) {
		 if(noticeService.noticeModify(noticeDTO)==1) {
			 rttr.addFlashAttribute("msg","successModify");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failModify");
		 }
		 return "redirect:/admin/notice/noticeList";
	 }
	 
	 
	 

	 @PostMapping("/admin/notice/noticeDeleteProc")
	 public String noticeDeleteProc(int notice_no,RedirectAttributes rttr) {
		 
		 if(noticeService.noticeDelete(notice_no)==1) {
			 rttr.addFlashAttribute("msg","successDelete");
		 }
		 else {
			 rttr.addFlashAttribute("msg","failDelete");
		 }
		 
		 return "redirect:/admin/notice/noticeList";
	 }
	/*
	 * MEMBER ONLY @PreAuthorize("hasRole('ROLE_MEMBER')")
	 */
	
	 
	 
}
