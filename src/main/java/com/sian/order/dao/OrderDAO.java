package com.sian.order.dao;

import java.util.List;
import java.util.Map;

import com.sian.order.dto.OrderDTO;
import com.sian.order.dto.OrderDetailDTO;
import com.sian.order.dto.PayInfoDTO;


public interface OrderDAO {
	public List<OrderDTO> orderListAll();
	
	public Long orderInsert(OrderDTO orderDTO);
	
	public void orderDetailInsert(OrderDetailDTO orderDetailDTO);
	
	public void orderCartDelete(Map<String,Object>map);
	
	public Long getOrderNo(String mem_id);
	
	public OrderDTO getOrder(Long order_no);
	
	public List<OrderDTO> getOrderList(String mem_id);
	
	public List<OrderDTO> getOrderListAll();
	
	public List<OrderDetailDTO> getOrderDetailList(Long order_no);
	
	public int orderDelete(Long order_id);
	
	public OrderDetailDTO getReviewView(Long order_detail_no);
	
	public void insertPayInfo(PayInfoDTO payDTO);
	
	public PayInfoDTO getLastPay(PayInfoDTO payDTO);
	
	public int updateStatus(OrderDTO orderDTO);
	
	public List<OrderDTO> recentOrder();
}
