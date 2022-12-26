package com.sian.mapper;

import java.util.List;


import com.sian.domain.OrderDTO;
import com.sian.domain.OrderDetailDTO;


public interface OrderMapper {

	
	public void orderInsert(OrderDTO orderDTO) throws Exception;
	
	public OrderDetailDTO getOrderDetailList(int product_no);
}
