package com.sian.order.service;

import com.sian.order.dto.CourierDTO;

public interface CourierService {
	public void insert(CourierDTO courierDTO);
	
	public CourierDTO get(Long order_no);
}
