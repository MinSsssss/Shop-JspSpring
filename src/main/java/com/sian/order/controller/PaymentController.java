package com.sian.order.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {

private IamportClient api;
	
	public PaymentController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("1473321038674052","ZshfrZBon2Ia6H6FHhse0hxT9lX7LD9hP2I42Ocv1MOqHHTPO0nj7QStK44L1dvZ1r2P80yg6GpVeCm5");
	}
		
	@ResponseBody
	@PostMapping(value="/verifyIamport/{imp_uid}", produces = MediaType.APPLICATION_JSON_VALUE)
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{		
			System.out.println("금액"+api.paymentByImpUid(imp_uid));
			return api.paymentByImpUid(imp_uid);
	}
	
}
