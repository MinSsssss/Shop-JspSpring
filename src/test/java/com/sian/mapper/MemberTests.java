package com.sian.mapper;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sian.domain.MemberDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
  })
@Log4j
public class MemberTests {

	
  @Setter(onMethod_ = @Autowired)
  private PasswordEncoder pwencoder;
  
  @Setter(onMethod_ = @Autowired)
  private DataSource ds;
  
  @Test
  public void testInsertMember() {

    String sql = "insert into tbl_member(mem_id,mem_pwd,mem_name,mem_email,mem_tel) values (?,?,?,?,?)";
    
    for(int i = 0; i < 2; i++) {
      
      Connection con = null;
      PreparedStatement pstmt = null;
      
      try {
        con = ds.getConnection();
        pstmt = con.prepareStatement(sql);
        
        pstmt.setString(2, pwencoder.encode("pw" + i));
        
        if(i <1) {
          
          pstmt.setString(1, "member"+i);
          pstmt.setString(3,"test"+i);
          pstmt.setString(4,"test@"+i);
          pstmt.setString(5,"010-111"+i);
          
        }
       
        else {
            
            pstmt.setString(1, "admin"+i);
            pstmt.setString(3,"test"+i);
            pstmt.setString(4,"test@"+i);
            pstmt.setString(5,"010-111"+i);
            
          }
        
        pstmt.executeUpdate();
        
      }catch(Exception e) {
        e.printStackTrace();
      }finally {
        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
        if(con != null) { try { con.close();  } catch(Exception e) {} }
        
      }
    }//end for
  }
  
  
  
  @Test
  public void testInsertAuth() {
    
    
    String sql = "insert into tbl_member_auth (mem_id, auth) values (?,?)";
    
    for(int i = 0; i < 2; i++) {
      
      Connection con = null;
      PreparedStatement pstmt = null;
      
      try {
        con = ds.getConnection();
        pstmt = con.prepareStatement(sql);
      
        
        if(i <1) {
          
          pstmt.setString(1, "member"+i);
          pstmt.setString(2,"ROLE_USER");
          
        }else {
          
          pstmt.setString(1, "admin"+i);
          pstmt.setString(2,"ROLE_ADMIN");
          
        }
        
        pstmt.executeUpdate();
        
      }catch(Exception e) {
        e.printStackTrace();
      }finally {
        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
        if(con != null) { try { con.close();  } catch(Exception e) {} }
        
      }
    }//end for
  }
	
	

  
}


