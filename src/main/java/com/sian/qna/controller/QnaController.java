package com.sian.qna.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sian.category.service.CategoryService;
import com.sian.common.page.Criteria;
import com.sian.common.page.PageDTO;
import com.sian.member.service.MemberService;
import com.sian.qna.dto.QnaDTO;
import com.sian.qna.service.QnaService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class QnaController {
	private final CategoryService categoryService;
	private final QnaService qnaService;
	private final MemberService memberService;
	
	/*
	 * qna 게시판 조회 페이지
	 */
	@GetMapping({"/qna/qnaBoard","/admin/qna/qnaList"})
	public void qnaBoard(@RequestParam("category_no") int category_no,Criteria cri,Model model) {
		int total = 0;
		if(category_no==0) {
			model.addAttribute("qnaList",qnaService.getQnaList(cri));
			total = qnaService.getTotal();
		}
		else {
			model.addAttribute("qnaList",qnaService.getQnaList(category_no, cri));
			total = qnaService.getTotal(category_no);
		}
		model.addAttribute("category",categoryService.getCategoryList("qna"));
		
		PageDTO page = new PageDTO(cri, total);
		
		model.addAttribute("page",page);
	}
	
	/*
	 * qna 게시판 단일 조회
	 */
	@GetMapping("/qna/qnaBoardRead")
	public void qnaBoardRead(@RequestParam("qna_no") Long qna_no,Model model) {
		model.addAttribute("qna", qnaService.getQna(qna_no));
	}
	
	
	/*
	 * qna 작성 페이지
	 */
	
	@GetMapping("/qna/qnaWrite")
	public void qnaWriteView(Model model) {
		model.addAttribute("qnaCategoryList", categoryService.getCategoryList("qna"));
	}
	
	/*
	 * qna 작성
	 */
	@PostMapping("/qna/qnaWriteProc")
	public String qnaWriteProc(QnaDTO qnaDTO,Authentication authentication) {
		//String mem_id = memberService.getId(authentication);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		 if(authentication!=null) {
			 qnaDTO.setQna_pwd(memberService.getPwd(authentication));
			 
		 }
		 else {
			
			 qnaDTO.setQna_pwd(passwordEncoder.encode(qnaDTO.getQna_pwd()));
			
		 }
		 qnaService.insertQna(qnaDTO);
		 
		 return "redirect:/qna/qnaRead?qna_no="+ qnaDTO.getQna_no();
	}
	

	
	/*
	 * 회원 및 관리자 qna 단일 조회
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping({"/qna/qnaRead","/admin/qna/qnaRead"})
	public void qnaRead(@RequestParam("qna_no") Long qna_no,Model model) {
		model.addAttribute("qna", qnaService.getQna(qna_no));
	}
	
	/*
	 * 회원 qna 삭제 
	 */
	@ResponseBody
	@PostMapping("/qna/qnaDelete")
	public String reviewDelete(@RequestParam("qna_no")Long qna_no,RedirectAttributes rttr) {
		
		if(qnaService.qnaDelete(qna_no)) {
			rttr.addFlashAttribute("msg","successDelete");
			return "redirect:/qna/qnaList";
		}
		else {
			rttr.addFlashAttribute("msg", "falseDelete");
			return "redirect:/qna/qnaRead?qna_no="+qna_no;
		}

	}
	
	/*
	 * qna 비밀번호 확인
	 */
	@PostMapping("/qna/pwdChk")
	public String qnaPwdChk(QnaDTO qnaDTO,RedirectAttributes rttr) {
		QnaDTO qna = qnaService.getQna(qnaDTO.getQna_no());
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if(passwordEncoder.matches(qnaDTO.getQna_pwd(), qna.getQna_pwd())) {
			return "redirect:/qna/qnaBoardRead?qna_no="+qnaDTO.getQna_no();
		}
		else {
			rttr.addFlashAttribute("msg","false");
			return "redirect:/qna/qnaBoard";
		}
	}
	
	/*
	 * 회원 qna 리스트 조회
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/qna/qnaList")
	public void qnaList(Authentication authentication, Model model,Criteria cri) {
		String mem_id= memberService.getId(authentication);
		
		model.addAttribute("qnaList", 
				qnaService.qnaMemberList(mem_id,cri));
		
		int total = qnaService.getTotal(mem_id);
		
		PageDTO page = new PageDTO(cri, total);
		
		System.out.println(page);
		
		model.addAttribute("page",page);
	}
	
	/*
	 * 관리자 qna 답변 작성
	 */
	@ResponseBody
	@PostMapping("/admin/qna/qnaAnswerRegister")
	public boolean qnaAnswerRegister(@RequestBody QnaDTO qnaDTO) {
		QnaDTO qna = qnaService.getQna(qnaDTO.getQna_no());
		System.out.println(qnaDTO.getQna_answer());
		qna.setQna_answer(qnaDTO.getQna_answer());
		qna.setQna_status("답변 완료");
		
		return qnaService.qnaAnswerRegister(qna);
	}
	
}
