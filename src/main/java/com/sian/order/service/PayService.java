package com.sian.order.service;

import java.io.IOException;

import org.json.simple.parser.ParseException;



public interface PayService {
	public String getToken() throws IOException;

	public String paymentInfo(String imp_uid,String access_token) throws IOException, ParseException;
	
	public void payMentCancle(String access_token,String imp_uid,String amount,String reason) throws IOException, ParseException ;
	
	
}
