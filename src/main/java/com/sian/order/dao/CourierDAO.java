package com.sian.order.dao;

import com.sian.order.dto.CourierDTO;

public interface CourierDAO {
	public void insert(CourierDTO courierDTO);
	
	public CourierDTO get(Long order_no);
}
