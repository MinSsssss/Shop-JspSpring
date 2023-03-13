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
	

	/*
	 * ADMIN ONLY
	 */
	/*
	 * 주문 리스트 조회
	 */
	@GetMapping("/admin/order/orderList")
	public void orderList(Model model) {
		
		
		List<OrderDTO> orderList = orderService.getOrderList();

		model.addAttribute("orderList", orderList);
	}
	
	
	/*
	 * MEMBER ONLY @PreAuthorize("hasRole('ROLE_MEMBER')")
	 */
	
	@PostMapping("/order/complete")
	@ResponseBody
	public int paymentComplete(@RequestBody OrderDTO orderDTO) throws Exception {
		    System.out.println("토큰체크1");
		    String token = payService.getToken();
		    System.out.println("토큰체크2 : " + token);
		    // 결제 완료된 금액
		    String amount = payService.paymentInfo(orderDTO.getImp_uid(), token);
		    System.out.println("이거냐orderController");
		    int res = 1;
		    
		    if (orderDTO.getTotal_price() != Long.parseLong(amount)) {
				res = 0;
				// 결제 취소
				payService.payMentCancle(token, orderDTO.getImp_uid(), amount,"결제 금액 오류");
				return res;
			}
		    
			orderService.orderInsert(orderDTO);
			
			return res;
		 
	}
	
	/*
	 * 결제 상세 정보 저장 및 장바구니에서 삭제
	 */
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
	}
	/*
	 * 주문 정보 리스트 조회
	 */
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
	
	/*
	 * 주문정보 상세 페이지
	 */
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
	
	
	/*
	 * 주문 삭제
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@PostMapping("/order/orderDelete")
	public void orderDelete(@RequestParam("order_no") Long order_no) {

		orderService.orderDelete(order_no);
		
	}
	
	
	/*
	 * 배송상태 수정
	 */
	@ResponseBody
	@PostMapping("/admin/order/deliveryComplete")
	public boolean deliveryComplete(@RequestBody OrderDTO orderDTO) {
		
		return orderService.updateStatus(orderDTO);
	}
	

}
