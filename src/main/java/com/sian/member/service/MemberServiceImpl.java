package com.sian.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sian.cart.service.CartService;
import com.sian.member.dao.MemberDAO;
import com.sian.member.dto.AuthVO;
import com.sian.member.dto.MemberDTO;
import com.sian.product.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService{
	
	private final MemberDAO memberDAO;
	
	
	private final BCryptPasswordEncoder passwordEncoder;


	@Transactional
	@Override
	public void register(MemberDTO memberDTO, AuthVO authVO)  {

//		List<AuthVO> list = new ArrayList<>();
//		authVO.setMem_id(memberDTO.getMem_id());
//		list.add(authVO);

		memberDTO.setMem_pwd(passwordEncoder.encode(memberDTO.getMem_pwd()));
		//memberDTO.setAuthList(list);
		memberDAO.insert(memberDTO);
		memberDAO.insertAuth(memberDTO.getMem_id());

	}
	@Override
	public boolean idChk(String mem_id)  {
		if(memberDAO.idChk(mem_id)==1) {
			return true;
		}
		return false;
	}


	@Override
	public String getId(Authentication authentication){
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		MemberDTO thisMem = memberDAO.read(userDetails.getUsername());
		String thisMemId = thisMem.getMem_id();
		return thisMemId;
	}

	@Override
	public boolean memberDrop(MemberDTO memberDTO)  {

		SecurityContextHolder.clearContext();
		return memberDAO.memberDrop(memberDTO) == 1;
	}
	
	
	@Override
	public String getPwd(Authentication authentication)  {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		MemberDTO thisMem = memberDAO.read(userDetails.getUsername());
		String thisMemId = thisMem.getMem_id();
		
		String thisMemPwd = memberDAO.getPwd(thisMemId);
		return thisMemPwd;
	}
	
	@Override
	public boolean pwdChk(MemberDTO memberDTO,Authentication authentication)  {

		if (passwordEncoder.matches(memberDTO.getMem_pwd(), this.getPwd(authentication))) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean memberModify(MemberDTO memberDTO)  {
		memberDTO.setMem_pwd(passwordEncoder.encode(memberDTO.getMem_pwd()));
		return memberDAO.memberModify(memberDTO) == 1;

	}
	
	@Override
	public List<MemberDTO> getMemberList()  {
		return memberDAO.getList();
		
	}
	


}
