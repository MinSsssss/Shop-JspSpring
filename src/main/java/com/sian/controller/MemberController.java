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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
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

	@ResponseBody
	@PostMapping("/auth/pwdChk")
	public int pwdChk(@RequestBody MemberDTO memberDTO, Authentication authentication) throws Exception {

		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		MemberDTO thisMem = mapper.read(userDetails.getUsername());
		String thisMemId = thisMem.getMem_id();
		String thisMemPwd = memberService.getPwd(thisMemId);
		
		System.out.println(thisMemPwd);
		System.out.println(memberDTO.getMem_pwd());
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if (passwordEncoder.matches(memberDTO.getMem_pwd(), thisMemPwd)) {
			System.out.println("성공");
			return 0;
		}
		System.out.println("실패");
		return 1;

	}

	@PostMapping("/auth/memberDropProc")
	public String memberDropProc(MemberDTO memberDTO, Authentication authentication, RedirectAttributes rttr)
			throws Exception {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		MemberDTO thisMem = mapper.read(userDetails.getUsername());

		String thisMemId = thisMem.getMem_id();
		String thisMemPwd = thisMem.getMem_pwd();

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

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
	public String memberModifyPwdChk(MemberDTO memberDTO, RedirectAttributes rttr) throws Exception {
		if (!memberService.pwdChk(memberDTO)) {
			rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/member/auth/memberModify";
		} else {

			return "redirect:/member/auth/memberModifyNext";
		}

	}

	@GetMapping("/auth/memberModifyNext")
	public void memberModifyNext() {

	}

	@PostMapping("/auth/memberModifyNextProc")
	public String memberModifyNextProc(MemberDTO memberDTO, RedirectAttributes rttr) throws Exception {

		if (memberService.memberModify(memberDTO)) {
			rttr.addFlashAttribute("msg", "수정되었습니다.");
			return "redirect:/member/auth/orderList";
		} else {
			rttr.addFlashAttribute("msg", "수정에 실패했습니다.");
			return "redirect:/member/auth/memberModifyNext";
		}

	}

}
