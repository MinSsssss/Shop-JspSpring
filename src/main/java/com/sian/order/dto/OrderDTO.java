package com.sian.order.dto;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import lombok.Data;
@JsonInclude(Include.NON_NULL)
@Data
public class OrderDTO {
	private Long order_no;
	private String mem_id;
	private String receiver_name;
	private String receiver_tel;
	private String receiver_addr;
	
	private Date order_date;
	private String order_request_msg;
	private String order_status;
	
	private int total_price;
	
	private String merchant_uid;//주문id
	private String imp_uid;//결제id
	
	private List<OrderDetailDTO> orderDetailList;
}
