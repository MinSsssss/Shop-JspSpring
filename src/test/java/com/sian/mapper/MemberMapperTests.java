package com.sian.mapper;


import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sian.member.dao.MemberDAO;
import com.sian.member.dto.MemberDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
  })
@Log4j
public class MemberMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MemberDAO mapper;
	
	@Setter(onMethod_ = @Autowired)
	  private PasswordEncoder pwencoder;
	  
	  @Setter(onMethod_ = @Autowired)
	  private DataSource ds;
	
	@Test
	public void testRead() {
		MemberDTO dto = mapper.read("admin2");
		
		log.info(dto);
		dto.getAuthList().forEach(authVO->log.info(authVO));
	}
	@Test
	public void testInsert() throws Exception{
		//String sql = "insert into tbl_member(mem_id,mem_pwd,mem_name,mem_email,mem_tel) values (?,?,?,?,?)";
		MemberDTO dto = new MemberDTO();
		dto.setMem_id("test");
		dto.setMem_pwd("1234");
		dto.setMem_name("test");
		dto.setMem_tel("1234");
		dto.setMem_email("qwe");
		
		mapper.insert(dto);
		log.info(dto);
	}
	@Test
	public void testDrop() throws Exception{
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMem_pwd(passwordEncoder.encode("vlsltl12"));
		memberDTO.setMem_id("cda01");
		
		 if(passwordEncoder.matches("vlsltl12",memberDTO.getMem_pwd())) {
		 log.info("ȸ��Ż��!!!!!!!!!!!"+ mapper.memberDrop(memberDTO)); 
		 }
		 
//		log.info("ȸ��Ż��!!!!!!!!!!!"+ mapper.memberDrop(memberDTO));
		
		
	}
	
	
//	@Test
//	public void testMemberDrop(MemberDTO memberDTO) throws Exception{
//		  
////		  BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		  memberDTO.setMem_id("cda09");
//		  memberDTO.setMem_pwd("vlsltl12");
//		  
//		  mapper.memberDrop(memberDTO);
//		  
//		  }
		 
	
	  
	 
}
