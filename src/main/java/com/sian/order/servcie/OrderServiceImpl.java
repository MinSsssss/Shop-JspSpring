package com.sian.order.servcie;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sian.order.dao.OrderDAO;
import com.sian.order.dto.OrderDTO;
import com.sian.order.dto.OrderDetailDTO;

import lombok.Setter;
@Service
public class OrderServiceImpl implements OrderService{
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDAO;
	
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
	public List<OrderDetailDTO> getOrderDetailList(Long order_no) {
		
		return orderDAO.getOrderDetailList(order_no);
	}
	@Override
	public int orderDelete(Long order_no) {
		
		return orderDAO.orderDelete(order_no);
	}
	@Override
	public OrderDetailDTO getReviewView(Long order_detail_no) {
		
		return orderDAO.getReviewView(order_detail_no);
		
	}
}	
