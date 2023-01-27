package com.sian.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
    
	
	
	private String loginId;
	private String defaultUrl;
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		
		resultRedirectStrategy(request, response, auth);
//		log.warn("Login Success");
//
//		List<String> roleNames = new ArrayList<>();
//
//		auth.getAuthorities().forEach(authority -> {
//
//			roleNames.add(authority.getAuthority());
//
//		});
//
//		log.warn("ROLE NAMES: " + roleNames);
//
//		if (roleNames.contains("ROLE_ADMIN")) {
//
//			response.sendRedirect("/admin");
//			return;
//		}
//
//		if (roleNames.contains("ROLE_MEMBER")) {
//
//			response.sendRedirect("/");
//			return;
//		}
//
//		response.sendRedirect("/");
		
		
		
		
		
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getDefaultUrl() {
		return defaultUrl;
	}
	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}
	
	
	
	  protected void resultRedirectStrategy(HttpServletRequest request,
	  HttpServletResponse response, Authentication authentication) throws
	  IOException, ServletException { HttpSession session = request.getSession();
	  SavedRequest savedRequest = requestCache.getRequest(request, response);
	  
	  if(savedRequest!=null) { String targetUrl = savedRequest.getRedirectUrl();
	  if(targetUrl.contains("wishChk")) { String prevPage =
	  (String)session.getAttribute("prevPage");
	  
	  session.removeAttribute("prevPage"); redirectStratgy.sendRedirect(request,
	  response, prevPage); } else { redirectStratgy.sendRedirect(request, response,
	  targetUrl); }
	  
	  
	  } else { redirectStratgy.sendRedirect(request, response, defaultUrl); }
	  
	  }
	 
}


