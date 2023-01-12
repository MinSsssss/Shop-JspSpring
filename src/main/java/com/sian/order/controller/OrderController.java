package com.sian.order.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sian.cart.service.CartService;
import com.sian.member.service.MemberService;
import com.sian.order.dto.OrderDTO;
import com.sian.order.dto.OrderDetailDTO;
import com.sian.order.service.OrderService;
import com.sian.order.service.PaymentService;
import com.sian.product.service.ProductService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class OrderController {
	
	private final OrderService orderService;
	
	private final MemberService memberService;
	
	private final ProductService productService;
	
	private final PaymentService paymentService;
	
	

	

//	@PostMapping("/order/payment/complete")
//	public ResponseEntity<String> paymentComplete(HttpSession session, OrderInfo orderInfo, long totalPrice, @AuthenticationPrincipal LoginService user) throws IOException {
//	    
//	    String token = paymentService.getToken();
//	    
//	    System.out.println("토큰 : " + token);
//	    // 결제 완료된 금액
//	    int amount = paymentService.paymentInfo(orderInfo.getImpUid(), token);
//	    
//	    try {
//	       
//	        
//	        CartList cartList = (CartList) session.getAttribute("cartList");
//	        // 실제 계산 금액 가져오기
//	        long orderPriceCheck = orderService.orderPriceCheck(cartList)  - usedPoint;
//	        
//	        // 계산 된 금액과 실제 금액이 다를 때
//	        if (orderPriceCheck != amount) {
//	            paymentService.payMentCancle(token, orderInfo.getImpUid(), amount, "결제 금액 오류");
//	            return new ResponseEntity<String>("결제 금액 오류, 결제 취소", HttpStatus.BAD_REQUEST);
//	        }
//	        
//	        orderService.order(cartList, orderInfo, user);
//	        session.removeAttribute("cartList");
//	        
//	        return new ResponseEntity<>("주문이 완료되었습니다", HttpStatus.OK);
//	        
//	    } catch (Exception e) {
//	        paymentService.payMentCancle(token, orderInfo.getImpUid(), amount, "결제 에러");
//	        return new ResponseEntity<String>("결제 에러", HttpStatus.BAD_REQUEST);
//	    }
//	    
//	    
//	}
	
	 
	/*
	 * ALL
	 */
	

	
	/*
	 * ADMIN ONLY
	 */
	
	/*
	 * MEMBER ONLY @PreAuthorize("hasRole('ROLE_MEMBER')")
	 */
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/order/orderDetails")
	public void orderDetails(@RequestParam HashMap<String, Object> orderDetailList,
			OrderDetailDTO orderDetailDTO,
			Authentication authentication) throws JsonMappingException, JsonProcessingException{
		String json = (String) orderDetailList.get("paramList");
		ObjectMapper mapper = new ObjectMapper();

		List<OrderDetailDTO> orderDetails = mapper.readValue(json, new TypeReference<List<OrderDetailDTO>>() {
		});
		String mem_id = memberService.getId(authentication);

		
		for (int i = 0; i < orderDetails.size(); i++) {
			System.out.println(orderDetails.size());
			Map<String,Object> map = new HashMap<String, Object>();
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
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/order/orderDetailView")
	public String orderDetailView(Long order_no,Model model,
			Authentication authentication) {
		
		OrderDTO orderDTO = orderService.getOrder(order_no);
		List<OrderDetailDTO> orderDetailList = orderService.getOrderDetailList(order_no);
		orderDTO.setOrderDetailList(orderDetailList);
		
		model.addAttribute("orderList", orderDTO);

		return "/order/orderDetailView";
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
}
