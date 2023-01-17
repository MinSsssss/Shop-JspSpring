package com.sian.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.sian.order.dto.CourierDTO;
import com.sian.order.service.CourierService;
import com.sian.order.service.OrderService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CourierController {
	private final CourierService courierService;
	
	private final OrderService orderService;
	
	@PostMapping("/admin/order/invoiceRegister")
	public String invoiceRegister(CourierDTO courierDTO) {
		System.out.println(courierDTO);
		courierService.insert(courierDTO);
		
		
		return "redirect:/admin/order/orderDetailView?order_no=" + courierDTO.getOrder_no();
	}
}
