package com.sian.member.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.sian.member.dto.MemberDTO;
import com.sian.member.service.MemberService;


import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MemberController {
	private final MemberService memberService;
	

	/*
	 * ALL
	 */
	
	
	/*
	 * 관리자 페이지 회원 리스트 조회
	 */
	@GetMapping("/admin/member/memberList")
	public void memberList(Model model) {
		model.addAttribute("memberList",memberService.getMemberList());
	}
	
	
	/*
	 * MEMBER ONLY @PreAuthorize("hasRole('ROLE_MEMBER')")
	 */

	/*
	 * 회원 탈퇴 페이지
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/member/memberDrop")
	public void memberDrop() {

	}
	/*
	 * 로그아웃
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/member/logout")
	public String logoutPost() {

		return "redirect:/member";
	}
	
	/*
	 * 회원 탈퇴
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/member/memberDropProc")
	public String memberDropProc(MemberDTO memberDTO, Authentication authentication, RedirectAttributes rttr)
			 {

		boolean pwdChk = false;
		pwdChk = memberService.pwdChk(memberDTO, authentication);

		if (pwdChk) {
			memberDTO.setMem_id(memberService.getId(authentication));
			if (memberService.memberDrop(memberDTO)) {
				return "redirect:/member";
				
			} else {
				return "redirect:/member/memberDrop";
				
			}
		} else {
			rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/member/memberDrop";
		}
	}
	
	
	/*
	 * 회원정보 수정 비밀번호 확인 페이지
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/member/memberModify")
	public void memberModify() {

	}
	
	/*
	 * 회원 정보 수정 비밀번호 확인
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/member/memberModify")
	public String memberModifyPwdChk(MemberDTO memberDTO, Authentication authentication, RedirectAttributes rttr)
			 {
		if (!memberService.pwdChk(memberDTO, authentication)) {
			rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/member/memberModify";
		} else {

			return "redirect:/member/memberModifyNext";
		}

	}
	
	/*
	 * 회원정보 수정 페이지
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/member/memberModifyNext")
	public String memberModifyNext(HttpServletRequest req) {
		String referer = req.getHeader("referer");
		
		
		if(referer != null && referer.contains("/member/memberModify")) {
			return "/member/memberModifyNext";
		}
		else {
			return "/member/memberModify";
		}
	}

	/*
	 * 회원정보 수정
	 */
	@PostMapping("/member/memberModifyNextProc")
	public String memberModifyNextProc(MemberDTO memberDTO)  {

		if (memberService.memberModify(memberDTO)) {

			return "redirect:/";
		}

		return "redirect:/member/memberModifyNext";

	}
	
	/*
	 * 비밀번호 확인
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@PostMapping("/member/pwdChk")
	public boolean pwdChk(@RequestBody MemberDTO memberDTO, Authentication authentication)  {
		
		return memberService.pwdChk(memberDTO, authentication);
	}

	
}
