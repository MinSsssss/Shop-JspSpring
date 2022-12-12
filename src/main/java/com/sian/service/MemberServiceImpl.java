package com.sian.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.sian.domain.AuthVO;
import com.sian.domain.MemberDTO;
import com.sian.mapper.MemberMapper;
import com.sian.security.domain.CustomUser;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Setter (onMethod_= @Autowired)
	private MemberMapper mapper;
	@Setter (onMethod_= @Autowired)
	private BCryptPasswordEncoder passwordEncoder;
	
	/*
	 * @Setter (onMethod_= @Autowired) private PasswordEncoder pswordEncoder;
	 */
	

	@Override
	public void register(MemberDTO memberDTO,AuthVO authVO) throws Exception{
		
		List<AuthVO> list = new ArrayList<>();
		authVO.setMem_id(memberDTO.getMem_id());
		list.add(authVO);
		
		
		memberDTO.setMem_pwd(passwordEncoder.encode(memberDTO.getMem_pwd()));
		memberDTO.setAuthList(list);
		mapper.insert(memberDTO);
		
		
	}

	@Override
	public int idChk(MemberDTO memberDTO) throws Exception {
		int result = mapper.idChk(memberDTO);
		return result;
	}

	@Override
	public boolean memberDrop(MemberDTO memberDTO) throws Exception {

		SecurityContextHolder.clearContext();
		return mapper.memberDrop(memberDTO)==1;
	}

	@Override
	public boolean pwdChk(MemberDTO memberDTO) throws Exception {
		String thisMemPwd = mapper.read(memberDTO.getMem_id()).getMem_pwd();
		
		if(passwordEncoder.matches(memberDTO.getMem_pwd(),thisMemPwd )) {
			return true;
		}
		else {
			return false;
		}
		
		
	}

	@Override
	public boolean memberModify(MemberDTO memberDTO) throws Exception {
		
		if(mapper.memberModify(memberDTO)==1) {
			return true;
		}
		else {
			return false;
		}
		
	}

	

	
	

}
