package com.sian.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.junit.Test;

public class MariaDBConnectionTest {
	private static final Logger log = Logger.getLogger(MariaDBConnectionTest.class);
	String url = "jdbc:mariadb://localhost:3306/sian?user=sian&password=1234";

	@Test
	public void connectionTest() {
		try {
			// Class.forName("org.mariadb.jdbc.Driver"); 주석처리 가능 
			// 자동으로 JDBC드라이버를 호출함(현재 버전2.6.2, 최소 지원 버전은 잘 모르겠음)
			Connection connection = DriverManager.getConnection(url);
			log.info("### connection : " +  connection + " - 연결 성공 ####");
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
