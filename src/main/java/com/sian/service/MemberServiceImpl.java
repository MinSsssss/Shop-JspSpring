package com.sian.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder passwordEncoder;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pswordEncoder;
	

	@Override
	public void register(MemberDTO memberDTO, AuthVO authVO) throws Exception {

		List<AuthVO> list = new ArrayList<>();
		authVO.setMem_id(memberDTO.getMem_id());
		list.add(authVO);

		memberDTO.setMem_pwd(passwordEncoder.encode(memberDTO.getMem_pwd()));
		memberDTO.setAuthList(list);
		memberMapper.insert(memberDTO);

	}
	@Override
	public int idChk(MemberDTO memberDTO) throws Exception {
		int result = memberMapper.idChk(memberDTO);
		return result;
	}


	@Override
	public String getId(Authentication authentication) throws Exception {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		MemberDTO thisMem = memberMapper.read(userDetails.getUsername());
		String thisMemId = thisMem.getMem_id();
		return thisMemId;
	}

	@Override
	public boolean memberDrop(MemberDTO memberDTO) throws Exception {

		SecurityContextHolder.clearContext();
		return memberMapper.memberDrop(memberDTO) == 1;
	}
	
	//현재 사용자의 비밀번호를 가져옴
	@Override
	public String getPwd(Authentication authentication) throws Exception {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		MemberDTO thisMem = memberMapper.read(userDetails.getUsername());
		String thisMemId = thisMem.getMem_id();
		
		String thisMemPwd = memberMapper.getPwd(thisMemId);
		return thisMemPwd;
	}
	//getPwd() 로 사용자의 비밀번호를 가져와서 입력한 비밀번호와 비교.
	@Override
	public boolean pwdChk(MemberDTO memberDTO,Authentication authentication) throws Exception {

		if (passwordEncoder.matches(memberDTO.getMem_pwd(), this.getPwd(authentication))) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean memberModify(MemberDTO memberDTO) throws Exception {
		memberDTO.setMem_pwd(passwordEncoder.encode(memberDTO.getMem_pwd()));
		return memberMapper.memberModify(memberDTO) == 1;

	}

}
