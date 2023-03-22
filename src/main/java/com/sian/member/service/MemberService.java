package com.sian.member.service;

import java.util.List;

import org.springframework.security.core.Authentication;

import com.sian.member.dto.AuthVO;
import com.sian.member.dto.MemberDTO;

public interface MemberService {
	
	public void register(MemberDTO memberDTO,AuthVO authVO) ;
	
	public boolean memberDrop(MemberDTO memberDTO) ;
	
	public boolean idChk(String mem_id);
	
	public String getId(Authentication authentication);
	
	public String getPwd(Authentication authentication) ;
	
	public boolean pwdChk(MemberDTO memberDTO,Authentication authentication) ;
	
	public boolean memberModify(MemberDTO memberDTO) ;
	
	public List<MemberDTO> getMemberList() ;
}
