package com.sian.common.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sian.member.service.MemberService;
import com.sian.order.dto.PayInfoDTO;
import com.sian.order.service.CourierService;
import com.sian.order.service.OrderService;
import com.sian.order.service.PayService;
import com.sian.product.service.ProductService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
public class IamPortController {
	private IamportClient client = new IamportClient("1473321038674052", "ZshfrZBon2Ia6H6FHhse0hxT9lX7LD9hP2I42Ocv1MOqHHTPO0nj7QStK44L1dvZ1r2P80yg6GpVeCm5");
	
	private final OrderService orderService;
	
	private final MemberService memberService;
	
	/*
	 * 결제관련 
	 */
	@ResponseBody
	@PostMapping(value="/order/verify_iamport/{imp_uid}", produces = MediaType.APPLICATION_JSON_VALUE)
	public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
			System.out.println("imp_uid : " + imp_uid);
			System.out.println(client.paymentByImpUid(imp_uid));
			return client.paymentByImpUid(imp_uid);
		}
	
	@GetMapping("/order/pay_info")
	@ResponseBody
	public ResponseEntity<Long> payInfoPOST(Model model,HttpServletRequest request, HttpServletResponse response,
		        @RequestParam String imp_uid,HttpSession session,
		        Authentication authentication) throws Exception {
			IamportResponse<Payment> result = client.paymentByImpUid(imp_uid);
			PayInfoDTO payInfoDTO = new PayInfoDTO();
			payInfoDTO.setMem_id(memberService.getId(authentication));
			payInfoDTO.setOrder_no(Long.parseLong(result.getResponse().getMerchantUid()));
			payInfoDTO.setPay_method(result.getResponse().getPayMethod());
			payInfoDTO.setPay_name(result.getResponse().getName());
			payInfoDTO.setPay_amount(result.getResponse().getAmount().longValue());
			
			orderService.insertPayInfo(payInfoDTO);
			
			
			payInfoDTO = orderService.getLastPay(payInfoDTO);
			System.out.println(payInfoDTO.getOrder_no());
			
			model.addAttribute("payInfoDTO", payInfoDTO);
			
			
			return new ResponseEntity<Long>(payInfoDTO.getPay_no(), HttpStatus.OK);
	}
	
	/*
	 * 본인인증
	 */
	
	
	
}
