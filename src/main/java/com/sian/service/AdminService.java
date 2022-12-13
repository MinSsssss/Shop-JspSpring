package com.sian.service;

import java.util.List;

import com.sian.domain.MemberDTO;

public interface AdminService {
	public List<MemberDTO> getList() throws Exception;
}
