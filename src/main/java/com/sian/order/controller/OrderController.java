package com.sian.order.controller;


import java.io.IOException;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.sian.member.service.MemberService;
import com.sian.order.dto.CourierDTO;
import com.sian.order.dto.OrderDTO;
import com.sian.order.dto.OrderDetailDTO;
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
public class OrderController {
	
	private final OrderService orderService;
	
	private final MemberService memberService;
	
	private final ProductService productService;
	
	private final PayService payService;
	
	private final CourierService courierService;
	
	private IamportClient client = new IamportClient("1473321038674052", "ZshfrZBon2Ia6H6FHhse0hxT9lX7LD9hP2I42Ocv1MOqHHTPO0nj7QStK44L1dvZ1r2P80yg6GpVeCm5");
	 
	/*
	 * ALL
	 */
	

	
	/*
	 * ADMIN ONLY
	 */
	@GetMapping("/admin/order/orderList")
	public void orderList(Model model) {
		
		
		List<OrderDTO> orderList = orderService.getOrderList();
		
//		Long order_no=0L;
//		List<OrderDetailDTO> orderDetailList = null;
//		for(int i=0; i<orderList.size(); i++) {
//			order_no = orderList.get(i).getOrder_no();
//			orderDetailList = orderService.getOrderDetailList(order_no);
//			orderList.get(i).setOrderDetailList(orderDetailList);
//			System.out.println(orderDetailList);
//			
//		}	

		model.addAttribute("orderList", orderList);
	}
	
	@GetMapping("/order/orderRead")
	public void orderRead(@RequestParam("order_no") Long order_no, Model model) {
		
	}
	
	
	/*
	 * MEMBER ONLY @PreAuthorize("hasRole('ROLE_MEMBER')")
	 */
	
	@ResponseBody
	@PostMapping(value="/order/verify_iamport/{imp_uid}", produces = MediaType.APPLICATION_JSON_VALUE)
	public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
			System.out.println("imp_uid : " + imp_uid);
			System.out.println(client.paymentByImpUid(imp_uid));
			return client.paymentByImpUid(imp_uid);
		}
	
	@PostMapping("/order/complete")
	@ResponseBody
	public int paymentComplete(String imp_uid, String merchant_uid,String total_price,HttpSession session
			,@RequestBody OrderDTO orderDTO) throws Exception {
		    
		    String token = payService.getToken();
		    
		    // 결제 완료된 금액
		    String amount = payService.paymentInfo(orderDTO.getImp_uid(), token);
		    
		    int res = 1;
		    
		    if (orderDTO.getTotal_price() != Long.parseLong(amount)) {
				res = 0;
				// 결제 취소
				payService.payMentCancle(token, orderDTO.getImp_uid(), amount,"결제 금액 오류");
				return res;
			}
		    System.out.println(orderDTO);
			orderService.orderInsert(orderDTO);
			System.out.println("res" + res);
			return res;
		 
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
	
	
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/order/orderDetails")
	public void orderDetails(@RequestParam HashMap<String, Object> orderDetailList,
			Authentication authentication) throws JsonMappingException, JsonProcessingException{
		System.out.println("orderDetailList : " + orderDetailList );
		String json = (String) orderDetailList.get("paramList");
		System.out.println("json : " + json);
		ObjectMapper mapper = new ObjectMapper();
		
		List<OrderDetailDTO> orderDetails = mapper.readValue(json, new TypeReference<List<OrderDetailDTO>>() {
		});
		
		System.out.println("orderDetails : " + orderDetails);
		String mem_id = memberService.getId(authentication);

		Map<String,Object> map = new HashMap<String, Object>();
		for (int i = 0; i < orderDetails.size(); i++) {
			System.out.println(orderDetails.size());
			
			int product_no = productService.getProductNo(orderDetails.get(i).getProduct_name());
			
			orderDetails.get(i).setProduct_no(product_no);
			
			map.put("product_no", product_no);
			map.put("mem_id", mem_id);
			
			
			orderService.orderDetailInsert(orderDetails.get(i));
			orderService.orderCartDelete(map);
			
	
		}
		
		
		//return "redirect:/member/auth/cartView";
	}

	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/order/orderList")
	public String orderList(Authentication authentication,Model model) throws IOException {
		
		String mem_id = memberService.getId(authentication);
		List<OrderDTO> orderList = orderService.getOrderList(mem_id);
		
		Long order_no=0L;
		List<OrderDetailDTO> orderDetailList = null;
		for(int i=0; i<orderList.size(); i++) {
			order_no = orderList.get(i).getOrder_no();
			orderDetailList = orderService.getOrderDetailList(order_no);
			orderList.get(i).setOrderDetailList(orderDetailList);
			System.out.println(orderDetailList);
			
		}
		
		
		
		model.addAttribute("orderList", orderList);
		return "/order/orderList";
		
		
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER') || hasRole('ROLE_ADMIN')")
	@GetMapping({"/order/orderDetailView","/admin/order/orderDetailView"})
	public void orderDetailView(Long order_no,Model model) {
		
		CourierDTO courierDTO = courierService.get(order_no);
		
		OrderDTO orderDTO = orderService.getOrder(order_no);
		List<OrderDetailDTO> orderDetailList = orderService.getOrderDetailList(order_no);
		orderDTO.setOrderDetailList(orderDetailList);
		
		model.addAttribute("orderList", orderDTO);
		
		if(courierDTO != null) {
			model.addAttribute("courier",courierDTO);
		}
		
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@PostMapping("/order/orderDelete")
	public void orderDelete(@RequestParam("order_no") Long order_no) {

		orderService.orderDelete(order_no);
		
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@PostMapping("/order/checkout")
	public Long checkout(@RequestBody OrderDTO orderDTO,
			Authentication authentication)  {
		
		
		String mem_id = memberService.getId(authentication);
		orderDTO.setMem_id(mem_id);
		orderService.orderInsert(orderDTO);
		Long order_no = orderService.getOrderNo(mem_id);
		
		return order_no;
	}
	
	
	
	
//	public int orderCancle(OrderDTO orderDTO) throws Exception {
//		if(!orderDTO.getImp_uid().equals("")) {
//			String token = payService.getToken(); 
//			Long price = orderDTO.getTotal_price();
//			Long refundPrice = price ;
//			payService.payMentCancle(token, orderDTO.getImp_uid(), refundPrice+"", "환불");
//		}
//		
//		return adminDAO.orderCancle((orderList.getOrderNum()));
//}
}
