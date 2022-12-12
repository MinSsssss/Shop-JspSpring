package com.sian.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sian.domain.AuthVO;
import com.sian.domain.MemberDTO;
import com.sian.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Controller

public class CommonController {
	@Setter (onMethod_ = @Autowired)
	private MemberService memberService;
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "Access Denied");
	}

	@GetMapping("/login")
	public void loginInput(String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
	 @GetMapping("/register") 
	 public void registerPage() {
	 
	 }
	 
	 @PostMapping("/registerProc") 
	 public String registerAction(@Valid MemberDTO memberDTO,AuthVO authVO) throws Exception{
		 
		 memberService.register(memberDTO,authVO);
		 return "redirect:/login";
	 }
	 
	 	@ResponseBody
		@PostMapping("/idChk")
	 	public int idChk(MemberDTO memberDTO) throws Exception{
		 int result=memberService.idChk(memberDTO);
		 return result;
	 }
	 
	 
		/* @GetMapping("/logout") */
	/*public String logoutGET() {

		log.info("custom logout");
		return "redirect:/member";
	}*/

	
	 
	 

}
