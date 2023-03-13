package com.sian.persistence;



import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sian.test.TestMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MapperTest {
private static final Logger log = Logger.getLogger(MapperTest.class);
	
	@Autowired
	private TestMapper testMapper;
	
	@Test
	public void getTime() {
		log.info("'현재 시각 : " + testMapper.getTime()+"'");
		
	}
}
