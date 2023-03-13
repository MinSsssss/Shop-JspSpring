package com.sian.member.dao;



import java.util.List;

import com.sian.member.dto.AuthVO;
import com.sian.member.dto.MemberDTO;

public interface MemberDAO {
	
	public MemberDTO read(String mem_id);
	
	/* public void register(MemberDTO member,AuthVO authVO) ; */
	
	
	
	public int idChk(String mem_id) ;
	
	public String getPwd(String mem_id) ;
	
	public int memberDrop(MemberDTO memberDTO);
	
	public int memberModify(MemberDTO memberDTO) ;
	
	public int insert(MemberDTO memberDTO) ;
	
	public void insertAuth(String mem_id);
	
	public List<MemberDTO> getList() ;
	
	
	
	
}
