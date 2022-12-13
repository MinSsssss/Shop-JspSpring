package com.sian.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sian.domain.AuthVO;
import com.sian.domain.MemberDTO;

public interface MemberMapper {
	
	public MemberDTO read(String mem_id);
	
	public void register(MemberDTO member,AuthVO authVO);
	
	public int idChk(MemberDTO memberDTO) throws Exception;
	
	public String getPwd(String mem_id) throws Exception;
	
	public int memberDrop(MemberDTO memberDTO)throws Exception;
	
	public int memberModify(MemberDTO memberDTO) throws Exception;
	
	public void insert(MemberDTO memberDTO) throws Exception;
	
	
	
	
	
	
}
