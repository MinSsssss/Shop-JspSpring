package com.sian.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.sian.member.dao.MemberDAO;
import com.sian.member.dto.MemberDTO;
import com.sian.security.domain.CustomUser;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Getter
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ =  {@Autowired} )
	private MemberDAO memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + username);

		
		MemberDTO dto = memberMapper.read(username);

		
		log.warn("queried by member mapper: " + dto);

		return dto == null ? null : new CustomUser(dto);
	} 

}
