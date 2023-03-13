package com.sian.test;

import org.apache.ibatis.annotations.Select;

public interface TestMapper {
	public String getTime();
	
//	@Select("SELECT NOW()")
//	public String getTime2();
}
