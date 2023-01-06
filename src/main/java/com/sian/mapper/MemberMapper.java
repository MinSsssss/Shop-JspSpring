package com.sian.mapper;



import java.util.List;

import com.sian.domain.AuthVO;
import com.sian.domain.MemberDTO;

public interface MemberMapper {
	
	public MemberDTO read(String mem_id);
	
	public void register(MemberDTO member,AuthVO authVO) ;
	
	public int idChk(MemberDTO memberDTO) ;
	
	public String getPwd(String mem_id) ;
	
	public int memberDrop(MemberDTO memberDTO);
	
	public int memberModify(MemberDTO memberDTO) ;
	
	public int insert(MemberDTO memberDTO) ;
	
	public List<MemberDTO> getList() ;
	
	
	
	
}
