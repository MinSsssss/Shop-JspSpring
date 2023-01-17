package com.sian.order.service;

import org.springframework.stereotype.Service;

import com.sian.order.dao.CourierDAO;
import com.sian.order.dto.CourierDTO;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class CourierServcieImpl implements CourierService{
	
	private final CourierDAO courierDAO; 
	
	@Override
	public void insert(CourierDTO courierDTO) {
		
		courierDAO.insert(courierDTO);
	}

	@Override
	public CourierDTO get(Long order_no) {
		
		return courierDAO.get(order_no);
	}

}
