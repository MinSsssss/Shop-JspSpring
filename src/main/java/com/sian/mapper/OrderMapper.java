package com.sian.mapper;

import java.util.List;
import java.util.Map;

import com.sian.domain.CartProductDTO;
import com.sian.domain.OrderDTO;
import com.sian.domain.OrderDetailDTO;


public interface OrderMapper {

	
	public void orderInsert(OrderDTO orderDTO) throws Exception;
	
	public void orderDetailInsert(OrderDetailDTO orderDetailDTO) throws Exception;
	
	public void orderCartDelete(Map<String,Object>map);
	
	public Long getOrderNo(String mem_id);
}
