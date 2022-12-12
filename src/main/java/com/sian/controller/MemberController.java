package com.sian.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sian.domain.MemberDTO;
import com.sian.mapper.MemberMapper;
import com.sian.security.domain.CustomUser;
import com.sian.service.MemberService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/member/**")
public class MemberController {

	private MemberService memberService;

	private MemberMapper mapper;

	
	@GetMapping("/auth/orderList")
	public void orderList() {

	}
	@GetMapping("/auth/wishList")
	public void wishList() {

	}
	@GetMapping("/auth/qnaList")
	public void qnaList() {

	}
	@GetMapping("/auth/memberModify")
	public void memberModify() {

	}
	@GetMapping("/auth/memberDrop")
	public void memberDrop() {

	}

	@PostMapping("/auth/logout")
	public String logoutPost() {

		return "redirect:/member";
	}

	@PostMapping("/auth/memberDropProc")
	public String memberDropProc(MemberDTO memberDTO, Authentication authentication, RedirectAttributes rttr)
			throws Exception {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		MemberDTO thisMem = mapper.read(userDetails.getUsername());
		String thisMemPwd = thisMem.getMem_pwd();
		String thisMemId = thisMem.getMem_id();

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		System.out.println(thisMemPwd);
		if (passwordEncoder.matches(memberDTO.getMem_pwd(), thisMemPwd)) {
			memberDTO.setMem_id(thisMemId);
			if (memberService.memberDrop(memberDTO)) {
				rttr.addFlashAttribute("msg", "회원 탈퇴에 성공하였습니다.");
				System.out.println("성공");
				return "redirect:/member";
			} else {
				System.out.println("실패");
				rttr.addFlashAttribute("msg", "회원 탈퇴에 실패했습니다.");
				return "redirect:/member/auth/myPage";
			}

		} else {
			System.out.println("실패 비번틀림");
			rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/member/auth/myPage";
		}
	}
	@PostMapping("/auth/memberModify")
	public String memberModifyPwdChk(MemberDTO memberDTO,RedirectAttributes rttr ) 
		throws Exception{
		if(!memberService.pwdChk(memberDTO)) {
			rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "forward:/member/auth/memberModify";
		}else {
			
			return "forward:/member/auth/memberModifyNext";
		}
		
	}
	@PostMapping("/auth/memberModifyNext")
	public void memberModifyNext() {
		
	}

}
