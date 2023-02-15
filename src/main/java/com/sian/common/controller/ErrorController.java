package com.sian.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MissingPathVariableException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ErrorController {
	@ExceptionHandler(NoHandlerFoundException.class)
    public String Error404(HttpServletRequest request,NoHandlerFoundException e,Model model) {
		
        model.addAttribute("code","존재하지 않는 페이지 입니다.");
        return "/error/error";
    }
	@ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public String Error405(HttpRequestMethodNotSupportedException e,Model model) {
		
		model.addAttribute("code","잘못된 요청입니다.");
        return "/error/error";
    }
	
	

}
