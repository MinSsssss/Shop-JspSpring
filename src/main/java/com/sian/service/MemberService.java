package com.sian.service;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;

import com.sian.domain.AuthVO;
import com.sian.domain.MemberDTO;
import com.sian.security.domain.CustomUser;

public interface MemberService {
	
	
	public void register(MemberDTO memberDTO,AuthVO authVO) throws Exception;
	
	public boolean memberDrop(MemberDTO memberDTO) throws Exception;
	
	
	public int idChk(MemberDTO memberDTO) throws Exception;
	
	public boolean pwdChk(MemberDTO memberDTO) throws Exception;
	
	public boolean memberModify(MemberDTO memberDTO) throws Exception;
}
