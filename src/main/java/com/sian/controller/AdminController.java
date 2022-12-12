package com.sian.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;


import com.sian.service.MemberService;

import lombok.AllArgsConstructor;
@AllArgsConstructor
@Controller
@RequestMapping("/admin/**")
public class AdminController {
	private MemberService service;
	

	
}
