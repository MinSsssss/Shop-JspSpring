package com.sian.order.service;

import java.io.IOException;

public interface PaymentService {
	public String getToken() throws IOException;
	
	public int paymentInfo(String imp_uid,String access_token) throws IOException ;
	
	public void paymentCancle(String access_token,String imp_uid,String amount,String reason);
	
	
}
