package com.sian.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.sian.member.dto.MemberDTO;

public class CustomUserDetails implements UserDetails{
	private MemberDTO memberDTO;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		return this.memberDTO.getAuthList().stream() 
				  .map(auth-> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList());
	}

	@Override
	public String getPassword() {
		
		return memberDTO.getMem_pwd();
	}

	@Override
	public String getUsername() {
		
		return memberDTO.getMem_id();
	}

	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}

	@Override
	public boolean isEnabled() {
		
		return true;
	}

}
