package com.sian.order.service;

import java.util.List;


import java.util.Map;

import org.springframework.stereotype.Service;

import com.sian.order.dao.OrderDAO;
import com.sian.order.dto.OrderDTO;
import com.sian.order.dto.OrderDetailDTO;
import com.sian.order.dto.PayInfoDTO;


import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrderService{
	
	private final OrderDAO orderDAO;
	

	
	@Override
	public void orderInsert(OrderDTO orderDTO) {
		
		orderDAO.orderInsert(orderDTO);
		
	}
	@Override
	public void orderDetailInsert(OrderDetailDTO orderDetailDTO) {
		
		orderDAO.orderDetailInsert(orderDetailDTO);	
	}
	@Override
	public void orderCartDelete(Map<String,Object>map){
		orderDAO.orderCartDelete(map);
		
	}
	@Override
	public Long getOrderNo(String mem_id){

		return orderDAO.getOrderNo(mem_id);
	}
	@Override
	public OrderDTO getOrder(Long order_no) {
		
		return orderDAO.getOrder(order_no);
	}
	
	@Override
	public List<OrderDTO> getOrderList(String mem_id) {
		
		return orderDAO.getOrderList(mem_id);
	}
	
	@Override
	public List<OrderDTO> getOrderList() {
		
		return orderDAO.getOrderListAll();
	}
	
	@Override
	public List<OrderDetailDTO> getOrderDetailList(Long order_no) {
		
		return orderDAO.getOrderDetailList(order_no);
	}
	@Override
	public boolean orderDelete(Long order_no) {
		if(orderDAO.orderDelete(order_no)==0) {
			return false;
		}
		return true;
	}
	@Override
	public OrderDetailDTO getReviewView(Long order_detail_no) {
		
		return orderDAO.getReviewView(order_detail_no);
		
	}
	
	
	@Override
	public void insertPayInfo(PayInfoDTO payDTO) {
		orderDAO.insertPayInfo(payDTO);
		
	}
	@Override
	public PayInfoDTO getLastPay(PayInfoDTO payInfoDTO) {
		
		return orderDAO.getLastPay(payInfoDTO);
	}
	@Override
	public boolean updateStatus(OrderDTO orderDTO) {
		if(orderDAO.updateStatus(orderDTO)==0) {
			return false;
		}
		return true;
		
	}
	@Override
	public List<OrderDTO> recentOrder() {
		
		return orderDAO.recentOrder();
	}
	
	
	
	
}	
